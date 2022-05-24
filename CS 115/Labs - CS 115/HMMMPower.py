# Christian Bautista
#
# CS 115 Lab 10: HMMM Recursion
#
# Due: November 4, 2019
#
# I pledge my honor that I have abided by the Stevens Honor System.
#
# Code 1 recursive method using the Harvey Mudd Miniature Machine Assembly Code.

# Power:
#  - Write a RECURSIVE hmmm function that gets two numbers,
#   then prints (No.1 ^ No.2).
#  - Assumptions: No.1 is any integer, No.2 ≥ 0
#  - 0 ^ 0 can either be 0 or 1.
#  - Your function MUST be recursive.
#   No points will be given for solutions that
#   do not use the hmmm recursive/stack structure
#   See week9.pdf for more insight into that.
Power = """
00 setn r15 100
01 read r1
02 read r2
03 calln r14 6
04 write r13
05 halt
06 jgtzn r2 9
07 setn r13 1
08 jumpr r14
09 jgtzn r1 12
10 setn r13 0
11 jumpr r14
12 pushr r1 r15
13 pushr r14 r15
14 addn r2 -1
15 calln r14 6
16 popr r14 r15
17 popr r1 r15
18 mul r13 r13 r1
19 jumpr r14
"""



# ~~~~~ Running ~~~~~~
import hmmm
import importlib

runThis = Power  # Change to the function you want to run
doDebug = False # Change to turn debug mode on/off

# call main() from the command line to run the program again
def main(runArg = runThis, debugArg = doDebug):
    importlib.reload(hmmm)
    hmmm.main(runArg, debugArg)

if __name__ == "__main__" : 
    main()
