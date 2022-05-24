# Christian Bautista
#
# CS 115 Lab 9: Binary
#
# Due: October 24, 2019
#
# I pledge my honor that I have abided by the Stevens Honor System.
#
# Code 3 methods using the Harvey Mudd Miniature Machine Assembly Code.

# Max:
#  Write a hmmm function that gets two numbers,
#   then prints the larger of the two.
#  Assumptions: Both inputs are any integers
Max = """
00 read r1
01 read r2
02 sub r3 r1 r2
03 jeqzn r3 7     # r1 == r2 -> write r1
04 jgtzn r3 7     # r1 > r2 -> write r1
05 write r2
06 jumpn 08
07 write r1
08 halt
"""


# Power:
#  Write a hmmm function that gets two numbers,
#   then prints (No.1 ^ No.2).
#  Assumptions: No.1 is any integer, No.2 ≥ 0
Power = """
00 setn r3 1
01 setn r4 1
02 read r1
03 read r2
04 jeqzn r2 09    # exponent is 0
05 jeqzn r2 09    # start line
06 sub r2 r2 r4
07 mul r3 r3 r1
08 jgtzn r2 05
09 write r3
10 halt
"""


# Fibonacci
#  Write a hmmm function that gets one numner,
#   then prints the No.1st fibonacci number.
#  Assumptions: No.1 ≥ 0
#  Hint: You really don't want to implement
#   recursion in hmmm, try to find an
#   iterative method to compute your goal.
#  Tests: f(2) = 1
#         f(5) = 5
#         f(9) = 34
Fibonacci = """
00 setn r1 0
01 setn r2 1
02 setn r5 1
03 read r4
04 jeqzn r4 10
05 sub r4 r4 r5
06 copy r3 r2
07 add r2 r1 r2
08 copy r1 r3
09 jgtzn r4 05
10 write r1
11 halt
"""

# Set this variable to whichever program you want to execute
# when this file is loaded.
RunThis = Fibonacci

# Choose whether to use debug mode;
doDebug = False;

# When you press F5 in IDLE, the following code will
# load the assembler and simulator, then run them.
# You can interrupt with Ctrl-C; then re-start Python.

if __name__ == "__main__" : 
    import hmmm
    hmmm.main(RunThis, doDebug) # assemble and run in one line


