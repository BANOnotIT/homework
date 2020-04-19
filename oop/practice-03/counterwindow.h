#ifndef COUNTERWINDOW_H
#define COUNTERWINDOW_H

#include <QMainWindow>
#include <QSqlQueryModel>

namespace Ui {
class CounterWindow;
}

class CounterWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit CounterWindow(QWidget *parent = nullptr);
    ~CounterWindow();

private slots:
    void on_pushButton_clicked();

private:
    Ui::CounterWindow *ui;
    QSqlQueryModel *model;
};

#endif // COUNTERWINDOW_H
