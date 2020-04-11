//
// Created by banonotit on 13.03.2020.
//

#ifndef LB08_RECT_H
#define LB08_RECT_H


class Rect {
protected:
    int width, height;
public:
    Rect(int a, int b);

    int getArea();

    virtual void print();
};


#endif //LB08_RECT_H
