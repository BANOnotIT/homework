#include "summarywindow.h"
#include "ui_summarywindow.h"

#include <QSqlQuery>
#include <QSqlError>

SummaryWindow::SummaryWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::SummaryWindow)
{
    ui->setupUi(this);
}

SummaryWindow::~SummaryWindow()
{
    delete ui;
}

void SummaryWindow::on_pushButton_clicked()
{
    QSqlQuery query;
    query.prepare("SELECT sum(cost*amount)"
                  " FROM products"
                  " WHERE receiptDate > :date");
    query.bindValue(":date", ui->lineEdit->text());
    query.exec();

    auto a = query.lastError();
    auto b = query.executedQuery();

    auto s = query.next();

    ui->label->setText(query.value(0).toString());
}
