#ifndef TEXTEDITOR_H
#define TEXTEDITOR_H

#include <QTextEdit>
#include <QWidget>
#include <QLineEdit>
#include <QPushButton>

class TextEditor : public QWidget
{
  Q_OBJECT

  QTextEdit *output;
  QLineEdit *input;
  QPushButton *btn;

  bool shouldBeUpper = false;

public:
  explicit TextEditor(QWidget *parent = nullptr);

private slots:
  void logInput();
  void logConverted();

};

#endif // TEXTEDITOR_H
