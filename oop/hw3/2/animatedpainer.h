#ifndef ANIMATEDPAINER_H
#define ANIMATEDPAINER_H

#include <QWidget>

class Figure : public QWidget
{
  Q_OBJECT
public:
  explicit Figure(QWidget *parent = nullptr, float speed = 0, float amplitude = 0, float ssize = 0);
  void setup();
  void paintEvent(QPaintEvent *event) override;

protected:
  virtual QPainterPath getPath() = 0;
  virtual QPointF rotatePoint() = 0;
  float ssize;

private:
  QPainterPath path;
  float speed;
  float amplitude;
  int start;

};

#endif // ANIMATEDPAINER_H
