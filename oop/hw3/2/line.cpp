#include "line.h"


QPainterPath Line::getPath()
{
  QPainterPath path;
  path.moveTo(2,3);
  path.lineTo(2,1);

  return path;
}

QPointF Line::rotatePoint()
{
  return QPointF(2,1);
}
