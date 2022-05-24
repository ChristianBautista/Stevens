/*******************************************************************************
 * Name    : powergrid.cpp
 * Author  : Christian Bautista
 * Version : 1.0
 * Date    : December 16, 2020
 * Description : Uses Kruskall's Algorithm to find the MST of a graph.
 * Pledge : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/
#include <iostream>
#include <fstream>
#include <sstream>
#include <algorithm>
#include <utility>
#include <vector>

using namespace std;

//This method checks if a solution exists by seeing if all the intersections have at least 1 street connected
bool solution(long** &streets, const int &num_intersections) {
	//1D boolean array used to store the results of the test
	bool* seen = new bool[num_intersections+1];
	//Initialize so all intersections have not been seen
	for(int i=1; i<num_intersections+1; i++) {
		seen[i] = false;
	}
	//Loop through each pair of intersections to see if an street exists
	for(int o=1; o<num_intersections; o++) {
		for(int d=o+1; d<num_intersections+1; d++) {
			//If so, both the origin and destination intersection will have been seen and is marked appropriately in the boolean array
			if((!seen[o] || !seen[d]) && streets[o][d]!=0) {
				seen[o] = true;
				seen[d] = true;
			}
		}
	}
	//Check to see if all intersections have been seen
	for(int i=1; i<num_intersections+1; i++) {
		//If not, there is no solution
		if(!seen[i]) {
			return false;
		}
	}
	//Otherwise, free up the array from the heap and return true
	delete[] seen;
	return true;
}

//This method performs kruskal's algorithm to find the MST of the city layout
vector<pair<int,int>> kruskal(long** &streets, const int &num_intersections) {
	//used keeps track of which pairs of intersections have been used
	bool** used = new bool*[num_intersections];
	//find simulates the node layout from class
	int* find = new int[num_intersections+1];
	//Initialize both arrays
	for(int o=1; o<num_intersections; o++) {
		//Each intersection's find is itself
		find[o] = o;
		used[o] = new bool[num_intersections+1];
		for(int d=o+1; d<num_intersections+1; d++) {
			//Each plausible intersection should be marked as unused
			used[o][d] = false;
		}
	}
	//Since the used array uses one less row, the last intersection must be marked as unused
	find[num_intersections] = num_intersections;
	//done is the condition for the while loop to stop once the algorithm finishes
	//change is the condition for the while loop to stop once find has been fully updated for that iteration
	bool done = false,change = true;
	//MST is the vector of pairs of intersections that will be returned as a result of the algorithm
	vector<pair<int,int>> MST;
	//street is temporary pair of intersections that will be stored each iteration in MST
	pair<int,int> street;
	//Loop runs until the algorithm finishes
	while(!done) {
		done = true;
		//min, origin, and destination are used to store the shortest street length and the intersections the street is between
		int min = 0,origin = 0,destination = 0;
		//Loop through all intersections to find the street with the shortest length
		for(int o=1; o<num_intersections; o++) {
			for(int d=o+1; d<num_intersections+1; d++) {
				//If the street exists (>0) and has not been used and is either the first unused street found (min==0) or is less than the current minimum street length
				//Reassign the storing variables appropriately
				if(streets[o][d]>0 && used[o][d]==false && (min==0 || streets[o][d]<min)) {
					min = streets[o][d];
					origin = o;
					destination = d;
				}
			}
		}
		//In the case find did not update correctly from the loops below and there are no more streets to use, break out of the algorithm and return the MST
		if(origin==0 && destination==0) {
			break;
		}
		//Mark the pairs of intersections as used
		used[origin][destination] = true;
		//Find the root of origin and update find[origin]
		while(find[origin]!=find[find[origin]]) {
			find[origin] = find[find[origin]];
		}
		//Find the root of destination and update find[destination]
		while(find[destination]!=find[find[destination]]) {
			find[destination] = find[find[destination]];
		}
		//If a cycle is not formed
		if(find[origin]!=find[destination]) {
			//Join the root of origin to the root of destination
			//Root will always be set to the smallest possible intersection
			if(find[destination]<find[origin]) {
				find[find[origin]] = find[find[destination]];
			}
			else {
				find[find[destination]] = find[find[origin]];
			}
			//Add the street into the MST
			street.first = origin;
			street.second = destination;
			MST.push_back(street);
		}
		//Updates the find for all intersections
		while(change) {
			change = false;
			for(int i=1; i<num_intersections+1; i++) {
				//sets find[i] to its "lowest" root
				while(find[i]!=find[find[i]]) {
					change = true;
					find[i] = find[find[i]];
				}
			}
		}
		//Check if all intersections are rooted to 1
		for(int i=2; i<num_intersections+1; i++) {
			//if not, while loop will run again
			if(find[i]!=1) {
				done = false;
				break;
			}
		}
		//Otherwise, break out of loop
	}
	//Free up used and find from the heap
	for(int o=1; o<num_intersections; o++) {
		delete[] used[o];
	}
	delete[] used;
	delete[] find;
	//return a vector of the pairs of intersections included in the MST
	return MST;
}

int main(int argc, char *argv[]) {
	//Base Case: No arguments/Too Many
	if(argc!=2) {
		cerr << "Usage: ./powergrid <input file>" << endl;
		return 1;
	}
	//Base Case: No file/file doesn't exist
	ifstream f(argv[1]);
	if(!f) {
		cerr << "Error: Cannot open file '" << argv[1] << "'." << endl;
		return 1;
	}
	//Streets will represent existing streets using pairs of intersections
	long **streets;
	//Names will represent street names using pairs of intersections
	string **names;
	//not_found constant is used for string.find() checks
	static const size_t not_found = -1;
	//num_intersections stores the highest possible intersection
	int num_intersections;
	//line is used for file parsing, temp is used for swapping when destination>origin, o = origin, d = destination, w = weight
	int line = 1,temp,o,d,w;
	//street stores the current line, sub is used for specific substrings of the current line
	string street,sub;
	stringstream ss;
	//Parse through file to check if the streets are valid.
	while(getline(f,street)) {
		//Check first line to make sure it's a number of intersections between 1 and 1000.
		if(line==1) {
			ss << street;
			//Check for any character other than numbers and make sure that the first line is a valid number between 1 and 1000
			if(street.find(' ')!=not_found || street.find(',')!=not_found || street.find('.')!=not_found || !(ss >> num_intersections) || num_intersections<1 || num_intersections>1000) {
				cerr << "Error: Invalid number of vertices '" << street << "' on line 1." << endl;
				return 1;
			}
			//There is no solution for 1 intersection since there would be no streets
			if(num_intersections==1) {
				cout << "No solution." << endl;
				return 1;
			}
			ss.clear();
			//Initialize the 2D arrays so that only less than half will be used
			//In other words, for each origin, the destination must be at least 1 greater than it
			streets = new long*[num_intersections];
			names = new string*[num_intersections];
			for(int o=1; o<num_intersections; o++) {
				streets[o] = new long[num_intersections+1];
				names[o] = new string[num_intersections+1];
				for(int d=o+1; d<num_intersections+1; d++) {
					streets[o][d] = 0;
				}
			}
		}
		else {
			//comma is used as a "cooldown" check
			bool comma = false;
			//loops through each char in the string to make sure there are no empty fields
			for(unsigned i=0; i<street.length(); i++) {
				//if the current char is a comma
				if(street.at(i)==',') {
					//if the previous char wasn't a comma, set the cooldown to true
					if(!comma) {
						comma = true;
					}
					//if the previous char was a comma, throw an error
					else if(comma) {
						cerr << "Error: Invalid edge data '" << street << "' on line " << line << "." << endl;
						return 1;
					}
				}
				//the current char is not a comma so reset the cooldown
				else {
					comma = false;
				}
			}
			//if the last char was a comma or there aren't 4 fields, throw an error
			if(count(street.begin(),street.end(),',')!=3 || comma==true) {
				cerr << "Error: Invalid edge data '" << street << "' on line " << line << "." << endl;
				return 1;
			}
			//Get the origin
			sub = street.substr(0,street.find(','));
			street = street.substr(street.find(',')+1);
			ss << sub;
			//Check if the origin is a valid int between 1 and num_intersections
			if(sub.find('.')!=not_found || !(ss >> o) || o<1 || o>num_intersections) {
				cerr << "Error: Starting vertex '" << sub << "' on line " << line << " is not among valid values 1-" << num_intersections << "." << endl;
				return 1;
			}
			//Clear the stringstream
			ss.clear();
			//Get the destination
			sub = street.substr(0,street.find(','));
			street = street.substr(street.find(',')+1);
			ss << sub;
			//Check if the destination is a valid int between 1 and num_intersections
			if(sub.find('.')!=not_found || !(ss >> d) || d<1 || d>num_intersections) {
				cerr << "Error: Ending vertex '" << sub << "' on line " << line << " is not among valid values 1-" << num_intersections << "." << endl;
				return 1;
			}
			//Clear the stringstream
			ss.clear();
			//Get the street distance
			sub = street.substr(0,street.find(','));
			street = street.substr(street.find(',')+1);
			ss << sub;
			//Check if the street distance is a valid long that is greater than 1
			if(sub.find('.')!=not_found || !(ss >> w) || w<1) {
				cerr << "Error: Invalid edge weight '" << sub << "' on line " << line << "." << endl;
				return 1;
			}
			ss.clear();
			//Since the arrays use destination>origin format, reverse the origin and destination if origin>destination
			if(o>d) {
				temp = o;
				o = d;
				d = temp;
			}
			//Store the street length for the pair of intersections
			streets[o][d] = w;
			//Store the street name for the pair of intersections
			names[o][d] = street;
		}
		//Move on to the next line
		line+=1;
	}
	//When done parsing, be sure to close the file
	f.close();
	//If an intersection has no streets, there is no solution
	if(!solution(streets, num_intersections)) {
		cout << "No solution." << endl;
	}
	else {
		//Get the pairs of intersections (streets) used in the MST
		vector<pair<int,int>> MST = kruskal(streets,num_intersections);
		vector<pair<string,long>> MST_alpha;
		pair<string,long> street_weight;
		int wire_length = 0;
		unsigned index = 0;
		//Gets the street lengths and names and alphabetizes the streets to print out
		for(unsigned i=0; i<MST.size(); i++) {
			street_weight.first = names[MST.at(i).first][MST.at(i).second];
			street_weight.second = streets[MST.at(i).first][MST.at(i).second];
			wire_length+=street_weight.second;
			index = 0;
			while(index<MST_alpha.size() && street_weight.first>MST_alpha.at(index).first) {
				index+=1;
			}
			MST_alpha.insert(MST_alpha.begin()+index,street_weight);
		}
		//Print out the total length of all streets
		cout << "Total wire length (meters): " << wire_length << endl;
		for(unsigned i=0; i<MST_alpha.size(); i++) {
			cout << MST_alpha.at(i).first << " [" << MST_alpha.at(i).second << "]" << endl;
		}
	}
	//Frees all memory from the heap
	for(int o=1; o<num_intersections; o++) {
		delete[] streets[o];
		delete[] names[o];
	}
	delete[] streets;
	delete[] names;
	return 0;
}
