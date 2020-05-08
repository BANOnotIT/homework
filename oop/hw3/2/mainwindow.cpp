#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QHBoxLayout>
#include <QTimer>

MainWindow::MainWindow(QWidget *parent)
  : QMainWindow(parent)
  , ui(new Ui::MainWindow)
  , ticker(new QTimer)
  , line(new Line(parent, .25))
  , triangle(new Triangle(parent,.15))
  , compass(new Compas(parent,.10))
{
//  ui->setupUi(this);

  line->setup();
  triangle->setup();
  compass->setup();

  ticker->setInterval(16); // nearly fps

  auto *a = new QHBoxLayout();
  a->addWidget(line);
  a->addWidget(triangle);
  a->addWidget(compass);
  auto *tmp = new QWidget;
  tmp->setLayout(a);
  setCentralWidget(tmp);


  connect(ticker,SIGNAL(timeout()),line,SLOT(update()));
  connect(ticker,SIGNAL(timeout()),triangle,SLOT(update()));
  connect(ticker,SIGNAL(timeout()),compass,SLOT(update()));


  ticker->start();
}

MainWindow::~MainWindow()
{
  delete ui;
}

