#ifndef CALCFORM_H
#define CALCFORM_H

#include <QWidget>

namespace Ui {
  class CalcForm;
}

class CalcForm : public QWidget
{
  Q_OBJECT

public:
  explicit CalcForm(QWidget *parent = nullptr);
  ~CalcForm();

private:
  Ui::CalcForm *ui;
};

#endif // CALCFORM_H
