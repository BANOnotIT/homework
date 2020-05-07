//
// Created by banonotit on 07.05.2020.
//

#include "Mushroom.h"
#include <iostream>

void Mushroom::print() const {
    std::cout << title << " : (" << mass << ", poison level: " << poisoned << ')' << std::endl;
}

float Mushroom::getMass() const {
    return mass;
}


Poisoness Mushroom::getPoisoned() const{
    return poisoned;
}
