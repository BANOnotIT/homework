//
// Created by banonotit on 18.04.2020.
//

#ifndef RK3_CLASSES_H
#define RK3_CLASSES_H

class A {

protected:
    float D[10]{};

    virtual void Out() = 0;

public:
    void Print();

    A();
};

class B : public A {
    void Out() override;
};

class C : public A {
    void Out() override;
};

#endif //RK3_CLASSES_H
