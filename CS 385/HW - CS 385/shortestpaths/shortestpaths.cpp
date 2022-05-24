/*******************************************************************************
 * Name    : shortestpaths.cpp
 * Author  : Ankit Patel & Christian Bautista
 * Version : 1.0
 * Date    : December 7, 2020
 * Description : Uses Floyd's Algorithm to compute the shortest distance between every pair of vertices.
 * Pledge : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/

#include <iostream>     // std::cout
#include <algorithm>    // std::min
#include <string>
#include <fstream>		//reading txt file
#include <sstream>
#include <vector>
#include <iterator>
#include <climits>
#include <iomanip>
#include <cmath>
#include <queue>

using namespace std;

/*
 * Returns the length of a 'long' number. ie: The number of digits.
 */
int len(long num) {
	return (num == 0) ? 1 : log10(num) + 1;
}

/**
 * Displays the matrix on the screen formatted as a table.
 */
void display_table(long **const matrix, const string &label, int num_vertices,
		bool use_letters = false) {

	unsigned int INF = numeric_limits<unsigned int>::max();

	cout << label << endl;
	long max_val = 0;

	for (int i = 0; i < num_vertices; i++) {
		for (int j = 0; j < num_vertices; j++) {
			long cell = matrix[i][j];
			if (cell < INF && cell > max_val) {
				max_val = matrix[i][j];
			}
		}
	}

	int max_cell_width =
			use_letters ?
					len(max_val) :
					len(max(static_cast<long>(num_vertices), max_val));
	cout << ' ';
	for (int j = 0; j < num_vertices; j++) {
		cout << setw(max_cell_width + 1) << static_cast<char>(j + 'A');
	}

	cout << endl;
	for (int i = 0; i < num_vertices; i++) {
		cout << static_cast<char>(i + 'A');
		for (int j = 0; j < num_vertices; j++) {
			cout << " " << setw(max_cell_width);
			if (matrix[i][j] == INF) {
				cout << "-";
			} else if (use_letters) {
				cout << static_cast<char>(matrix[i][j] + 'A');
			} else {
				cout << matrix[i][j];
			}
		}
		cout << endl;
	}
	cout << endl;
}

void print_backtrack(const int &o, const int &d, const int &dist,
		const vector<int> &path) {
	//max is set to dist to use for comparing later
	unsigned int max = dist;
	//Print out the Origin and Destination vertex pair
	cout << static_cast<char>('A' + o) << " -> " << static_cast<char>('A' + d)
			<< ", distance: ";
	//Check if a path exists between the Origin and Destination vertices
	if (max == numeric_limits<unsigned int>::max()) {
		//If so, distance is infinite
		cout << "infinity, path: none" << endl;
	} else {
		//If not, print out the path by looping through the path vector
		cout << max << ", path: ";
		for (size_t i = 0; i < path.size() - 1; i++) {
			cout << static_cast<char>('A' + path.at(i)) << " -> ";
		}
		cout << static_cast<char>('A' + path.at(path.size() - 1)) << endl;
	}
}

void backtracking(long **&matrix, long **&intermediaries, int num_vertices) {
	//Loop through all pairs of vertices
	for (int o = 0; o < num_vertices; o++) {
		for (int d = 0; d < num_vertices; d++) {
			//Use a vector to represent the path from o (Origin Vertex) to d (Destination Vertex)
			vector<int> path = { o };
			//Base Case: Origin and Destination is the same
			if (o == d) {
				//Path is the vertex itself, Distance is 0
				print_backtrack(o, d, matrix[o][d], path);
				//Move on to the next pair
				continue;
			}
			path.push_back(d);
			//Path now contains both the Origin and Destination vertices
			//Check if no path exists between o and d
			if (intermediaries[o][d] == numeric_limits<unsigned int>::max()) {
				//if so, print and move on to the next pair
				print_backtrack(o, d, matrix[o][d], path);
				continue;
			} else {
				//This means that there is an intermediary vertex between o and d
				//Therefore, insert it in between o and d in the path vector
				path.insert(path.begin() + 1, intermediaries[o][d]);
				//change will represent if any more intermediary vertices have been added to the path vector
				bool change = true;
				//This while loop will run until the path is "unchanged" for an entire iteration
				while (change) {
					change = false;
					//Loop through all pairs within the path to see if there is an intermediary vertex within sub-paths
					for (size_t i = 0; i < path.size() - 1; i++) {
						int origin = path.at(i);
						int destination = path.at(i + 1);
						if (intermediaries[origin][destination]
								!= numeric_limits<unsigned int>::max()) {
							//If there is an intermediary vertex within a sub-path, set change to false to run the loop again
							change = true;
							//Insert the intermediary vertex between o and d in the path vector
							path.insert(path.begin() + i + 1,
									intermediaries[origin][destination]);
							//i is incremented to prevent repeating vertices
							i += 1;
						}
					}
				}
				//Once the loop breaks, print out the path
				print_backtrack(o, d, matrix[o][d], path);
			}
		}
	}
}

void floyd_shortest_paths(long **matrix, int num_vertices) {
	//print the distance matrix (initial matrix)
	const string distance_matrix = "Distance matrix:";
	display_table(matrix, distance_matrix, num_vertices, false);

	//Create Intermediary Matrix
	long **intermediaries = new long*[num_vertices];
	for (int i = 0; i < num_vertices; i++) {
		intermediaries[i] = new long[num_vertices];
	}
	for (int i = 0; i < num_vertices; i++) {
		for (int j = 0; j < num_vertices; j++) {
			intermediaries[i][j] = numeric_limits<unsigned int>::max();
		}
	}
	//'i' will represent the Intermediary vertex currently being tested
	for (int i = 0; i < num_vertices; i++) {
		//'o' will represent the Origin vertex
		for (int o = 0; o < num_vertices; o++) {
			//'d' will represent the Destination vertex
			for (int d = 0; d < num_vertices; d++) {
				//Base Case: Origin is the same as Destination
				//Base Case: Origin or Destination is in the Intermediary Criss Cross
				if (o == d || o == i || d == i) {
					//Skip the iteration
					continue;
				}
				//Check if the sum from Origin to Intermediary and Intermediary to Destination
				//is less than the current distance from Origin to Destination
				else if (matrix[o][i] + matrix[i][d] < matrix[o][d]) {
					//if so, set the new shortest path and mark the intermediary
					matrix[o][d] = matrix[o][i] + matrix[i][d];
					intermediaries[o][d] = i;

				}
			}
		}
	}

	//Print the Path Length Matrix
	const string path_lengths = "Path lengths:";
	display_table(matrix, path_lengths, num_vertices, false);

	//Print the Intermediaries Matrix
	const string intermediate_vertices = "Intermediate vertices:";
	display_table(intermediaries, intermediate_vertices, num_vertices, true);

	//Print all the Shortest Paths for all pairs
	backtracking(matrix, intermediaries, num_vertices);

	for (int i = 0; i < num_vertices; i++) {
		delete[] intermediaries[i];
	}
	delete[] intermediaries;
}

// "edge" object will be used to represent the information on a line of the text file.
struct edge {
	char from;
	char to;
	long dist;
};

int main(int argc, char *argv[]) {

	// check if argc != 2. if not, cerr.
	if (argc != 2) {
		cerr << "Usage: ./shortestpaths <filename>" << endl;
		return 1;
	}

	//Create an ifstream object.
	ifstream f(argv[1]);
	//If it does not exist, print an error message.
	if (!f) {
		cerr << "Error: Cannot open file '" << argv[1] << "'." << endl;
		return 1;
	}

	// This queue of 'edge' structs is used to store the (valid) information in text file
	queue<edge> vertices;

	int line_number = 1;
	int num_vertices;
	bool firstLine = true;

	string line;
	while (getline(f, line)) {

		//Splits the string on 'line'. Temporarily stores the 'words' on the line into 'results'.
		istringstream iss(line);
		vector<string> results(istream_iterator<string> { iss },
				istream_iterator<string>());

		//First Line of text file should contain the number of vertices.
		if (firstLine) {

			//Use stringstream to convert the string in textfile to an int. If the first line of text
			// doesn't convert to an int, or if the number of vertices is not between [1,26] inclusive,
			// then cerr.
			stringstream ss;
			ss << results.at(0);
			if (results.size() == 0 || !(ss >> num_vertices) || num_vertices < 1
					|| num_vertices > 26) {
				cerr << "Error: Invalid number of vertices '" << results.at(0)
						<< "' on line 1." << endl;
				return 1;
			}
			firstLine = false;

		} else {
			// 2nd line and onwards has to be of the form: <Node> <Node> <weight>
			// where <Node> is a capital letter from 'A' to 'Z' and where
			// weight cannot be negative.

			//If a line contains more than 3 'words', it is not a valid input.
			if (results.size() != 3) {
				cerr << "Error: Invalid edge data '" << line << "' on line "
						<< line_number << "." << endl;
				return 1;
			}

			//If the 1st 'word' on a line is not a single char between [A,Z] inclusive,
			// then it is not a valid starting vertex.
			if (results.at(0).length() > 1
					|| (results.at(0).at(0) - 'A') >= num_vertices
					|| (results.at(0).at(0) - 'A') < 0) {
				cerr << "Error: Starting vertex '" << results.at(0)
						<< "' on line " << line_number
						<< " is not among valid values A-"
						<< (char) ('A' + (num_vertices - 1)) << "." << endl;
				return 1;
			}

			//If the 2nd 'word' on a line is not a single char between [A,Z] inclusive,
			// then it is not a valid ending vertex.
			if (results.at(1).length() > 1
					|| (results.at(1).at(0) - 'A') >= num_vertices
					|| (results.at(1).at(0) - 'A') < 0) {
				cerr << "Error: Ending vertex '" << results.at(1)
						<< "' on line " << line_number
						<< " is not among valid values A-"
						<< (char) ('A' + (num_vertices - 1)) << "." << endl;
				return 1;
			}

			//If the starting and ending vertices are both valid, then try to extract the
			// 'weight' between them.
			long long int weight;				//Should this be a long?
			stringstream ss;
			ss << results.at(2);

			//If the 3rd 'word' on the line is not a number or is not positive, then
			// it is not a valid weight.
			if (!(ss >> weight) || weight <= 0) {
				cerr << "Error: Invalid edge weight '" << results.at(2)
						<< "' on line " << line_number << "." << endl;
				return 1;
			}

			//If an error wasnt thrown, this line in the text file is a valid edge. Therefore,
			// we save this edge via an 'edge' struct, which is then appended to the queue of 'edge' structs.
			struct edge temp;
			temp.from = results.at(0).at(0);
			temp.to = results.at(1).at(0);
			temp.dist = weight; //Might need to cast as long

			vertices.push(temp);
		}
		line_number++;
	}
	f.close(); //Close the input text file because we dont need access to it anymore.

	// If an exception hasn't been thrown by now, that means all of the input is valid.
	// Thus, the input can be "converted" into a matrix in the form of a 2-d array.

	//Declares the 2d array used to store information from input
	long **initial_vertices = new long*[num_vertices];
	for (int i = 0; i < num_vertices; i++) {
		initial_vertices[i] = new long[num_vertices];
	}

	//As per Floyd's algorithm, all of the distances across the diagonal are set to 0,
	// and the rest of the distances are set to have an initial value of 'numeric_limits<unsigned int>::max()'.
	for (int i = 0; i < num_vertices; i++) {
		for (int j = 0; j < num_vertices; j++) {
			if (i == j) {
				initial_vertices[i][j] = 0;
			} else {
				initial_vertices[i][j] = numeric_limits<unsigned int>::max();
			}
		}
	}

	// 'Iterates' over the queue 'vertices', extracts information of each 'edge', and inserts it into
	// the 'initial_vertices' matrix. Once an edge is inserted, it is popped from the queue.
	while (!vertices.empty()) {
		int row = vertices.front().from - 'A'; //Find row that corresponds to "to" edge
		int col = vertices.front().to - 'A'; //Find column that corresponds to "from" edge

		initial_vertices[row][col] = vertices.front().dist;
		vertices.pop();
	}

	// runs the floyd's shortest paths algorithm.
	floyd_shortest_paths(initial_vertices, num_vertices);

	// Once the solution is found, delete the 2d array to avoid memory leaks
	for (int i = 0; i < num_vertices; i++) {
		delete[] initial_vertices[i];
	}
	delete[] initial_vertices;

	return 0;
}
