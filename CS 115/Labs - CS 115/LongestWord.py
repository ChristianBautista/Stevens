# Map Reduce Assignment
#
# Christian Bautista
#
# I pledge my honor that I have abided by the Stevens Honor System.

from functools import reduce # imports reduce function in order to use in code
wordList = ["Mary", "Had", "A", "Little", "Lamb"]
# NOTE: wordList can be filled with as many strings (words) as possible with varying lengths
# NOTE (cont.): The strings listed above are merely only an example so the program runs.
def getLen(s): # Given function from assignment hint
  return [len(s), s]
wordLenList = list(map(getLen, wordList)) # Contains individual lists with word lengths and strings
# print(wordLenList)
def findLongLen(a, b): # Function uses max to find the biggest number b/w two objects
  return max(a, b)
longestWordList = list(reduce(findLongLen, wordLenList)) # Results in a list of length 2 with the longest word and its length
print()
print("Longest Word: " + str(longestWordList[1]))
print("Word Length: " + str(longestWordList[0]))
