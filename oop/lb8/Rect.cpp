//
// Created by banonotit on 13.03.2020.
//

#include "Rect.h"
#include <iostream>

using namespace std;

Rect::Rect(int a, int b) : width(a), height(b) {}

int Rect::getArea() {
    return width * height;
}

void Rect::print() {
    cout << width << 'x' << height << endl;
}
