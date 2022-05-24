# Christian Bautista
#
# CS 115 Lab 13: Rational
#
# Due: November 22, 2019
#
# I pledge my honor that I have abided by the Stevens Honor System.
#
# Code TODO methods in Rational

class Rational:
    def __init__(self, n=0, d=1):
        self.numerator = n
        self.denominator = d
        if not self.validate():
            print("Invalid inputs :(")

    def __repr__ (self):
        return "Rational(" + str(self.numerator) \
                + "," + str(self.denominator) + ")"

    def __str__ (self):
       return str(self.numerator) + "/" + str(self.denominator)

    def validate(self):
        return isinstance(self.numerator, int) \
               and isinstance(self.denominator, int) \
               and 0 != self.denominator

    def isZero(self):
        return 0 == self.numerator

    # TODO
    def simplify(self):
        ''' Convert self into simplest form, i.e.
        2/4 becomes 1/2. Look into GCD!
        Make sure to add calls to simplify
        whenever you make a new rational throughout this code'''
        def computeGCD(x, y):
            if x > y:
                small = y
            else:
                small = x
            small = int(small)
            for i in range(1, small+1):
                if((x % i == 0) and (y % i == 0)):
                    gcd = i
            return gcd
        gcd = computeGCD(self.numerator, self.denominator)
        self.numerator /= gcd
        self.denominator /= gcd
        return self
        
    # TODO
    def invert(self):
        ''' Inverts self (makes it self^-1) '''
        num = self.numerator
        den = self.denominator
        self.numerator = den
        self.denominator = num
    
    def __eq__(self, other):
       return self.numerator * other.denominator \
               == self.denominator * other.numerator

    def __ne__(self, other):
        return self.numerator * other.denominator \
               != self.denominator * other.numerator

    def __lt__(self, other):
        return self.numerator * other.denominator \
               < self.denominator * other.numerator
               
    def __le__(self, other):
        return self.numerator * other.denominator \
               <= self.denominator * other.numerator
               
    def __gt__(self, other):
        return self.numerator * other.denominator \
               > self.denominator * other.numerator
               
    def __ge__(self, other):
        return self.numerator * other.denominator \
               >= self.denominator * other.numerator
               
    def __add__(self, other):
        newDenominator = self.denominator*other.denominator
        newNumerator = self.numerator*other.denominator \
                       + self.denominator*other.numerator
        ret = Rational(newNumerator, newDenominator)
        return ret

    def __neg__(self):
        newDenominator = self.denominator
        newNumerator = - self.numerator

        return Rational(newNumerator, newDenominator)

    def __sub__(self, other):
        return self + (-other)

    # TODO
    def __mul__(self, other):
        ''' Returns the product of self and other - SIMPLIFIED
        do not change self or other! '''
        num1 = self.numerator
        num2 = other.numerator
        den1 = self.denominator
        den2 = other.denominator
        num = num1 * num2
        den = den1 * den2
        r = Rational(num, den)
        return r.simplify()

    # TODO
    def __truediv__(self, other):
        ''' Returns the result of self/other - simplified
        do not modify self or other ! '''
        num1 = self.numerator
        num2 = other.numerator
        den1 = self.denominator
        den2 = other.denominator
        num = num1 * den2
        den = den1 * num2
        r = Rational(num, den)
        return r.simplify()

    # TODO
    def __int__(self):
        ''' Returns the integer representation of this rational '''
        return int(self.numerator / self.denominator)

    # Extra Credit: 5 pts
    def continuedFraction(self):
        ''' Returns a string representation of the canonical continued fraction form of self.
        http://mathworld.wolfram.com/SimpleContinuedFraction.html
        5/4 -> [1;4] (since 5/4 = 1 + 1/4)
        33/5 -> [6;1,1,2] (since 33/5 = 6 + 3/5 = 6 + 1/(5/3) = 6 + 1/(1 + 2/3)
                                        = 6 + 1/(1 + 1/(3/2)) = 6 + 1/(1 + 1/(1 + 1/2))
        68/21 -> [3;4,5] (since 68/21 = 3 + 5/21 = 3 + 1/(21/5) = 3 + 1/(4 + 1/5)
        '''
        a = str(int(self))
        r = Rational(self.numerator - (int(self) * self.denominator), self.denominator)
        r.simplify()
        r.invert()
        result = "[" + a + ";"
        if r.denominator == 1:
            result += str(r.numerator) + "]"
        else:
            while r.denominator > 1:
                a = str(int(r))
                result += a
                result += ","
                num = r.numerator - (int(r) * r.denominator)
                r = Rational(num, r.denominator)
                r.simplify()
                r.invert()
            result += str(int(r)) + "]"
        return result
                
