#include "StarBear.h"
#include "Star.h"

using namespace std;

int main() {
    StarBear sun;
    sun.initialize("sun", 5778);
    printf("%i\n", sun.getColor() == "yellow");
    sun.print();

    Star arcturus("Arcturus", 4286);
    printf("%i\n", arcturus.getColor() == "orange");
    arcturus.print();
}
