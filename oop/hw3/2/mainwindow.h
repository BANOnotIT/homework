#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "pendulum.h"
#include "line.h"
#include "dblpendulum.h"

#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
  Q_OBJECT

public:
  MainWindow(QWidget *parent = nullptr);
  ~MainWindow();


private:
  Ui::MainWindow *ui;

  QTimer *ticker;

  Line *line;
  DblPendulum *dblpendulum;
  Pendulum *pendulum;

};
#endif // MAINWINDOW_H
