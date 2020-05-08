#ifndef LINE_H
#define LINE_H

#include "animatedpainer.h"

class Line : public Figure
{

  Q_OBJECT
public:
  explicit Line(QWidget *parent = nullptr, float speed = 0) : Figure(parent,speed, 2) {};
protected:
  QVector<QPoint> getPoints();
};

#endif // LINE_H
