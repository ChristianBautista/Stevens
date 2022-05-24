/*******************************************************************************
 * Name        : sieve.cpp
 * Author      : Christian Bautista
 * Date        : September 18, 2020
 * Description : Sieve of Eratosthenes
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/
#include <cmath>
#include <iomanip>
#include <iostream>
#include <sstream>

using namespace std;

class PrimesSieve {
public:
    PrimesSieve(int limit);

    ~PrimesSieve() {
        delete [] is_prime_;
    }

    int num_primes() const {
        return num_primes_;
    }

    void display_primes() const;

private:
    // Instance variables
    bool * const is_prime_;
    const int limit_;
    int num_primes_, max_prime_;

    // Method declarations
    int count_num_primes() const;
    void sieve();
    static int num_digits(int num);
};

PrimesSieve::PrimesSieve(int limit) : is_prime_{new bool[limit + 1]}, limit_{limit} {
    sieve();
}

void PrimesSieve::display_primes() const {
	//The line of code below was provided by the pdf
	const int max_prime_width = num_digits(max_prime_), primes_per_row = 80 / (max_prime_width + 1);
	//Print out num_primes_ and limit_
	cout << "\nNumber of primes found: " << num_primes_ << "\nPrimes up to " << limit_ << ":" << endl;
	//Checks whether num_primes_ exceeds primes_per_row to adjust formatting
	if(num_primes_ > primes_per_row) {
		int count = 0;
		int rowcount = 0;
		int i = 2;
		//Loops until num_primes_-1 has been printed out
		while(count != num_primes_-1) {
			//Loops until a prime is found
			while(is_prime_[i] != true) {
				i++;
			}
			//Adds space to right align if digits is less than max_prime_ digits
			/*
			for(int d=0; d<(max_prime_width-num_digits(i)); d++) {
				cout << " ";
			}
			*/
			count++;
			rowcount++;
			//Determines whether to start a new row or not
			if(rowcount == primes_per_row) {
				cout << setw(max_prime_width) << i << endl;
				rowcount = 0;
			}
			else {
				cout << setw(max_prime_width) << i << " ";
			}
			i++;
		}
	}
	else {
		//Prints out all primes on one line
		int j = 2;
		for(int i=0; i<num_primes_-1; i++) {
			while(is_prime_[j] != true) {
				j++;
			}
			cout << j << " ";
			j++;
		}
	}
	//Accounts for last prime and does not add a space
	cout << max_prime_;
}

int PrimesSieve::count_num_primes() const {
	//Since num_primes_ cannot be edited after the constructor is performed,
	//the method returns num_primes_ as it is already set in the constructor.
    return num_primes_;
}

void PrimesSieve::sieve() {
	//Set all ints [2,limit_] to be true
	for(int k=2; k<limit_+1; k++) {
		is_prime_[k] = true;
	}
	//initialize member variables
	num_primes_ = 0;
	max_prime_ = 0;
	int i = 2;
	//Perform the algorithm as provided in the pdf
	//Loop through all ints 2<=i<=sqrt(limit_)
	while(i <= (int) sqrt(limit_)) {
		//Check if i is prime
		if(is_prime_[i]==true) {
			//Set all multiples of i (j) after i^2 to false
			int j = pow(i,2);
			while(j <= limit_) {
				is_prime_[j] = false;
				j+=i;
			}
		}
		i++;
	}
	//Find max_prime_ by looping backwards starting at limit_
	//Loop terminates once max_prime_ is found
	i = limit_;
	while(max_prime_==0) {
		if(is_prime_[i]==true) {
			max_prime_ = i;
		}
		i--;
	}
	//Count all all primes by looping through is_prime_
	for(int j=0; j<limit_+1; j++) {
		//Once a prime is found, num_primes_ increases
	    if(is_prime_[j]==true) {
	   		num_primes_++;
	   	}
	}
}

int PrimesSieve::num_digits(int num) {
    int digits = 0;
    //Counts digits while removing the last digit each time
    while(num != 0) {
    	digits++;
    	num/=10;
    }
    return digits;
}

int main() {
    cout << "**************************** " <<  "Sieve of Eratosthenes" <<
            " ****************************" << endl;
    cout << "Search for primes up to: ";
    string limit_str;
    cin >> limit_str;
    int limit;

    // Use stringstream for conversion. Don't forget to #include <sstream>
    istringstream iss(limit_str);

    // Check for error.
    if ( !(iss >> limit) ) {
        cerr << "Error: Input is not an integer." << endl;
        return 1;
    }
    if (limit < 2) {
        cerr << "Error: Input must be an integer >= 2." << endl;
        return 1;
    }
    PrimesSieve s(limit);
    s.display_primes();
    return 0;
}
