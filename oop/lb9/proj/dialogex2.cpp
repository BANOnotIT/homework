#include "dialogex2.h"
#include "ui_dialogex2.h"

DialogEx2::DialogEx2(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::DialogEx2)
{
    ui->setupUi(this);
}

DialogEx2::~DialogEx2()
{
    delete ui;
}
