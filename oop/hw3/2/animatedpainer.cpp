#include "animatedpainer.h"

#include <QPainter>
#include <QTime>
#include <QtMath>
#include <QDebug>

Figure::Figure(QWidget *parent, float speed, float ssize)
  : QWidget(parent)
  , ssize(ssize)
  , speed(speed)
  , start( QTime::currentTime().msecsSinceStartOfDay()) { }

void Figure::setup()
{
  auto points = this->getPoints();
  path.moveTo(points[0]);
  for (auto point : points)
      path.lineTo(point);
  path.lineTo(points[0]);
  auto toOrigin = QTransform::fromTranslate(-ssize/2,-ssize/2);
  path = toOrigin.map(path);
}

void Figure::paintEvent(QPaintEvent *)
{
  QPainter p(this);

  auto currentSize = size();
  float ms = qMin(currentSize.height(),currentSize.width());
  auto cur = QTime::currentTime().msecsSinceStartOfDay();

  float ratio = ms / ssize / M_SQRT2;
  auto globalTransform = QTransform()
      .rotate((float)((cur - start)) / M_PI * speed)
      .scale(ratio,ratio);

  p.fillRect(0,0, currentSize.width(),currentSize.height(),QColorConstants::White);
  p.setTransform(QTransform::fromTranslate(currentSize.width()/2,currentSize.height()/2));

  p.setPen(QPen(Qt::black,2,Qt::SolidLine));
  p.drawPath(globalTransform.map(path));
}
