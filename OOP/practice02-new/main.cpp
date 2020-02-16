#include <iostream>
#include <vector>
#include <sstream>
#include "ComplexNumber.h"

using namespace std;


ComplexNumber parse(const std::string &in) {
    stringstream iss(in);
    vector <string> parts;
    string segment;
    while (getline(iss, segment, ',')) parts.push_back(segment);

    if (parts.size() > 2 || parts.empty()) throw std::range_error("Not enough segments in complex integer");

    vector<float> numbers;
    numbers.reserve(parts.size());

    for (const auto &part : parts) numbers.push_back(::atof(part.c_str()));

    return ComplexNumber(numbers[0], numbers.size() == 2 ? numbers[1] : 0);
}

int main() {
    cout << "Format of complex numbers: <real>[,<imagine>]" << endl << endl;

    string strbuf;
    cout << "Enter first number:" << endl;
    cin >> strbuf;
    auto firstPart(parse(strbuf));

    cout << "Enter second number:" << endl;
    cin >> strbuf;
    auto secondPart(parse(strbuf));

    char op;
    cout << "Enter operator (+, -, *):" << endl;
    cin >> op;

    switch (op) {
        case '+': {
            cout << "Result: " << (firstPart + secondPart) << endl;
            break;
        }
        case '-': {
            cout << "Result: " << (firstPart - secondPart) << endl;
            break;
        }
        case '*': {
            cout << "Result: " << (firstPart * secondPart) << endl;
            break;
        }
        default:
            cout << "Invalid operator";
            break;
    }

    return 0;
}
