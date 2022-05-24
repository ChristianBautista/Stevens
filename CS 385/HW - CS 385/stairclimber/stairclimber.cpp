/*******************************************************************************
 * Name        : stairclimber.cpp
 * Author      : Christian Bautista
 * Date        : October 2, 2020
 * Description : Lists the number of ways to climb n stairs.
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/
#include <iostream>
#include <vector>
#include <algorithm>
#include <sstream>
#include <iomanip>

using namespace std;

vector< vector<int> > get_ways(int num_stairs) {
	if(num_stairs <= 0) {
		return {{}};
	}
	vector<vector<int>> ways = {};
	for(int i=1; i<4; i++) {
		if(num_stairs >= i) {
			vector<vector<int>> result = get_ways(num_stairs-i);
			for(unsigned j=0; j<result.size(); j++) {
				result.at(j).insert(result.at(j).begin(),i);
			}
			ways.insert(ways.end(),result.begin(),result.end());
		}
	}
	return ways;
}

void display_ways(const vector< vector<int> > &ways) {
	int size = ways.size();
	int digits = 0;
	while(size != 0) {
		digits++;
		size/=10;
	}
	for(unsigned i=0; i<ways.size(); i++) {
		cout << setw(digits) << i+1 << ". [";
		for(unsigned j=0; j<ways.at(i).size()-1; j++) {
			cout << ways.at(i).at(j) << ", ";
		}
		cout << ways.at(i).at(ways.at(i).size()-1) << "]" << endl;
	}
}

int main(int argc, char * const argv[]) {
	int n;
	stringstream ss;
	if(argc != 2) {
		cerr << "Usage: " << argv[0] << " <number of stairs>" << endl;
		return 1;
	}
	ss << argv[1];
	if(!(ss >> n) or (n < 1)) {
		cerr << "Error: Number of stairs must be a positive integer." << endl;
		return 1;
	}
	vector<vector<int>> ways = get_ways(n);
	if(ways.size()==1) {
		cout << ways.size() << " way to climb ";
	}
	else {
		cout << ways.size() << " ways to climb ";
	}
	if(n==1) {
		cout << n << " stair." << endl;
	}
	else {
		cout << n << " stairs." << endl;
	}
	display_ways(ways);
	return 0;
}
