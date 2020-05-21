#ifndef LB10_SORTABLEDECK_H
#define LB10_SORTABLEDECK_H

#include "Deck.h"
#include <QString>
#include <string>

template<typename T>
class SortableDeck : public Deck<T> {
public:
  void sort(){
    if (this->start == nullptr)
      return;

    El<T> *tmp = this->start;
    this->start = this->end = nullptr;

    this->push(tmp->val, true);

    tmp = tmp->next;
    while (tmp) {
      pushOrdered(tmp->val);
      tmp = tmp->next;
    }
  }

private:
  bool grater(T a, T b) {
    return a > b;
  }

  void pushOrdered(T val) {
    if (this->start == nullptr || grater(this->start->val, val))
      return this->push(val, true);

    auto *tmp = this->start;
    while (tmp != nullptr && grater(val, tmp->val))
      tmp = tmp->next;

    if (tmp == nullptr)
      return this->push(val, false);

    else {
      auto *a = new El<T>;
      a->val = val;

      a->prev = tmp->prev;
      a->next = tmp;

      tmp->prev = a->prev->next = a;
    }
  }
};
#endif //LB10_SORTABLEDECK_H
