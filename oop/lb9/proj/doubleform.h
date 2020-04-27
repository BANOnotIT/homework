#ifndef DOUBLEFORM_H
#define DOUBLEFORM_H

#include <QWidget>
#include "dialogex2.h"

namespace Ui {
class DoubleForm;
}

class DoubleForm : public QWidget
{
    Q_OBJECT


public:
    explicit DoubleForm(QWidget *parent = nullptr);
    ~DoubleForm();

private:
    Ui::DoubleForm *ui;

    DialogEx2 *a,*b;
};

#endif // DOUBLEFORM_H
