#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "initDb.h"
#include "checkwindow.h"
#include "counterwindow.h"
#include "chartwindow.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QKeyEvent>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
    , phonesModel(new EditablePhonesModel(parent))
    , check(new CheckWindow(parent))
    , count(new CounterWindow(parent))
    , summary(new SummaryWindow(parent))
    , chart(new ChartWindow(parent))
{
    ui->setupUi(this);
    initDb();

    ui->tableView->setModel(phonesModel);

    phonesModel->refresh();

    chart->setWindowModality(Qt::ApplicationModal);
    count->setWindowModality(Qt::ApplicationModal);
    summary->setWindowModality(Qt::ApplicationModal);
    check->setWindowModality(Qt::ApplicationModal);
}

MainWindow::~MainWindow()
{
    delete ui;
    delete phonesModel;
    delete chart;
    delete count;
    delete summary;
    delete check;
}

void MainWindow::keyPressEvent(QKeyEvent *event)
{
  if(event->modifiers() & Qt::ShiftModifier) {
    switch (event->key()) {
      case Qt::Key_Delete:{
        int rowId = ui->tableView->currentIndex().row();
        auto r = phonesModel->deleteRow(rowId);
        phonesModel->refresh();
        break;
      }
      case Qt::Key_Insert:{
        phonesModel->insertEmptyRow();
        phonesModel->refresh();
        auto s = phonesModel->rowCount() - 1;
        ui->tableView->selectRow(s);
        break
      }
    }
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

void MainWindow::on_pushButton_4_clicked()
{
    chart->show();
}
