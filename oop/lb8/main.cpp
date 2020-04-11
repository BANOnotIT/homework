#include <iostream>
#include "Rect.h"
#include "Frame.h"
#include <tuple>

using namespace std;

int main() {
    Rect a(10, 20);
    std::cout << (a.getArea() == 200) << std::endl;
    a.print();

    Frame b(20, 10, 5);
    auto full(b.getFullSize());
    std::cout << (get<0>(full) == 30) << (get<1>(full) == 20) << std::endl;
    b.print();
}
