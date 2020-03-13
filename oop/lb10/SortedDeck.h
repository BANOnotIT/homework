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
    El<T> *tmp = this->start;
    this->start = this->end = nullptr;

    push(tmp->val, true);

    while (tmp = tmp->next) {
        delete tmp->prev;

        push(tmp->val);
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
    if (this->start == nullptr) {
        push(val, true);
        return;
    }

    auto *tmp = this->start;

}


#endif //LB10_SORTEDDECK_H
