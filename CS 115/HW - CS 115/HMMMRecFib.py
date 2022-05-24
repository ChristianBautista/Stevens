# Christian Bautista
#
# CS 115 HW 4: HMMM Recursion - Fibonacci
#
# Due: November 13, 2019
#
# I pledge my honor that I have abided by the Stevens Honor System.
#
# Code the fibonacci recursive method using the Harvey Mudd Miniature Machine Assembly Code.

from importlib import reload as Rfrsh
import hmmm

RecFibSeq = """
00 setn r15 42
01 setn r11 42
02 read r1
03 copy r2 r1
04 calln r14 7
05 write r13
06 halt
07 jgtzn r1 10
08 setn r13 0
09 jumpr r14
10 addn r1 -1
11 jgtzn r1 14
12 setn r13 1
13 jumpr r14
14 addn r1 1
15 pushr r1 r15
16 addn r1 -5
17 copy r10 r1
18 jgtzn r1 20
19 setn r10 0
20 copy r1 r2
21 add r1 r1 r10
22 jgtzn r1 25
23 setn r13 0
24 jumpr r14
25 sub r1 r1 r10
26 addn r1 -1
27 pushr r1 r15
28 addn r1 -1
29 pushr r1 r15
30 addn r11 1
31 loadr r1 r11
32 calln r14 21
33 popr r1 r15
34 sub r1 r1 r2
35 jeqzn r1 5
36 add r1 r1 r2
37 addn r1 -1
38 jgtzn r1 41
39 jltzn r1 41
40 addn r13 1
41 jumpr r14
"""

runThis = RecFibSeq
doDebug = False

def main(runArg=runThis, debugArg=doDebug):
    Rfrsh(hmmm); hmmm.main(runArg, debugArg)

if __name__ == "__main__" :
    main()
