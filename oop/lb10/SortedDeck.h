// This is a personal academic project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++, C#, and Java: http://www.viva64.com
//
// Created by banonotit on 13.03.2020.
//

#ifndef LB10_SORTEDDECK_H
#define LB10_SORTEDDECK_H


#include "Deck.h"
#include <string>

template<typename T>
class SortedDeck : Deck<T> {
public:
    void sort();

private:
    bool grater(int a, int b);

    bool grater(const std::string &a, const std::string &b);

    void pushOrdered(T val);
};

template<class T>
void SortedDeck<T>::sort() {
    if (this->start == nullptr)
        return;

    El<T> *tmp = this->start;
    this->start = this->end = nullptr;

    push(tmp->val, true);

    tmp = tmp->next;
    while (tmp) {
        delete tmp->prev;

        pushOrdered(tmp->val);
        tmp = tmp->next;
    }
}

template<class T>
bool SortedDeck<T>::grater(int a, int b) {
    return a > b;
}

template<class T>
bool SortedDeck<T>::grater(const std::string &a, const std::string &b) {
    return a.compare(b) > 0;
}

template<class T>
void SortedDeck<T>::pushOrdered(T val) {
    if (this->start == nullptr || grater(this->start->val, val))
        return push(val, true);

    auto *tmp = this->start;
    while (tmp != nullptr && grater(val, tmp->val))
        tmp = tmp->next;

    if (tmp == nullptr)
        return push(val, false);

    else {
        auto *a = new El<T>;
        a->val = val;

        // prepare
        a->prev = tmp->prev;
        a->next = tmp;
        // insert
        tmp->prev = a->prev->next = a;
    }
}


#endif //LB10_SORTEDDECK_H
