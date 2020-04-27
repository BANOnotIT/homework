#ifndef DIALOGEX2_H
#define DIALOGEX2_H

#include <QDialog>

namespace Ui {
class DialogEx2;
}

class DialogEx2 : public QDialog
{
    Q_OBJECT

public:
    explicit DialogEx2(QWidget *parent = nullptr);
    ~DialogEx2();

private:
    Ui::DialogEx2 *ui;
};

#endif // DIALOGEX2_H
