#include "pendulum.h"

QPainterPath Pendulum::getPath()
{

  QPainterPath path;

  path.moveTo(3,0);
  path.lineTo(3,4);
  path.addEllipse(QPointF(3, 4), 1, 1);

  return path;
}

QPointF Pendulum::rotatePoint()
{
  return QPointF(3,0);
}
