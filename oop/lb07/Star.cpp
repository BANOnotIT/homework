//
// Created by banonotit on 13.03.2020.
//

#include <iostream>
#include <utility>
#include "Star.h"

using namespace std;

void Star::print() {
    cout << "Star " << name << " (" << kelvin << "K," << getColor() << ")" << endl;
}

string Star::getColor() {
    if (kelvin < 3500)
        return "red";
    else if (kelvin < 5000)
        return "orange";
    else if (kelvin < 6000)
        return "yellow";
    else if (kelvin < 7500)
        return "yellowhite";
    else if (kelvin < 10000)
        return "white";
    else if (kelvin < 30000)
        return "whiteblue";
    else
        return "blue";
}

Star::Star(string name, uint kelvin) : name(std::move(name)), kelvin(kelvin) {}
