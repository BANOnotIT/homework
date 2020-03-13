// Created by banonotit on 13.03.2020.
//

#ifndef LB10_DECK_H
#define LB10_DECK_H

template<typename T>
struct El {
    El *next;
    El *prev;
    T val;
};

template<typename T>
class Deck {
protected:
    El<T> *start;
    El<T> *end;
public:
    T pop(bool fromStart);

    void push(T el, bool toStart);
};

template<typename T>
T Deck<T>::pop(bool fromStart) {
    if (fromStart) {
        auto result = start->val;
        start = start->next;
        delete start->prev;
        return result;
    } else {
        auto result = end->val;
        end = end->prev;
        delete end->next;
        return result;
    }
}

template<typename T>
void Deck<T>::push(T el, bool toStart) {
    auto *s = new El<T>;
    s->val = el;

    if (start == nullptr) {
        end = start = s;
        return;
    }

    if (toStart) {
        s->next = start;
        s->next->prev = start = s;
    } else {
        s->prev = end;
        s->prev->next = end = s;
    }
}


#endif //LB10_DECK_H
