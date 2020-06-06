#ifndef COMPAS_H
#define COMPAS_H

#include "animatedpainer.h"

#include <QObject>

class Pendulum : public Figure
{

  Q_OBJECT
public:
  explicit Pendulum(QWidget *parent = nullptr, float speed = 0, float amplitude = 0) : Figure(parent, speed, amplitude, 6) {};
protected:
  QPainterPath getPath() override;
  QPointF rotatePoint() override;
};

#endif // COMPAS_H
