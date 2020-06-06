#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QHBoxLayout>
#include <QTimer>

MainWindow::MainWindow(QWidget *parent)
  : QMainWindow(parent)
  , ui(new Ui::MainWindow)
  , ticker(new QTimer)
  , line(new Line(parent, 4,60))
  , dblpendulum(new DblPendulum(parent,7, 40))
  , pendulum(new Pendulum(parent,9, 20))
{
  line->setup();
  dblpendulum->setup();
  pendulum->setup();

  ticker->setInterval(16); // nearly fps

  auto *a = new QHBoxLayout();
  a->addWidget(line);
  a->addWidget(pendulum);
  a->addWidget(dblpendulum);
  auto *tmp = new QWidget;
  tmp->setLayout(a);
  setCentralWidget(tmp);

  connect(ticker,SIGNAL(timeout()),line,SLOT(update()));
  connect(ticker,SIGNAL(timeout()),dblpendulum,SLOT(update()));
  connect(ticker,SIGNAL(timeout()),pendulum,SLOT(update()));

  ticker->start();
}

MainWindow::~MainWindow()
{
  delete ui;
}
