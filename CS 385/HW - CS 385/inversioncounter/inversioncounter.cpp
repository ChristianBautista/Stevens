/*******************************************************************************
 * Name        : inversioncounter.cpp
 * Author      : Christian Bautista
 * Version     : 1.0
 * Date        : October 30, 2020
 * Description : Counts the number of inversions in an array.
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/
#include <iostream>
#include <algorithm>
#include <sstream>
#include <vector>
#include <cstdio>
#include <cctype>
#include <cstring>

using namespace std;

// Function prototype.
static long mergesort(int array[], int scratch[], int low, int high);

/**
 * Counts the number of inversions in an array in theta(n^2) time.
 */
long count_inversions_slow(int array[], int length) {
	long count = 0;
	for(int i=0; i<length-1; ++i) {
		for(int j=i+1; j<length; ++j) {
			if(array[i] > array[j]) {
				count++;
			}
		}
	}
	return count;
}

/**
 * Counts the number of inversions in an array in theta(n lg n) time.
 */
long count_inversions_fast(int array[], int length) {
	int *scratch = new int[length];
	long count = mergesort(array,scratch,0,length-1);
	delete[] scratch;
	return count;
}

static long mergesort(int array[], int scratch[], int low, int high) {
	int mid = 0;
	long count = 0;
	if(low<high) {
		mid = low+((high-low)/2);
		count+=mergesort(array,scratch,low,mid);
		count+=mergesort(array,scratch,mid+1,high);
		int L = low;
		int H = mid+1;
		for(int k=low; k<=high; k++) {
			if(L<=mid && (H>high || array[L]<=array[H])) {
				scratch[k] = array[L];
				L++;
			}
			else {
				scratch[k] = array[H];
				H++;
				count+=(mid-L+1);
			}
		}
		for(int k=low; k<=high; k++) {
			array[k] = scratch[k];
		}
	}
	return count;
}

int main(int argc, char *argv[]) {
	istringstream iss;
	if(argc>2) {
		cerr << "Usage: ./inversioncounter [slow]" << endl;
		return 1;
	}
	bool method = false;
	if(argc==2) {
		iss.str(argv[1]);
		if(iss.str().compare("slow")) {
			cerr << "Error: Unrecognized option '" << argv[1] << "'." << endl;
			return 1;
		}
		else {
			method = true;
		}
	}

    cout << "Enter sequence of integers, each followed by a space: " << flush;

    int value, index = 0;
    vector<int> values;
    string str;
    str.reserve(11);
    char c;

    while (true) {
        c = getchar();
        const bool eoln = c == '\r' || c == '\n';
        if (isspace(c) || eoln) {
            if (str.length() > 0) {
                iss.str(str);
                if (iss >> value) {
                    values.push_back(value);
                } else {
                    cerr << "Error: Non-integer value '" << str
                         << "' received at index " << index << "." << endl;
                    return 1;
                }
                iss.clear();
                ++index;
            }
            if (eoln) {
                break;
            }
            str.clear();
        } else {
            str += c;
        }
    }
    if(index==0) {
    	cerr << "Error: Sequence of integers not received." << endl;
    	return 1;
    }

    cout << "Number of inversions: " << (method ? count_inversions_slow(&values[0],index) : count_inversions_fast(&values[0],index)) << endl;

    return 0;
}
