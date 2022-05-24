'''
Name: Christian Bautista
Assignment 4
Description: This program performs statistical analysis on edge data given by the user. The output consists of the triangles found and expected and actual distributions.
Purpose: The purpose of this program is to obtain various statistical values involving specific types of triangles. 
Terminal Instructions:
1. Find the directory where the file is in.
2. cd into that directory then type in "python Bautista.py"
3. The program will prompt you for a csv file name. If you receive an error, it means the program could not find or load the file name you entered and you will prompted again.
'''
# imports
import csv
import networkx as nx
from tabulate import tabulate
import time

start = time.time() # start timing the code

def main():
    valid = False
    # Input Validation Loop: Prompts the user for a file name to open
    while not valid:
        try: # Ask the user for a file name and attempt to open it
            fn = input("File Name: ")
            f = open(fn,"r")
        except: # File name does not exist or could not be read, print the error and prompt user again
            print("Error: Could not read file") # valid is unchanged, causing the loop to run again
        else: # File was successfully opened
            valid = True # Setting this breaks the loop
    reader = csv.reader(f) 
    g = nx.Graph() # Defines a new networkx graph
    pc = 0 # Positive (Trusted) Edges Count
    nc = 0 # Negative (Distrusted) Edges Count
    for edge in reader: # Loops through all edges in the csv file provided
        g.add_edge(int(edge[0]),int(edge[1]),weight=int(edge[2])) # Adds the edge to the graph, indexes 0 and 1 represent the two nodes the edges connect and index 2 is the weight
        # Determine if the edge is positive (1) or negative (-1)
        if int(edge[2])>0: # If positive, add to the positive count
            pc+=1
        elif int(edge[2])<0: # If negative, add to the negative count
            nc+=1
        else: # If the weight is 0 (neither positive or negative), this represents bad data and this will inform the user that their csv file contains bad data
            print("Error: weight is neither positive or negative")
    f.close()
    
    tc = int(sum(nx.triangles(g).values())/3) # Gets the number of triangles in the graph, division by 3 as every triangle is counted 3 times (once per node)
    tl = list(filter(lambda x: len(x)==3, list(nx.enumerate_all_cliques(g)))) # Gets a list of traingles where each triangle is a list of the 3 nodes it contains
    if tc!=len(tl): # Cross-check to determine whether all triangles were found and processed, if not, inform the user
        print("Error: Unable to find all triangles")
    ttt = 0 # Trust-Trust-Trust Triangle Count
    ttd = 0 # Trust-Trust-Distrust Triangle Count
    tdd = 0 # Trust-Distrust-Distrust Triangle Count
    ddd = 0 # Distrust-Distrust-Distrust Triangle Count
    for t in tl: # Loop through all the triangles found
        # Get all the edge weights
        w1 = g.get_edge_data(t[0],t[1])["weight"]
        w2 = g.get_edge_data(t[0],t[2])["weight"]
        w3 = g.get_edge_data(t[1],t[2])["weight"]

        # Classify the triangle
        if w1>0 and w2>0 and w3>0:
            ttt+=1
        elif w1<0 and w2<0 and w3<0:
            ddd+=1
        elif (w1>0 and w2>0) or (w1>0 and w3>0) or (w2>0 and w3>0):
            ttd+=1
        elif (w1<0 and w2<0) or (w1<0 and w3<0) or (w2<0 and w3<0):
            tdd+=1
        else: # If the triangle contains bad weights, inform the user
            print("Error: triangle "+t+" contains improper weights")

    ec = g.number_of_edges() # Number of Edges
    
    # Output Printing Below
    print("Edges Used: "+str(ec))
    print("Trust Edges: "+str(pc))
    print("Distrust Edges: "+str(nc))
    tp = pc/ec # Trust Probability = Positive Edge Count / Total Edge Count
    print("Probability of Trust Edge: "+str(round(tp*100,2)))
    dp = nc/ec # Distrust Probability = Negative Edge Count / Total Edge Count
    print("Probability of Distrust Edge: "+str(round(dp*100,2)))
    print("\nTotal Number of Triangles: "+str(tc)+"\n")

    print("Expected Distribution")
    tttp = tp**3 # Trust-Trust-Trust Probability = Trust Probabilty Cubed
    ttdp = 3*(tp*tp*dp) # Trust-Trust-Distrust Probability = Trust Probability Squared x Distrust Probability
    tddp = 3*(tp*dp*dp) # Trust-Distrust-Distrust Probability = Trust Probability x Distrust Probability Squared
    dddp = dp**3 # Distrust-Distrust-Distrust Probability = Distrust Probability Cubed
    # Creates a table containing each triangle type with the individual probability and expected number
    et = [["Type","%","Count"]]
    et.append(["TTT",round(tttp*100,2),round(tttp*tc,2)])
    et.append(["TTD",round(ttdp*100,2),round(ttdp*tc,2)])
    et.append(["TDD",round(tddp*100,2),round(tddp*tc,2)])
    et.append(["DDD",round(dddp*100,2),round(dddp*tc,2)])
    print(tabulate(et,headers="firstrow",tablefmt="grid")) # Displays the expected distribution table

    print("\nActual Distribution")
    # Creates a table containing each triangle type with the percentage and count
    at = [["Type","%","Count"]]
    at.append(["TTT",round((ttt/tc)*100,2),ttt])
    at.append(["TTD",round((ttd/tc)*100,2),ttd])
    at.append(["TDD",round((tdd/tc)*100,2),tdd])
    at.append(["DDD",round((ddd/tc)*100,2),ddd])
    print(tabulate(at,headers="firstrow",tablefmt="grid"))

main()
print("\nDuration: "+str(round(time.time()-start,2))+"s"+"\n") # Prints out how long the program took to run