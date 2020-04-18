//
// Created by banonotit on 18.04.2020.
//

#include "Classes.h"
#include <ctime>
#include <iostream>


A::A() {
    srandom(time(nullptr));

    for (float &i : D) {
        i = static_cast<float>(random()) / static_cast<float>(RAND_MAX) * 1000.0;
    }
}

void A::Print() {
    Out();
}

void B::Out() {
    for (float i : D) {
        std::cout << i << '\t';
    }
    std::cout << std::endl;
}


void C::Out() {
    for (float i : D) {
        std::cout << i << std::endl;
    }
    std::cout << std::endl;
}
