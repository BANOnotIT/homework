#include <iostream>
#include "Classes.h"

int main() {
    B *b = new B;
    C *c = new C;

    std::cout << " === B class ===" << std::endl;
    b->Print();
    std::cout << " === C class === " << std::endl;
    c->Print();
}
