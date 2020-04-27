#include "doubleform.h"
#include "ui_doubleform.h"
#include "dialogex2.h"

DoubleForm::DoubleForm(QWidget *parent)
  : QWidget(parent)
  , ui(new Ui::DoubleForm)
  , a(new DialogEx2)
  , b(new DialogEx2)

{
  ui->setupUi(this);

  ui->horizontalLayout->addWidget(a);
  ui->horizontalLayout->addWidget(b);
}

DoubleForm::~DoubleForm()
{
  delete ui;
}



