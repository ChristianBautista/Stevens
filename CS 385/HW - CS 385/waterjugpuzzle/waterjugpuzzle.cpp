/*******************************************************************************
 * Name        : waterjugpuzzle.cpp
 * Author      : Christian Bautista & Ankit Patel
 * Date        : 10/19/20
 * Description : Solves the waterjug puzzle given 3 jugs of any size and 3 final capacities for each jug.
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/
#include <iostream>
#include <sstream>
#include <queue>
#include <vector>

using namespace std;

// Struct to represent state of water in the jugs.
struct State {
	int a, b, c;
	vector<string> directions;

	State(int _a, int _b, int _c, vector<string> _directions) :
			a { _a }, b { _b }, c { _c }, directions { _directions } {
	}
};

//Method to create a direction string by taking in the displacement, offering jug letter, and receiving jug letter
string dir(int d, string o, string r) {
	stringstream ss;
	//ds is d cast to string, res is resultant string, the rest are constant strings
	//to help with string building and to avoid compilation errors
	string ds, res, p = "Pour ", g = " gallon from ", gs = " gallons from ", t =
			" to ", e = ". ";

	ss << d;
	ss >> ds;

	if (d == 1) {
		res = p + ds + g;
	} else {
		res = p + ds + gs;
	}
	res = res + o + t + r + e;
	ss.clear();
	ds = "";
	return res;
}
//Method for returning a string of a broken up state
//Used to help out with pushing into directions vectors of states
string abc(int a, int b, int c) {
	ostringstream oss;
	oss << "(" << a << ", " << b << ", " << c << ")";
	return oss.str();
}

//Global variables for capacity and goal state
int capA, capB, capC, goalA, goalB, goalC;
void bfs(int a, int b, int c) {
	//Create a 2D pointer to pointer bool array of capA rows and capB cols
	//By referencing the amount in A and B, we can check all possible combinations
	//of water displacement for all 3 jugs
	//Idea credited from Dr. B's lecture
	bool **seen = new bool*[capA + 1];
	for (int i = 0; i <= capA; i++) {
		seen[i] = new bool[capB + 1];
		fill(seen[i], seen[i] + capB + 1, false);
	}
	//Create queue and push first state into queue and mark first state
	queue<State> paths;
	string is = "Initial state. ", fr = is + abc(a, b, c);
	vector<string> fd;
	fd.push_back(fr);
	State first(a, b, c, fd);
	paths.push(first);
	seen[a][b] = false;
	//sol is used so that when a solution is found and the loop breaks,
	//"No solution." is not printed
	bool sol = false;
	//run loop for paths
	while (!paths.empty()) {
		//Get first element of queue and removes it from the queue
		State current = paths.front();
		paths.pop();
		//Check if current==goal
		if (current.a == goalA && current.b == goalB && current.c == goalC) {
			//print out the path
			for (unsigned i = 0; i < current.directions.size(); i++) {
				cout << current.directions.at(i) << endl;
			}
			sol = true;
			break;
		}
		//6 Ways to pour water
		//Check which ways are possible
		bool ca = true, ba = true, cb = true, ab = true, bc = true, ac = true;
		//Check which jugs are empty and eliminate corresponding moves
		if (current.a == 0) {
			ab = false;
			ac = false;
		}
		if (current.b == 0) {
			ba = false;
			bc = false;
		}
		if (current.c == 0) {
			ca = false;
			cb = false;
		}
		//Check which jugs are full and eliminate corresponding moves
		if (current.a == capA) {
			ba = false;
			ca = false;
		}
		if (current.b == capB) {
			ab = false;
			cb = false;
		}
		if (current.c == capC) {
			ac = false;
			bc = false;
		}
		//d represents difference and holds the amount of water displaced between jugs
		int d;
		string r;
		vector<string> ds;
		//Perform legal moves
		//Before creating a state, new state will be checked to see whether it has been seen before.
		//If so, do not create state
		//Otherwise, push the new state direction and state into the direction vector of the previous
		//And push the state onto the queue, also mark the state
		//Alternative for memory allocation: No new states = no stack overflow = no seg fault

		//C to A
		if (ca) {
			d = ((capA - current.a) > current.c) ?
					current.c : (capA - current.a);

			if (!seen[current.a + d][current.b]) {
				r = dir(d, "C", "A")
						+ abc(current.a + d, current.b, current.c - d);
				ds = current.directions;
				ds.push_back(r);
				State CA(current.a + d, current.b, current.c - d, ds);
				paths.push(CA);
				seen[CA.a][CA.b] = true;
			}
		}
		//B to A
		if (ba) {
			d = ((capA - current.a) > current.b) ?
					current.b : (capA - current.a);

			if (!seen[current.a + d][current.b - d]) {
				r = dir(d, "B", "A")
						+ abc(current.a + d, current.b - d, current.c);
				ds = current.directions;
				ds.push_back(r);
				State BA(current.a + d, current.b - d, current.c, ds);
				paths.push(BA);
				seen[BA.a][BA.b] = true;
			}
		}
		//C to B
		if (cb) {
			d = ((capB - current.b) > current.c) ?
					current.c : (capB - current.b);

			if (!seen[current.a][current.b + d]) {
				r = dir(d, "C", "B")
						+ abc(current.a, current.b + d, current.c - d);
				ds = current.directions;
				ds.push_back(r);
				State CB(current.a, current.b + d, current.c - d, ds);
				paths.push(CB);
				seen[CB.a][CB.b] = true;
			}
		}
		//A to B
		if (ab) {
			d = ((capB - current.b) > current.a) ?
					current.a : (capB - current.b);

			if (!seen[current.a - d][current.b + d]) {
				r = dir(d, "A", "B")
						+ abc(current.a - d, current.b + d, current.c);
				ds = current.directions;
				ds.push_back(r);
				State AB(current.a - d, current.b + d, current.c, ds);
				paths.push(AB);
				seen[AB.a][AB.b] = true;
			}
		}
		//B to C
		if (bc) {
			d = ((capC - current.c) > current.b) ?
					current.b : (capC - current.c);

			if (!seen[current.a][current.b - d]) {
				r = dir(d, "B", "C")
						+ abc(current.a, current.b - d, current.c + d);
				ds = current.directions;
				ds.push_back(r);
				State BC(current.a, current.b - d, current.c + d, ds);
				paths.push(BC);
				seen[BC.a][BC.b] = true;
			}
		}
		//A to C
		if (ac) {
			d = ((capC - current.c) > current.a) ?
					current.a : (capC - current.c);

			if (!seen[current.a - d][current.b]) {
				r = dir(d, "A", "C")
						+ abc(current.a - d, current.b, current.c + d);
				ds = current.directions;
				ds.push_back(r);
				State AC(current.a - d, current.b, current.c + d, ds);
				paths.push(AC);
				seen[AC.a][AC.b] = true;
			}
		}
	}
	//If the loop breaks, it's either because of 2 things:
	//1. It broke after having printed out the solution
	//2. The loop ended after the queue was empty
	//In the later case, sol would still be false,
	//So we print out the following.
	if (!sol) {
		cout << "No solution." << endl;
	}
	for (int i = 0; i <= capA; i++) {
		delete[] seen[i];
	}
	delete[] seen;
}

int main(int argc, char *argv[]) {

	if (argc != 7) {
		cout << "Usage: " << argv[0]
				<< " <cap A> <cap B> <cap C> <goal A> <goal B> <goal C>"
				<< endl;
		return 1;
	}

	int input[6]; //stores the 6 parameters
	char corresponding_jug[] = { 'A', 'B', 'C', '\0' };

	//Used for parsing input
	int num;
	stringstream sso;

	//Adds valid inputs to an array 'input'
	for (int i = 1; i < 7; i++) {
		sso << argv[i];

		//Checks if the jugs' capacities are valid inputs. (A valid jug capacity input is a positive integer).
		if (i < 4) {
			if (!(sso >> num)) { //conversation from string to int fails
				cerr << "Error: Invalid capacity '" << argv[i] << "' for jug "
						<< corresponding_jug[i - 1] << "." << endl;
				return 1;
			} else if (num <= 0) { //if input is non-positive int
				cerr << "Error: Invalid capacity '" << argv[i] << "' for jug "
						<< corresponding_jug[i - 1] << "." << endl;
				return 1;
			}
		} else { // 4 <= i < 7
			if (!(sso >> num) || num < 0) { // if input is not an int or a negative int
				cerr << "Error: Invalid goal '" << argv[i] << "' for jug "
						<< corresponding_jug[i - 4] << "." << endl;
				return 1;
			}
		}

		//stores valid integer inputs in input and resets stringstream sso.
		input[i - 1] = num;
		sso.clear();
		sso.str("");
	}

	//checks if the goals are valid (as specified per requirements document)
	for (int i = 4; i < 7; i++) {
		if (input[i - 1] > input[i - 4]) {
			cerr << "Error: Goal cannot exceed capacity of jug "
					<< corresponding_jug[i - 4] << "." << endl;
			return 1;
		}
	}

	//At this point, the inputs are integers. (If they werent integers then an error would have been thrown)
	if (input[2] != input[3] + input[4] + input[5]) {
		cerr
				<< "Error: Total gallons in goal state must be equal to the capacity of jug C."
				<< endl;
		return 1;
	}

	//If the program hasn't thrown an error by now, all of the inputs are valid
	//Assigns inputs as parameters to the problem and executes algorithm to solve said problem.
	capA = input[0];
	capB = input[1];
	capC = input[2];
	goalA = input[3];
	goalB = input[4];
	goalC = input[5];
	bfs(0, 0, capC);
	return 0;

}
