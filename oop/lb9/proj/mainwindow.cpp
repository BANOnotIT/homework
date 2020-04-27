#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->spinBox->setRange(0, 255);
    ui->horizontalSlider->setRange(0,255);
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_spinBox_valueChanged(int arg1)
{
    val = arg1;
    refresh();
}

void MainWindow::refresh()
{
    ui->spinBox->setValue(val);
    ui->horizontalSlider->setValue(val);
}

void MainWindow::on_horizontalSlider_valueChanged(int value)
{
    val=value;
    refresh();
}
