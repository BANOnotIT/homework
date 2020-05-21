#ifndef SORTABLEDECKFORM_H
#define SORTABLEDECKFORM_H

#include <QWidget>
#include "SortableDeck.h"

namespace Ui {
  class SortableDeckForm;
}

class SortableDeckForm : public QWidget {
  Q_OBJECT;
public:
  explicit SortableDeckForm(QWidget *parent = nullptr);
  ~SortableDeckForm();

private:
  Ui::SortableDeckForm *ui;
  SortableDeck<QString> *deck;

public slots:
  void push();
  void pop();
  void sort();
  void print();
};
#endif // SORTABLEDECKFORM_H
