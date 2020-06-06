#ifndef TRIANGLE_H
#define TRIANGLE_H

#include "animatedpainer.h"



class DblPendulum : public Figure
{Q_OBJECT
public:
  explicit DblPendulum(QWidget *parent = nullptr,  float speed = 0, float amplitude = 0) : Figure(parent, speed, amplitude, 10) {};
protected:
  QPainterPath getPath() override;
  QPointF rotatePoint() override;
};

#endif // TRIANGLE_H
