# Recursion Muscles Assignment
#
# Christian Bautista
#
# I pledge my honor that I have abided by the Stevens Honor System.

def findLenList(L):
    '''Finds the length of input list L'''
    if L == []:
        return 0
    else:
        return 1+findLenList(L[1:])
def findLenString(S):
    '''Finds the length of input string S'''
    if S == "":
        return 0
    else:
        return 1+findLenString(S[1:])

def dotProduct(L, K):
    '''Finds the dot product of 2 supposed lists L and K'''
    lenL = findLen(L)
    lenK = findLen(K)
    if lenL == 0 or lenK == 0:
        return 0
    elif lenL == 1 or lenK == 1:
        return L[0] * K[0]
    else:
        return L[0] * K[0] + dotProduct(L[1:], K[1:])

expandedList = []
lenS = 0
counter1 = 0
def expand(S):
    '''Classifies type of string S'''
    global lenS
    global expandedList
    expandedList = []
    lenS = findLenString(S)
    if lenS == 0:
        return []
    elif lenS == 1:
        return list(S)
    else:
        expand2Plus(S)
        return expandedList
def expand2Plus(S2):
    '''Expands the string S2 (which has a length greater than 2)''' 
    global expandedList
    global lenS
    global counter1
    if counter1 < lenS:
        expandedList.append(S2[0])
        counter1 += 1
    if counter1 < lenS:
        expand2Plus(S2[1:])
    else:
        counter1 = 0

counter2 = 0
lenL1 = 0
firstRun = True
isInList = False
lenL2 = 0
counter3 = 0
reRun = True
def deepMember(e, L):
    '''General deepMember function used for classifying the list L and tries to find a match to element e'''
    global counter2
    global lenL1
    global firstRun
    global isInList
    if(firstRun):
        counter2 = 0
        lenL1 = findLenList(L)
        isInList = False
        firstRun = False
    if counter2 < lenL1:
        if(isinstance(L[0], list)):
            deepMemberSub(e, L[0])
        elif L[0] == e:
            isInList = True
            firstRun = True
        counter2 += 1
        if counter2 < lenL1 and firstRun != True:
            deepMember(e, L[1:])
    firstRun = True
    return isInList
def deepMemberSub(e2, L2):
    '''deepMember function used for supposed sublists (L2) and compares their elements to e'''
    global isInList
    global lenL2
    global counter3
    global reRun
    if(reRun):
        lenL2 = findLenList(L2)
        counter3 = 0
        reRun = False
    if counter3 < lenL2:
        if(isinstance(L2[0], list)):
            reRun = True
            deepMemberSub(e2, L2[0])
        elif L2[0] == e2:
            counter3 = 0
            lenL2 = 0
            reRun = True
            isInList = True
            deepMember(e2, L2)
        counter3 += 1
        if counter3 < lenL2 and reRun != True:
            deepMemberSub(e2, L2[1:])
    reRun = True

counter4 = 0
consolidatedList = []
lenL3 = 0
initial = True
def removeAll(e, L):
    '''Removes element e from the surface level "not deep level" of list L'''
    global counter4
    global consolidatedList
    global lenL3
    global initial
    if(initial):
        lenL3 = findLenList(L)
        counter4 = 0
        consolidatedList = []
        initial = False
    if counter4 < lenL3:
        if L[0] != e:
            consolidatedList.append(L[0])
        counter4 += 1
        if counter4 < lenL3:
            removeAll(e, L[1:])
        else:
            initial = True
    return consolidatedList

def deepReverse(L):
    '''Reverses all elements in list L on all levels (surface and deep)'''
    def deepReverseHelper(L, reversedList):
        if L == []:
            return reversedList
        if isinstance(L[-1], list):
            # element in L is a list
            return deepReverseHelper(L[:-1], reversedList + [deepReverse(L[-1])])
        else:
            # element in L is not a list
            return deepReverseHelper(L[:-1], reversedList + [L[-1]])
    return deepReverseHelper(L, [])
