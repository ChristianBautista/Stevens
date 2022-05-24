'''
Name: Christian Bautista
Assignment 2
Description: This program retrieves YouTube videos based on keywords provided by the user
Purpose: The purpose of this program is to obtain a certain number of videos that are most related to one or multiple search terms as inputted by the user. Also, the program is supposed to find the top five videos based on like percentage and the top videos based on comment count.
Terminal Instructions:
1. Find the directory where the file is in.
2. cd into that directory then type in "python Bautista.py"
3. The program will first prompt you for a search term. Type in any combination of words, then press enter.
4. Afterwards, the program will prompt you for the maximum number results for the search. Type in any number from 1 to 50.
5. If you have not mistyped anything, confirm your input by typing "Y" when prompted. Otherwise, type "N" and repeat steps 3 and 4.
6. After the results of your search have been displayed, if you wish to perform another search, type in "Y" when prompted, otherwise, type in "N" to terminate the program.
'''

# Imports
from googleapiclient.discovery import build # used to create the YouTube service
import csv # used to create the csv file
from tabulate import tabulate # used for outputting onto console

# String Literals: Defined here for consistency throughout the program and also for ease of modification
API_NAME = "youtube"
API_VERSION = "v3"
API_KEY = "AIzaSyDhhgv4kGtH_baGhzF16pp5mNZ7JZ-IOV4"

youtube = build(API_NAME, API_VERSION, developerKey=API_KEY) # defining a YouTube service variable

# This function will format any number as a string by adding commas where necessary
def commaFormat(num): # Does not work with decimals
    newNum = ""
    i=len(num)-1
    count = 0
    while i>=0: # Loops through all places of the number
        if count==3: # Checks if three digits have been passed in, if so, the comma should be the next character before the next number
            newNum+=","
            count = 0
        else:
            count+=1 # Otherwise, increment count
        newNum+=num[i] # Adds the current digit to the new string
        i-=1 # Updates the index
    return newNum[::-1] # Returns the REVERSE of the new number because we inserted the last number to the front of the string, so we must reverse it to get back the correct number

def main():
    f = open("output.csv", "w", newline="", encoding="utf-8") # Creates a csv file to write output into
    writer = csv.writer(f) # initializes the csv writer in order to be able to write into the csv file
    
    print("\nWelcome to YouTube Shell Edition!\nAuthor: Christian Bautista\nLanguage: Python\n") # Opening print statement

    browsing = True # boolean used to determine when the user is done using service
    while browsing: # This while loop will allow the user to query multiple times until they are done browsing
        confirmed = False # boolean used to determine whether the user has confirmed their input or not
        search_term = "" # string used as keyword(s) when invoking the YouTube service
        search_max = 0 # int used to indicate the number of search results when invoking the YouTube service
        while not confirmed: # This while loop will run until the user confirms their input
            valid = False # boolean used to determine if user input is valid
            while not valid: # This while loop will run until the user enters valid input for search_term
                search_term = input("Enter Search Term(s): ") # This will prompt the user to enter in one or multiple search terms and set their input to search_term
                if not search_term: # Input Validation: Checks to see if the user has actually typed in any search terms
                    print("Error: Empty Input") # Errors out if there is no input
                else:
                    valid = True # Setting valid to True will break the while loop since there is input, the search_term is validated
            valid = False # resets valid for the next while loop for search_max
            while not valid: # This while loop will run until the user enters valid input for search_max
                search_max = input("Enter Max Results (1-50): ") # This will prompt the user to enter how many search results they want for their query
                try: # Input Validation: Checks to see if the user inputted a positive integer between 1 and 50 inclusive
                    search_max = int(search_max) # Checks to see if the user inputted an integer
                    if search_max<1 or search_max>50: # Checks to see if the user's integer is between 1 and 50 inclusive
                        print("Error: search_max is out of range ([1,50])") # Errors out if the integer is 0 or less or 51 or more
                    else:
                        valid = True # Setting valid to True will break the while loop since the input is a positive integer between 1 and 50 inclusive, search_max is validated
                except ValueError:
                    print("Error: Input is not an integer") # Errors out if the input isn't an integer
            # Display user input for confirmation
            print("\nSearch Parameters:")
            print("Search Term(s): "+search_term)
            print("Max Number of Results: "+str(search_max))
            valid = False # boolean used to determine if input is valid
            while not valid: # This while loop will run until the user enters valid input for confirm
                confirm = input("Confirmation (Y for Yes, N for No): ") # This will prompt the user to enter in a single character, either Y or N for Yes or No respectively
                if len(confirm)==1: # Input Validation: Checks to see if the user inputted a single character or not
                    # Input Validation: Checks to see if the user inputted a Y or an N (NOT case sensitive)
                    if confirm=="Y" or confirm=="y": 
                        valid = True # Setting valid to True will break the while loop since the input is valid
                        confirmed = True # Setting confirmed to True will break the while loop as the user has confirmed their previous input
                    elif confirm=="N" or confirm=="n":
                        valid = True # Setting valid to True will break the while loop since the input is valid
                        # Confirmed is not reassigned to True, meaning that the program will ask for user input again regarding search_term and search_max
                        # Since the user indicated that their input was not correct
                    else:
                        print("Error: Input was not \"Y\" or \"N\"") # Errors out if the user typed in a character that was not Y or N
                else:
                    print("Error: Input was not \"Y\" or \"N\"") # Errors out if the user typed in more than one character or if the input was empty
                print()
        # Writes the search term and search max into the csv file under a Search Parameter header
        writer.writerow(["Search Parameters:"]) 
        writer.writerow(["Search Term(s):",search_term])
        writer.writerow(["Search Max:",search_max])
        search_data = youtube.search().list(q=search_term, part="id,snippet", maxResults=search_max, type="video").execute() # Executes a search based on q that will return an object containing the results in an array with a max length of search_max called items with the specified parts 
        print("Analysis 1 - Search Results:") # Prints out the header for Analysis 1
        writer.writerow(["Video ID","Views","Likes","Comments","Duration","Title"]) # Writes the headers for the first analysis table into the csv file
        a1 = [["Video ID","Views","Likes","Comments","Duration","Title"]] # Defines the first analysis table with the first row as header
        a2 = [["Like Percentage","Views","Likes","Title"],[],[],[],[],[]] # Defines the second analysis table with the first row as header
        a2r = [0,0,0,0,0] # Will be used to store the top 5 like percentages for ease of comparison
        a3 = [["Views","Comments","Title"],[],[],[],[],[]] # Defines the third analysis table with the first row as header
        a3r = [0,0,0,0,0] # Will be used to store the top 5 comment counts for ease of comparison
        # Must retrieve Video ID, Views, Likes, Comments, Duration, Title for each search_instance
        for search_instance in search_data.get("items", []): # Loops through all the items from the search performed
            if search_instance["id"]["kind"] == "youtube#video": # Ensures that only videos are passed into the first table
                videoId = search_instance["id"]["videoId"] # This field will be outputted into the csv and terminal as well as be used to search for more information on the video
                title = search_instance["snippet"]["title"] # This field will be outputted into the csv and terminal
                video_data = youtube.videos().list(id=videoId,part="contentDetails,statistics").execute() # Executes a search that should find the exact video that had been found in the previous lines using the videoId and returns the contentDetails and statistics for the video
                for video_instance in video_data.get("items",[]): # Even though this is a for loop, it only runs once as the search above should return an array with only 1 video in it since we used videoId
                    duration = video_instance["contentDetails"]["duration"] # This field will be outputted onto the csv and terminal
                    # Stat Validation: The following conditionals check to see if the stats I am attempting to retrieve exist and if not, assign the variable to 0 as to not cause an error
                    if 'viewCount' not in video_instance["statistics"]:
                        viewCount = 0
                    else:
                        viewCount = int(video_instance["statistics"]["viewCount"])
                    if 'likeCount' not in video_instance["statistics"]:
                        likeCount = 0
                    else:
                        likeCount = int(video_instance["statistics"]["likeCount"])
                    if 'commentCount' not in video_instance["statistics"]:
                        commentCount = 0
                    else:
                        commentCount = int(video_instance["statistics"]["commentCount"])
                # Add video data to the Analysis 1 table in both the csv and output
                # The following lines format the numbers into strings with commas for every 3 digits
                viewCountString = viewCount
                viewCountString = commaFormat(str(viewCountString))
                likeCountString = likeCount
                likeCountString = commaFormat(str(likeCountString))
                commentCountString = commentCount
                commentCountString = commaFormat(str(commentCountString))
                row = [videoId,viewCountString,likeCountString,commentCountString,duration,title]
                a1+=[row]
                writer.writerow(row)
                # Add video data to the Analysis 3 
                i=0
                while i<5 and commentCount<a3r[i]: # This while loop will run until either the commentCount is less than the top 5 or until commentCount is greater than any of the top 5
                    i+=1
                if i<5: # If commentCount is greater than any of the top 5, it inserts it in its proper place and removes the lowest commentCount
                    # Shift array first then set index
                    a3r.insert(i,commentCount)
                    del a3r[-1]
                    row = [viewCountString,commentCountString,title]
                    a3.insert(i+1,row)
                    del a3[-1]
                # Determine if video can be added to Analysis 2
                if viewCount!=0: # Any videos with no view count should not be considered for Analysis 2
                    likePercentage = round((likeCount/viewCount)*100, 3) # Calculate like percentage by dividing likeCount over viewCount. Multiply by 100 to shift the decimal 2 spaces to the right. Rounds out to three decimal places.
                    i=0
                    while i<5 and likePercentage<a2r[i]: # If like percentage is greater than any of the top 5, it inserts it in its proper place and removes the lowest likePercentage
                        i+=1
                    if i<5:
                        # Shift array first then set index
                        a2r.insert(i,likePercentage)
                        del a2r[-1]
                        likePercentage = str(likePercentage)+" %"
                        row = [likePercentage,viewCountString,likeCountString,title]
                        a2.insert(i+1,row)
                        del a2[-1]
        # After analyzing all results from the search, display the tables
        print(tabulate(a1,headers="firstrow",tablefmt="grid"))
        print("Analysis 2 - Like Percentage Top 5")
        print(tabulate(a2,headers="firstrow",tablefmt="grid"))
        print("Analysis 3 - Comment Count Top 5")
        print(tabulate(a3,headers="firstrow",tablefmt="grid"))
        # Determine whether the user wants to continue browsing (perform 1 or more searches)
        valid = False
        while not valid:
            ip = input("\nWould you like to continue browsing? ")
            if len(ip)==1: # Input Validation: Checks to see if the user inputted a single character or not
                print()
                # Input Validation: Checks to see if the user inputted a Y or an N (NOT case sensitive)
                if ip=="Y" or ip=="y":
                    valid = True # Setting valid to True will break the while loop since the input is valid
                    # Program will restart as the user wishes to perform another search
                elif ip=="N" or ip=="n":
                    valid = True # Setting valid to True will break the while loop since the input is valid
                    browsing = False # Setting browsing to False will break the while loop and termiante the program
                    print("Thank you for browsing!")
                    f.close() # closes the file as the program will terminate afterwards
                else:
                    print("Error: Input was not \"Y\" or \"N\"") # Errors out if the user typed in a character that was not Y or N
            else:
                print("Error: Input was not \"Y\" or \"N\"") # Errors out if the user typed in more than one character or if the input was empty

main()