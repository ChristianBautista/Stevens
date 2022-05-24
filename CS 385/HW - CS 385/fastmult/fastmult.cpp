/*******************************************************************************
 * Name          : fastmult.cpp
 * Author        : Christian Bautista
 * Pledge        : I pledge my honor that I have abided by the Stevens Honor System.
 * Date          : December 1st, 2020
 * Description   : Implements the fast multiplication algorithm taught in class.
 ******************************************************************************/
#include <iostream>
#include <sstream>
#include <algorithm>

using namespace std;

string add(string a, string b) {
	stringstream ss;
	string d,s;
	while(a.length()>0 && a.at(0)=='0') {
		a = a.substr(1);
	}
	while(b.length()>0 && b.at(0)=='0') {
		b = b.substr(1);
	}
	if(a.empty() && b.empty()) {
		return "0";
	}
	if(a.empty() || b.empty()) {
		return (a.empty()) ? b : a;
	}
	int ai,bi,c=0,si;
	reverse(a.begin(),a.end());
	reverse(b.begin(),b.end());
	unsigned long long min_length = min(a.length(),b.length());
	for(unsigned long long i=0; i<min_length; i++) {
		ss << a.at(i);
		ss >> ai;
		ss.clear();
		ss << b.at(i);
		ss >> bi;
		ss.clear();
		si = ai+bi+c;
		if(si>9) {
			c = si/10;
		}
		else {
			c = 0;
		}
		ss << si%10;
		ss >> d;
		ss.clear();
		s = d+s;
		d.clear();
	}
	unsigned long long max_length = max(a.length(),b.length());
	if(min_length!=max_length) {
		unsigned long long j = min_length;
		while(c!=0 && j<max_length) {
			(a.length()==max_length) ? ss << a.at(j) : ss << b.at(j);
			ss >> ai;
			ss.clear();
			si = ai+c;
			if(si>9) {
				c = si/10;
			}
			else {
				c = 0;
			}
			ss << si%10;
			ss >> d;
			ss.clear();
			s = d+s;
			d.clear();
			j+=1;
		}
		if(j!=max_length) {
			string sr = (a.length()==max_length) ? a.substr(j,max_length) : b.substr(j,max_length);
			reverse(sr.begin(),sr.end());
			s = sr + s;
			return s;
		}
	}
	if(c!=0) {
		ss << c;
		ss >> d;
		s = d+s;
		d.clear();
	}
	return s;
}
bool is_a_larger(string a, string b) {
	stringstream ss;
	int ai,bi;
	if(a.length()!=b.length()) {
		return (a.length()>b.length()) ? true : false;
	}
	else {
		unsigned long long i = 0;
		while(i<a.length() && a.at(i)==b.at(i)) {
			i+=1;
		}
		if(i==a.length()) {
			return true;
		}
		else {
			ss << a.at(i);
			ss >> ai;
			ss.clear();
			ss << b.at(i);
			ss >> bi;
			ss.clear();
			return (ai>=bi) ? true : false;
		}
	}
	return true;
}
string subtract(string a, string b) {
	stringstream ss;
	string d,s;
	while(a.length()>0 && a.at(0)=='0') {
		a = a.substr(1);
	}
	while(b.length()>0 && b.at(0)=='0') {
		b = b.substr(1);
	}
	if(a.empty() && b.empty()) {
		return "0";
	}
	if(b.empty()) {
		return a;
	}
	if(a.empty()) {
		s = "-" + b;
		return s;
	}
	bool n = !is_a_larger(a,b);
	if(n) {
		s = a;
		a = b;
		b = s;
		s.clear();
	}
	int ai,bi,c=0,si;
	reverse(a.begin(),a.end());
	reverse(b.begin(),b.end());
	for(unsigned long long i=0; i<b.length(); i++) {
		ss << a.at(i);
		ss >> ai;
		ss.clear();
		ss << b.at(i);
		ss >> bi;
		ss.clear();
		if(bi>ai) {
			unsigned long long j=i+1;
			while(a.at(j)=='0') {
				j+=1;
			}
			ss << a.at(j);
			ss >> c;
			ss.clear();
			c-=1;
			ss << c;
			ss >> d;
			ss.clear();
			a.replace(j,1,d);
			d.clear();
			j-=1;
			while(j!=i) {
				a.replace(j,1,"9");
				j-=1;
			}
			ai+=10;
		}
		si = ai-bi;
		ss << si;
		ss >> d;
		ss.clear();
		s = d+s;
		d.clear();
	}
	if(a.length()!=b.length()) {
		string sr = a.substr(b.length(),a.length());
		reverse(sr.begin(),sr.end());
		s = sr + s;
	}
	if(n) {
		s = "-" + s;
	}
	return s;
}
string multiply(string a, string b) {
	if(a.length()==1 && b.length()==1) {
		int ai,bi,pi;
		stringstream ss;
		ss << a;
		ss >> ai;
		ss.clear();
		ss << b;
		ss >> bi;
		ss.clear();
		pi = ai * bi;
		string p;
		ss << pi;
		ss >> p;
		ss.clear();
		return p;

	}
	if(a.length()!=b.length()) {
		while(a.length()!=b.length()) {
			(a.length() < b.length()) ? a = "0" + a : b = "0" + b;
		}
	}
	if(a.length()%2!=0) {
		a = "0" + a;
		b = "0" + b;
	}
	string a1 = a.substr(0,a.length()/2);
	string b1 = b.substr(0,b.length()/2);
	string a0 = a.substr(a.length()/2);
	string b0 = b.substr(b.length()/2);
	string c2 = multiply(a1,b1);
	string c0 = multiply(a0,b0);
	string a10 = add(a1,a0);
	string b10 = add(b1,b0);
	string c20 = add(c2,c0);
	string ab10 = multiply(a10,b10);
	string c1 = subtract(ab10,c20);
	for(unsigned i=0; i<a.length(); i++) {
		c2 = c2 + "0";
	}
	for(unsigned j=0; j<a.length()/2; j++) {
		c1 = c1 + "0";
	}
	string c12 = add(c2,c1);
	return add(c12,c0);
}

int main(int argc, char *argv[]) {
	string a = argv[1];
	string b = argv[2];
	while(a.length()!=b.length()) {
		(a.length() < b.length()) ? a = "0" + a : b = "0" + b;
	}
	cout << multiply(a,b) << endl;
	return 0;
}
