#include "sortabledeckform.h"
#include "ui_sortabledeckform.h"

SortableDeckForm::SortableDeckForm(QWidget *parent)
  : QWidget(parent)
  , ui(new Ui::SortableDeckForm)
  , deck(new SortableDeck<QString>)
{
  ui->setupUi(this);
}

SortableDeckForm::~SortableDeckForm() {
  delete ui;
  delete deck;
}

void SortableDeckForm::push() {
  auto input = ui->input->text();
  auto inStart = ui->inStart->checkState() == Qt::CheckState::Checked;
  deck->push(input, inStart);
  ui->input->setText("");
  ui->log->appendPlainText(
    QString("add element %1 instart: %2")
      .arg(input)
      .arg(inStart)
  );
}

void SortableDeckForm::pop() {
  auto fromStart = ui->inStart->checkState() == Qt::CheckState::Checked;
  auto el = deck->pop(fromStart);
  ui->log->appendPlainText(
    QString("got element %1 fromstart: %2")
      .arg(el)
      .arg(fromStart)
  );
}

void SortableDeckForm::sort() {
  deck->sort();
  ui->log->appendPlainText("deck sorted");
}

void SortableDeckForm::print() {
  auto contentFromStart = deck->toString();

  ui->log->appendPlainText("deck content:");
  ui->log->appendPlainText(contentFromStart);
  ui->log->appendPlainText("/deck content end");
}
