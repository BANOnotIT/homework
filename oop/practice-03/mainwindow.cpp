#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
    , phonesModel(new EditablePhonesModel(parent))
{

    ui->setupUi(this);
    ui->tableView->setModel(phonesModel);
    phonesModel->refresh();

    qDebug() << "TEASGASDFASDFASDFASDF";



    QSqlQuery query("SELECT * FROM products");
    query.exec();
    while (query.next()) {
        qDebug() << (QString)query.value(0).toString();
    }
    qDebug() << "TEASGASDFASDFASDFASDF";
}

MainWindow::~MainWindow()
{
    delete ui;
    delete phonesModel;
}
