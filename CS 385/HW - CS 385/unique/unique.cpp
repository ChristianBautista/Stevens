/*******************************************************************************
 * Name        : unique.cpp
 * Author      : Christian Bautista
 * Date        : September 25, 2020
 * Description : Determining uniqueness of chars with int as bit vector.
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/
#include <iostream>
#include <cctype>

using namespace std;

bool is_all_lowercase(const string &s) {
	for(unsigned i=0; i<s.length(); i++) {
		if(!isalpha(s.at(i)) || !islower(s.at(i))) {
			return false;
		}
	}
	return true;
}

bool all_unique_letters(const string &s) {
	unsigned vector = 0;
	for(unsigned i=0; i<s.length(); i++) {
		if((vector & (1 << (s.at(i)-'a'))) != 0) {
			return false;
		}
		else {
			vector = vector | (1 << (s.at(i)-'a'));
		}
	}
	return true;
}

int main(int argc, char * const argv[]) {
	if(argc != 2) {
	    cerr << "Usage: " << argv[0] << " <string>" << endl;
	    return 1;
	}
	if(!is_all_lowercase(argv[1])) {
		cerr << "Error: String must contain only lowercase letters." << endl;
		return 1;
	}
	if(!all_unique_letters(argv[1])) {
		cout << "Duplicate letters found." << endl;
	}
	else {
		cout << "All letters are unique." << endl;
	}
	return 0;
}
