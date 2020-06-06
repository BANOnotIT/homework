#include "dblpendulum.h"

QPainterPath DblPendulum::getPath()
{
  QPainterPath path;
  path.moveTo(3,7);
  path.lineTo(5,1);
  path.lineTo(7,7);
  path.addEllipse(QPointF(3,7),2,2);
  path.addEllipse(QPointF(7,7),2,2);

  return path;
}

QPointF DblPendulum::rotatePoint()
{
  return QPointF(5,1);
}
