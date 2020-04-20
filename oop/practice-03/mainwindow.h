#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "checkwindow.h"
#include "counterwindow.h"
#include "editablephonesmodel.h"
#include "summarywindow.h"
#include "chartwindow.h"

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

    CheckWindow *check;
    CounterWindow *count;
    SummaryWindow *summary;
    ChartWindow *chart;

protected:
    void keyPressEvent(QKeyEvent *event);
private slots:
    void on_pushButton_clicked();
    void on_pushButton_2_clicked();
    void on_pushButton_3_clicked();

    void on_pushButton_4_clicked();
};
#endif // MAINWINDOW_H
