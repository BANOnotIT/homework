#ifndef LINE_H
#define LINE_H

#include "animatedpainer.h"

class Line : public Figure
{

  Q_OBJECT
public:
  explicit Line(QWidget *parent = nullptr, float speed = 0, float amplitude = 0) : Figure(parent, speed, amplitude, 4) {};
protected:
  QPainterPath getPath() override;
  QPointF rotatePoint() override;
};

#endif // LINE_H
