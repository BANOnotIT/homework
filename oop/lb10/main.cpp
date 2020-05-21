#include "sortabledeckform.h"

#include <QApplication>

int main(int argc, char *argv[])
{
  QApplication a(argc, argv);
  SortableDeckForm stringform;
  stringform.show();
  return a.exec();
}
