#include <QVBoxLayout>
#include <QLineEdit>
#include <QPushButton>
#include <QTextEdit>
#include "texteditor.h"

TextEditor::TextEditor(QWidget *parent)
  : QWidget(parent)
  , output(new QTextEdit)
  , input(new QLineEdit)
  , btn(new QPushButton)
{
  QVBoxLayout *layout = new QVBoxLayout();
  setLayout(layout);

  layout->addWidget(input);
  layout->addWidget(btn);
  layout->addWidget(output);

  btn->setText("Convert");
  output->setReadOnly(true);

  connect(input, SIGNAL(editingFinished()),
          this, SLOT(logInput()));
  connect(btn, SIGNAL(clicked()),
          this, SLOT(logConverted()));
}

void TextEditor::logInput()
{
  output->append(tr("input: %1").arg(input->text()));
  shouldBeUpper=false;
}

void TextEditor::logConverted()
{
  auto t = input->text();
  if (shouldBeUpper)
    output->append(tr("upper: %1").arg(t).toUpper());
  else
    output->append(tr("lower: %1").arg(t).toLower());

  shouldBeUpper ^= 1;
}

