--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Data.Maybe
import           Data.Functor
import           Data.Map as M
import           Hakyll

main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "download/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile copyFileCompiler
        --compile compressCssCompiler

    match "**.markdown" $ version "metadata" $ do
        route $ setExtension "html"
        compile $ pandocCompiler

    match "**.markdown" $ do
        route $ setExtension "html"
        compile $ do
            pages <- loadAll ("**.markdown" .&&. hasVersion "metadata")
            id <- getUnderlying

            let menuCtx = listField "pages" (defaultContext `mappend`
                                             field "menu-class" (\item -> return $ if id == (setVersion Nothing $ itemIdentifier item)
                                                                                   then "selected-menu" else "menu"))
                                            (return pages)

            let pageCtx = menuCtx                   `mappend`
                          defaultContext            `mappend`
                          constField "title" "Home" `mappend`
                          constField "image" "/images/default.jpg"

            pandocCompiler >>= loadAndApplyTemplate "templates/default.html" pageCtx
                           >>= relativizeUrls

    match "templates/*" $ compile templateCompiler


