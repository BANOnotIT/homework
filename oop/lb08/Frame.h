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
    std::tuple<int, int> getFullSize();

    Frame(int w, int h, int g);

    void print() override;
};


#endif //LB08_FRAME_H
