//
// Created by banonotit on 13.03.2020.
//

#include "StarBear.h"

#include <utility>
#include <iostream>

void StarBear::initialize(string initName, uint temp) {
    name = std::move(initName);
    kelvin = temp;
}

void StarBear::print() {
    cout << "Star " << name << " (" << kelvin << "K," << getColor() << ")" << endl;
}

string StarBear::getColor() {
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
