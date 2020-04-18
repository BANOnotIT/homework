
#include "mainwindow.h"
#include "initDb.h"

#include <QApplication>

int main(int argc, char *argv[])
{
    initDb();

    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    return a.exec();
}
