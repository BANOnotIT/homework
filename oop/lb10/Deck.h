#ifndef LB10_DECK_H
#define LB10_DECK_H

#include <QString>

template<typename T>
class El {
public:
  El *next = nullptr;
  El *prev = nullptr;
  T val;
};

template<typename T>
class Deck {
protected:
  El<T> *start = nullptr;
  El<T> *end = nullptr;
public:
  T pop(bool fromStart);
  void push(T el, bool toStart);
  QString toString();
};

template<typename T>
T Deck<T>::pop(bool fromStart) {
  if(start==end){
    auto result = end->val;
    auto el = end;
    end = start = nullptr;
    delete el;
    return result;
  }

  if (fromStart) {
    auto result = start->val;
    auto el = start;
    start = start->next;
    delete el;
    start->prev = nullptr;
    return result;
  } else {
    auto result = end->val;
    auto el = end;
    end = end->prev;
    delete el;
    end->next = nullptr;
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

template<typename T>
QString Deck<T>::toString() {
  QString result;
  auto *tmp = start;
  while (tmp != nullptr) {
    result += tmp->val + "\n";
    tmp = tmp->next;
  }
  return result;
}


#endif //LB10_DECK_H
