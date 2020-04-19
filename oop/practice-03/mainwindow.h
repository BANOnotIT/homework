#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "checkwindow.h"
#include "editablephonesmodel.h"

#include <QKeyEvent>
#include <QMainWindow>
#include <QSqlDatabase>

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
    EditablePhonesModel *phonesModel;

protected:
    void keyPressEvent(QKeyEvent *event);
private slots:
    void on_pushButton_clicked();
};
#endif // MAINWINDOW_H
