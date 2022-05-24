# Christian Bautista
#
# HW 2: Use It or Lose It
#
# Due: September 30, 2019
#
# I pledge my honor that I have abided by the Stevens Honor System.
#
# Implements the use it or lose it method to two functions

def makeChange(val, coins):
    def recursiveStep(val, coins):
        if val == 0:
            return []
        elif coins == [] or val < 0:
            return [float("inf")]
        else:
            useIt = [coins[0]] + recursiveStep(val-coins[0], coins)
            loseIt = recursiveStep(val, coins[1:])
        if loseIt[-1] == float("inf"):
            return useIt
        elif useIt[-1] == float("inf"):
            return loseIt
        elif min(len(useIt), len(loseIt)) == len(useIt):
            return useIt
        elif min(len(useIt), len(loseIt)) == len(loseIt):
            return loseIt
        else:
            return float("inf")
    if recursiveStep(val, coins)[-1] == float("inf"):
        return [float("inf"), []]
    else:
        return [len(recursiveStep(val, coins)), recursiveStep(val,coins)]


def LCS(a,b):
    if not (a and b):
        return ""
    if (a[0] == b[0]):
        return a[0] + LCS(a[1:], b[1:])
    if len(LCS(a[1:], b)) > len(LCS(a, b[1:])):
        return LCS(a[1:], b)
    else:
        return LCS(a, b[1:])

def PLCS(a,b):
    word = LCS(a,b)
    def recursiveStep(original, result, counter):
        if result == "":
            return []
        elif original[0] == result[0]:
            if len(result) == 1:
                return [counter]
            else:
                return [counter] + recursiveStep(original[1:], result[1:], counter+1)
        else:
            return recursiveStep(original[1:], result, counter+1)
    if not word:
        return [[-1], [-1]]
    else:
        L1 = recursiveStep(a, word, 0)
        L2 = recursiveStep(b, word, 0)
        return [L1, L2]
