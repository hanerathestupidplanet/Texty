# Texty
Stack based esoteric programming language written in Lua

Was supposed to write a filesystem in Lua, decided to write an esolang instead out of boredom

Uses 7 commands

Note that ALL commands AND ARGUMENTS must be seperated by a newline.

// - Pushes values onto the stack

Usage:
//
hi
Pushes hi onto the stack

+ - Adds 2 values

Usage:
+
1
2
Adds the values at stack[1] and stack[2] together and saves them to +/

- - Does the same as + but subtracts.

+- - Gets input from user and saves it to --

Usage:
+-
--
Gets input and prints the input

Any other text will be printed normally.



Example program:
Addition program
+- - Gets input from user
// - Pushes it onto the stack
-- 
+- -Does it again
//
--
+ - Adds the 2 numbers from the stack
1 - Starts at 1 because of Lua
2
Answer is:
+/ - Outputs the answer
++ - Terminates
