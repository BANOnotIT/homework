#include <iostream>
#include "Mushroom.h"
#include "Basket.h"

int main() {
    Mushroom mushroom1("Поганка", .255, Partly);
    Mushroom mushroom2("Мухомор", .1, Deadly);
    Mushroom mushroom3("Опиаты", .4, None);

    mushroom1.print();

    Basket basket;

    std::cout << "== Корзинка ==" << std::endl;
    basket.add(mushroom1);
    basket.add(mushroom2);
    basket.add(mushroom3);

    basket.print();

    std::cout << "== Станет легче в ==" << std::endl;
    std::cout << basket.poisonedRatio() << std::endl;

    basket.remove(1);
    std::cout << "== Корзинка с хорошими грибами ==" << std::endl;
    basket.print();

    return 0;
}
