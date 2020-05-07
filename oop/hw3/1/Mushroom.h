//
// Created by banonotit on 07.05.2020.
//

#ifndef HW3_MUSHROOM_H
#define HW3_MUSHROOM_H

#include <string>
#include <utility>

enum Poisoness {
    None,
    Partly,
    Deadly
};

class Mushroom {
private:
    Poisoness poisoned;
    float mass;
    std::string title;

public:
    void print() const;

    Mushroom(std::string title, float massa, Poisoness poison)
            : poisoned(poison), title(std::move(title)),
              mass(massa) {}

    [[nodiscard]] float getMass() const;

    [[nodiscard]] Poisoness getPoisoned() const;

};


#endif //HW3_MUSHROOM_H
