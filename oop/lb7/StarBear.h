//
// Created by banonotit on 13.03.2020.
//

#ifndef LB07_STARBEAR_H
#define LB07_STARBEAR_H

#include <string>

using namespace std;

class StarBear {
private:
    string name;
    uint kelvin;

public:
    void initialize(string initName, uint temp);

    void print();

    string getColor();
};


#endif //LB07_STARBEAR_H
