//
// Created by banonotit on 13.03.2020.
//

#ifndef LB07_STAR_H
#define LB07_STAR_H

#include <string>

using namespace std;


class Star {
private:
    string name;
    uint kelvin;
public:
    Star(string name, uint kelvin);

    string getColor();
    void print();
};


#endif //LB07_STAR_H
