#ifndef COMPAS_H
#define COMPAS_H

#include "animatedpainer.h"

#include <QObject>

class Compas : public Figure
{

  Q_OBJECT
public:
  explicit Compas(QWidget *parent = nullptr, float speed = 0) : Figure(parent,speed, 6) {};
protected:
  QVector<QPoint> getPoints();
};

#endif // COMPAS_H
