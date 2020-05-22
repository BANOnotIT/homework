#include "ComplexNumber.h"

ComplexNumber operator+(const ComplexNumber &left, const ComplexNumber &right) {
    return ComplexNumber(left.real + right.real, left.i + right.i);
}

ComplexNumber operator-(const ComplexNumber &left, const ComplexNumber &right) {
    return ComplexNumber(left.real - right.real, left.i - right.i);
}

ComplexNumber operator*(const ComplexNumber &left, const ComplexNumber &right) {
    auto a = left.real * right.real - left.i * right.i;
    auto b = left.real * right.i + left.i * right.real;
    return ComplexNumber(a, b);
}

std::ostream &operator<<(std::ostream &os, const ComplexNumber &me) {
    os << me.real;
    if (me.i != 0) os << ", " << me.i;
    return os;
}
