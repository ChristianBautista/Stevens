/*******************************************************************************
 * Name    : sqrt.cpp
 * Author  : Christian Bautista
 * Version : 1.0
 * Date    : September 3, 2020
 * Description : Computes the square root of one command line argument
 * with the second command line argument as a measure of accuracy.
 * Pledge : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/
#include <iostream>
#include <sstream>
#include <limits>
#include <iomanip>

using namespace std;

double sqrt(double num, double epsilon) {
	double last_guess = num;
	double next_guess = (last_guess+(num/last_guess))/2;
	while(abs(last_guess-next_guess) > epsilon) {
		last_guess = next_guess;
		next_guess = (last_guess+(num/last_guess))/2;
	}
	return next_guess;
}

int main(int argc, char* const argv[]) {
	double num, epsilon;
	stringstream ss;
    if(argc != 3 and argc != 2) {
    	cerr << "Usage: " << argv[0] << " <value> [epsilon]" << endl;
    	return 1;
    }
    ss << argv[1];
    if(!(ss >> num)) {
    	cerr << "Error: Value argument must be a double." << endl;
    	return 1;
    }
    if(num < 0) {
    	cout << numeric_limits<double>::quiet_NaN() << endl;
    	return 1;
    }
    if(num == 0 or num == 1) {
    	cout << fixed << setprecision(8) << num << endl;
    	return 1;
    }
    if(argc == 3) {
    	ss.clear();
    	ss << argv[2];
    	if(!(ss >> epsilon) or epsilon <= 0) {
    		cerr << "Error: Epsilon argument must be a positive double." << endl;
    		return 1;
    	}
    }
    else {
    	epsilon = 1e-7;
    }
    cout << fixed << setprecision(8) << sqrt(num,epsilon) << endl;
    return 0;
}
