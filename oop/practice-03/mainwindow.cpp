#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "initDb.h"
#include "checkwindow.h"
#include "counterwindow.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>
#include <QKeyEvent>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
    , phonesModel(new EditablePhonesModel(parent))
    , check(new CheckWindow(parent))
    , count(new CounterWindow(parent))
    , summary(new SummaryWindow(parent))
{
    ui->setupUi(this);
    initDb();
    ui->tableView->setModel(phonesModel);
    phonesModel->refresh();
}

MainWindow::~MainWindow()
{
    delete ui;
    delete phonesModel;
}

void MainWindow::keyPressEvent(QKeyEvent *event)
{
    qDebug() << event->modifiers() << event->key();
    if(event->modifiers() & Qt::ShiftModifier && event->key()==Qt::Key_Delete)
    {
        int rowId = ui->tableView->currentIndex().row();
        auto r = phonesModel->deleteRow(rowId);
        phonesModel->refresh();
    }
    else if (event->modifiers() & Qt::ShiftModifier && event->key()==Qt::Key_Insert)
    {
        phonesModel->insertEmptyRow();
        phonesModel->refresh();
        auto s = phonesModel->rowCount() - 1;
        ui->tableView->selectRow(s);
    }
}

void MainWindow::on_pushButton_clicked()
{
    check->show();
}

void MainWindow::on_pushButton_2_clicked()
{
    count->show();
}

void MainWindow::on_pushButton_3_clicked()
{
    summary->show();
}
