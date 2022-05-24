# Christian Bautista
#
# CS 115 Lab 6: Binary
#
# Due: October 4, 2019
#
# I pledge my honor that I have abided by the Stevens Honor System.
#
# Code 4 methods regarding binary.

B = []
def decimalToBinary(x):
    global B
    if x == 0:
        return []
    B = []
    def createList(x,n):
        global B
        if x >= 2**n:
            B.append(0)
            createList(x,n+1)
    def recursiveStep(x,n,count):
        global B
        if x < 2**n:
            if x == 2**(n-1):
                B[count] = 1
            else:
                B[count] = 1
                recursiveStep(x-2**(n-1),1,0)
        else:
            recursiveStep(x,n+1,count+1)
    createList(x,0)
    recursiveStep(x,1,0)
    return B
def binaryToDecimal(num):
    if num == [] or num == [0]:
        return 0
    def recursiveStep(L,n):
        if len(L) > 0:
            if L[0] == 1:
                return 2**n + recursiveStep(L[1:],n+1)
            else:
                return 0 + recursiveStep(L[1:],n+1)
        else:
            return 0
    return recursiveStep(num,0)
def incrementBinary(num):
    return decimalToBinary(binaryToDecimal(num)+1)
def addBinary(num1, num2):
    if (num1 == [] and num2 == []) or (num1 == [0] and num2 == [0]) or (num1 == [] and num2 == [0]) or (num1 == [0] and num2 == []):
        return []        
    def recursiveStep(num1, num2, binSum):
        if num1 == [] and len(num2) > 0:
            if binSum:
                if num2[0] == 1:
                    return [0] + recursiveStep([], num2[1:], True)
                else:
                    return [1] + num2[1:]
            else:
                if num2[0] == 1:
                    return [1] + num2[1:]
                else:
                    return [0] + num2[1:]
        elif num2 == [] and len(num1) > 0:
            if binSum:
                if num1[0] == 1:
                    return [0] + recursiveStep(num1[1:], [], True)
                else:
                    return [1] + num1[1:]
            else:
                if num1[0] == 1:
                    return [1] + num1[1:]
                else:
                    return [0] + num1[1:]
        elif len(num1) > 0 and len(num2) > 0:
            if num1[0] == 1 and num2[0] == 1:
                if binSum:
                    return [1] + recursiveStep(num1[1:], num2[1:], True)
                else:
                    return [0] + recursiveStep(num1[1:], num2[1:], True)
            elif (num1[0] == 1 and num2[0] == 0) or (num1[0] == 0 and num2[0] == 1):
                if binSum:
                    return [0] + recursiveStep(num1[1:], num2[1:], True)
                else:
                    return [1] + recursiveStep(num1[1:], num2[1:], False)
            else:
                if binSum:
                    return [1] + recursiveStep(num1[1:], num2[1:], False)
                else:
                    return [0] + recursiveStep(num1[1:], num2[1:], False)
        elif binSum:
            return [1]
        else:
            return []
    return recursiveStep(num1,num2,False)
        
            
