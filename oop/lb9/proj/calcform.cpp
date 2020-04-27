#include "calcform.h"
#include "ui_calcform.h"

CalcForm::CalcForm(QWidget *parent) :
  QWidget(parent),
  ui(new Ui::CalcForm)
{
  ui->setupUi(this);
}

CalcForm::~CalcForm()
{
  delete ui;
}
