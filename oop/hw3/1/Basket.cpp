//
// Created by banonotit on 07.05.2020.
//

#include "Basket.h"

void Basket::add(Mushroom mushroom) {
    mushrooms.push_back(std::move(mushroom));
}

void Basket::remove(int position) {
    mushrooms.erase(mushrooms.begin() + position);
}

float Basket::poisonedRatio() const {
    float poisoned(0), sum(0);
    for (auto &mush : mushrooms) {
        sum += mush.getMass();
        if (mush.getPoisoned() == Deadly)
            poisoned += mush.getMass();
    }

    return (sum - poisoned) / sum;
}

void Basket::print() const {
    for (auto &mush : mushrooms)
        mush.print();
}
