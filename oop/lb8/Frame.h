//
// Created by banonotit on 13.03.2020.
//

#ifndef LB08_FRAME_H
#define LB08_FRAME_H


#include "Rect.h"
#include <tuple>

class Frame : Rect {
private:
    int gut;
public:
    Frame(int w, int h, int g);

    std::tuple<int, int> getFullSize();
    void print();
};


#endif //LB08_FRAME_H
