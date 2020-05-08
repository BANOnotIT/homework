#ifndef TRIANGLE_H
#define TRIANGLE_H

#include "animatedpainer.h"



class Triangle : public Figure
{Q_OBJECT
public:
  explicit Triangle(QWidget *parent = nullptr, float speed = 0) : Figure(parent,speed, 4) {};
protected:
  QVector<QPoint> getPoints();
};

#endif // TRIANGLE_H
