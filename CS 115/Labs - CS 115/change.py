# Christian Bautista
#
# CS 115 Lab 4 - Brach Recursion
#
# Due: September 19, 2019
#
# I pledge my honor that I have abided by the Stevens Honor System
#
# Create a method (change) that takes an amount and a set of coins and determines
# the least amount of coins that can be dispensed to create that amount.

def change(amount, coins):
    if amount == 0:
        return 0
    if coins == []:
        return float("inf")
    if coins[0] > amount:
        return change(amount, coins[1:])
    else:
        use_it = 1 + change(amount - coins[0], coins)
        lose_it = change(amount, coins[1:])
        return min(use_it, lose_it)
