#include "mainwindow.h"
#include "dialogex2.h"
#include "doubleform.h"
#include "calcform.h"
#include "texteditor.h"

#include <QApplication>
#include <QWidget>

int main(int argc, char *argv[])
{
  QApplication a(argc, argv);

  MainWindow w;
  DialogEx2 d2;
  DoubleForm dbl;
  CalcForm calc;
  TextEditor text;


  //    w.show();
  //    d2.show();
  //    dbl.show();
  //    calc.show();
  text.show();


  return a.exec();
}
