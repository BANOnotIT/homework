//
// Created by banonotit on 07.05.2020.
//

#ifndef HW3_BASKET_H
#define HW3_BASKET_H

#include "vector"
#include "Mushroom.h"

class Basket {
private:
    std::vector<Mushroom> mushrooms;

public:
    Basket() = default;

    void add(Mushroom mushroom);
    void remove(int position);
    float poisonedRatio() const;
    void print() const;
};


#endif //HW3_BASKET_H
