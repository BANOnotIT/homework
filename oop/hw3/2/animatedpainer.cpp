#include "animatedpainer.h"

#include <QPainter>
#include <QTime>
#include <QtMath>
#include <QDebug>

Figure::Figure(QWidget *parent, float speed,float amplitude, float ssize)
  : QWidget(parent)
  , ssize(ssize)
  , speed(speed)
  , amplitude(amplitude)
  , start( QTime::currentTime().msecsSinceStartOfDay()) { }

void Figure::setup()
{
  path = this->getPath();
  auto p = this->rotatePoint();
  auto toOrigin = QTransform::fromTranslate(-p.rx(),-p.ry());
  path = toOrigin.map(path);
}

void Figure::paintEvent(QPaintEvent *)
{
  QPainter p(this);

  auto currentSize = size();
  float ms = qMin(currentSize.height(),currentSize.width());
  auto cur = QTime::currentTime().msecsSinceStartOfDay();

  auto O = this->rotatePoint();

  float ratio = ms / ssize / M_SQRT2;
  auto globalTransform = QTransform()
      .rotate(amplitude * qSin((float)(cur - start) / 1000. * speed))
      .translate(O.rx(),O.ry())
      .translate(-ssize/2,-ssize/2)
      .scale(ratio,ratio);

  p.fillRect(0,0, currentSize.width(),currentSize.height(),QColorConstants::White);
  p.setTransform(QTransform::fromTranslate(currentSize.width()/2,currentSize.height()/3));

  p.setPen(QPen(Qt::black,2,Qt::SolidLine));
  p.drawPath(globalTransform.map(path));
}
