#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "compas.h"
#include "line.h"
#include "triangle.h"

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
  Triangle *triangle;
  Compas *compass;

};
#endif // MAINWINDOW_H
