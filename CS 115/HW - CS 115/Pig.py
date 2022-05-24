# Christian Bautista
#
# HW 5: Pig
#
# Due: November 29, 2019
#
# I pledge my honor that I have abided by the Stevens Honor System.
#
# Programs the 4-Dice Variant Game of Pig along with an AI.

'''
4-Dice Pig

Adapted from Java to Python by Justin Barish,  11/2018
Modified nov '19 by Toby Dalton

~ ~ ~

To exercise your looping ability, we're going to be filling in a bunch
of blanks. yay!

Pig is a game where players take turns rolling dice.
Traditionally, it's only 2, but this is a variant.

The goal is to have their total score reach a certain # of points.
Players take turns earning points by rolling dice.
Each roll adds that sum onto a round score, which my or may not be added
to their total score, dictated as below:

A person's turn lasts until they want to stop rolling or roll some 1s.

If at any point during the player's turn they roll one 1:
their round ends and their round score is added to their total score.

If they roll two 1s:
they lose all points for the round, and their turn is over.

Three 1s:
they lose all of their points in the game, and their turn is over.

If they recieve the luck of four 1s (four-eyed snake ::S):
they immediately lose the game.

Whenever the player decide to stop their turn, their round points are 
added to their total points.

When a player's total points reach 100 (controllable below), they win.
'''
import random

POINTS_TO_WIN = 100
AI_ROUND_TARGET = 20

'''
This Homework has 2 parts:

Part 1 (100 pts): Complete the game for two human players.
That is, fill in all of the methods below

Part 2 (15 pts Extra Credit):
Add in an "AI" as the second player, so you will play against the computer.
The AI takes the place of player 2, and will continue rolling until
it reaches its AI_ROUND_TARGET. NOTE: You *will* need to change some of the
function paramaters (I.E. pass in additional values) and other parts of
functions.
'''

#**   
#**   General Game Stuff
#**

def main():
  '''This is the main function for the pig game'''
  welcome()
  while True:
    # Extra Credit: Choose whether or not to AI for each game, and do the rest.
    aiPlays = wantsContinue("Would you like to play a computer opponent? Y for yes, N for no: ")
    playGame(aiPlays)
    if not wantsPlayAgain():
      print('Bye!')
      return

# TODO
def playGame(aiPlays):
  '''Play one game of pig
  Alternates between players, and at the end of a player's turn, 
  prints the overall game score for both players'''

  player = 1
  playerOneTurn = True
  scores = initScores()
  while not gameOver(scores):
    print()
    print('Current Scores:')
    printScore(scores)
    if aiPlays and not playerOneTurn:
      getMove(scores, player, True)
    else:
      getMove(scores, player, False)
    if playerOneTurn:
      player = 2
      playerOneTurn = False
    else:
      player = 1
      playerOneTurn = True

def initScores():
  '''initialize the scores to 0'''
  # How you create and work with the scores is up to you!
  scoreDict = {1:0, 2:0}
  return scoreDict

def gameOver(scores):
  '''checks if the game is over
  game is over when either player reaches >= POINTS_TO_WIN.
  [ or 4 ones are rolled :3]
  Prints the win message for the player who won
  If no one won, just returns false'''
  if scores[1] >= POINTS_TO_WIN or scores[2] == -100:
    printWinMessage(1, scores)
    return True
  elif scores[2] >= POINTS_TO_WIN or scores[1] == -100:
    printWinMessage(2, scores)
    return True
  return False

def checkDice(dice):
  a = False
  b = False
  c = False
  d = False
  if dice[0] == 1:
    a = True
  if dice[1] == 1:
    b = True
  if dice[2] == 1:
    c = True
  if dice[3] == 1:
    d = True
  if a and b and c and d:
    return 4
  elif (a and b and c) or (a and b and d) or (a and c and d) or (b and c and d):
    return 3
  elif (a and b) or (a and c) or (a and d) or (b and c) or (b and d) or (c and d):
    return 2
  elif a or b or c or d:
    return 1
  else:
    return 0
  
def getMove(scores, player, aiPlays):
  '''gets a player's move.
  Before every move, prints the current round score and the game score for the player
  Checks if the player wants to continue, and if they do, rolls dice and appropriately changes scores
  '''
  printPlayerMessage(player)
  roundScore = 0
  while True:

    printCurrentPlayerScore(scores, player, roundScore)

    if aiPlays:
      if roundScore >= AI_ROUND_TARGET or roundScore + scores[player] >= POINTS_TO_WIN: #ADD MORE TO THIS
        scores[player] += roundScore
        break
    else:
      if(not wantsRollAgain(player)):
        scores[player] += roundScore
        break

    roll = rollDice()
    showRoll(roll)
    res = checkDice(roll)
    if res == 4:
      print("Rolled four 1s... Game over")
      scores[player] = -100
      break
    elif res == 3:
      print("Rolled three 1s. Score reset!")
      scores[player] = 0
      break
    elif res == 2:
      print("Rolled two 1s! Round ended, no score added")
      break
    elif res == 1:
      print("Rolled one 1! Round ended, score added")
      scores[player] += roundScore
      break
    else:
      diceSum = roll[0] + roll[1] + roll[2] + roll[3]
      roundScore += diceSum

def rollDie():
  '''rolls a single die (wow)'''
  return random.randint(1,6)

def rollDice():
  '''grabs the roll for four dice'''
  return [rollDie(), rollDie(), rollDie(), rollDie()]

#**   
#**   Checking if we want to [X] again
#**

def wantsContinue(response):
  '''Checks if the response a user gives indicates they want to continue.
  assume the user has to give a Y to mean yes and N to mean no'''
  ans = input(response)
  while ans != "Y" and ans != "N":
    ans = input(response)
  if ans == "Y":
    return True
  else:
    return False

def wantsPlayAgain():
  '''Asks a player if they want to play the game again (use wantsContinue()!)'''
  return wantsContinue("Would you like to play again? Y for yes, N for no: ")

def wantsRollAgain(player):
  '''Asks a player if they want to roll again
  For Part 2, also handle the Computer's decision'''
  return wantsContinue("Would you like to roll again? Y for yes, N for no: ")

#**   
#**   Printing Things
#**

def welcome():
  '''Prints the welcome message for the game.
  We might also print the rules for the game and any other
  information that the user might need to know.'''
  print('Welcome to Pig!')

def printScore(scores):
  '''prints the current game score for each player'''
  print("Player 1: " + str(scores[1]) + " & Player 2: " + str(scores[2]))

def printWinMessage(winningPlayer, scores):
  print()
  print('***********************Player ' + str(winningPlayer) + ' Won!************************')
  print('***********************Final Score:*************************')
  printScore(scores)

# TODO
def showRoll(roll):
  ''' prints out the roll'''
  print(roll)

def printPlayerMessage(player):
  print()
  print('--------------------------------------------------------------')
  print('-------------------Player ' + str(player) + '\'s turn----------------------------')
  print('--------------------------------------------------------------')
  print()

def printCurrentPlayerScore(scores, player, roundScore):
  '''print the score for a specific player. Prints their round score 
  and their overall game score not including their current round score'''
  print("Player " + str(player) + " has a round score of " + str(roundScore) + " and an overall score of " + str(scores[player]))

if __name__ == '__main__':
  main()






  
