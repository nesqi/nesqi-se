---
title: The AI
---

The AI in Hexxagon
===

I have got numerous mails from people that wants to know how the AI algorithm
in Hexxagon works. I'll try to give my best answer here.

The algorithm I use is called alpha-beta and the basic principle of the
algorithm is to try all possible moves from a given position in the game and
see which one that leads to the best end-result.

Off course it's impossible to check all combinations of moves until the end of
the game since there would be too may of them. So the algorithm "only" check
all combinations 4 moves ahead. The number of moves to look ahead determines
how "smart" the computer will be. If you play at "normal" the computer looks 4
moves ahead.

To generate all possible moves from a given game-state I use bit-masks to
represent the board, the positions of the pieces and there colour. In
combination with bitwise operation like AND, OR and XOR I generate moves very
fast.

This is the tutorial I read to learn how alpha-beta works. It's really good!

[Chess Programming](http://www.gamedev.net/page/resources/_/technical/artificial-intelligence/chess-programming-part-i-getting-started-r1014)
