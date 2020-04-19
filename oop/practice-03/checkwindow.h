#ifndef CHECKWINDOW_H
#define CHECKWINDOW_H

#include <QMainWindow>

namespace Ui {
class CheckWindow;
}

class CheckWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit CheckWindow(QWidget *parent = nullptr);
    ~CheckWindow();

private slots:
    void on_pushButton_clicked();

private:
    Ui::CheckWindow *ui;
};

#endif // CHECKWINDOW_H
