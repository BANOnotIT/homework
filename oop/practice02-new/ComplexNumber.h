//
// Created by banonotit on 16.02.2020.
//

#ifndef PRACTICE02_NEW_COMPLEXNUMBER_H
#define PRACTICE02_NEW_COMPLEXNUMBER_H


#include <ostream>

class ComplexNumber {
private:
    float real, i;
public:
    ComplexNumber(float real, float i) : real(real), i(i) {}

    friend ComplexNumber operator+(const ComplexNumber &left, const ComplexNumber &right);

    friend ComplexNumber operator-(const ComplexNumber &left, const ComplexNumber &right);

    friend ComplexNumber operator*(const ComplexNumber &left, const ComplexNumber &right);

    friend std::ostream &operator<<(std::ostream &os, const ComplexNumber &me);

};


#endif //PRACTICE02_NEW_COMPLEXNUMBER_H
