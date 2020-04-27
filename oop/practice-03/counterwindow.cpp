#include "counterwindow.h"
#include "ui_counterwindow.h"

#include <QSqlQuery>
#include <QSqlError>

CounterWindow::CounterWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::CounterWindow),
    model(new QSqlQueryModel)
{
    ui->setupUi(this);
    ui->tableView->setModel(model);
    model->setHeaderData(0,Qt::Horizontal,CounterWindow::tr("Title"));
    model->setHeaderData(1,Qt::Horizontal,CounterWindow::tr("Brand"));
    model->setHeaderData(2,Qt::Horizontal,CounterWindow::tr("Count"));
}

CounterWindow::~CounterWindow()
{
    delete ui;
}

void CounterWindow::on_pushButton_clicked()
{
    QSqlQuery query;
    query.prepare("SELECT title, brand, min((:cost / cost), amount) as maxCount "
                  "FROM products "
                  "WHERE cost <= :cost");
    auto cost = ui->costEdit->text().toUInt();
    query.bindValue(":cost",cost);

    query.exec();
    auto a = query.lastError();

    model->setQuery(query);
}
