#include "checkwindow.h"
#include "ui_checkwindow.h"

#include <QMessageBox>
#include <QSqlQuery>

CheckWindow::CheckWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::CheckWindow)
{
    ui->setupUi(this);
}

CheckWindow::~CheckWindow()
{
    delete ui;
}

void CheckWindow::on_pushButton_clicked()
{
    auto title = this->ui->titleEdit->text();
    auto producer = this->ui->producerEdit->text();

    QSqlQuery query;
    query.prepare("SELECT * FROM products WHERE title = ? AND producer = ?");
    query.addBindValue(title);
    query.addBindValue(producer);
    query.exec();

    QMessageBox::information(this,QObject::tr("result"), QObject::tr(query.next() ? "exists" : "does not exist"));
}
