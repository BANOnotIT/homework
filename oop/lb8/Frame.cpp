//
// Created by banonotit on 13.03.2020.
//

#include "Frame.h"
#include <iostream>

std::tuple<int, int> Frame::getFullSize() {
    return std::tuple<int, int>(2 * gut + width, 2 * gut + height);
}

void Frame::print() {
    std::cout << width << "x" << height << " " << gut << std::endl;
}

Frame::Frame(int w, int h, int g) : gut(g), Rect(w, h) {}
