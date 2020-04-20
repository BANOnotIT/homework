#ifndef CHARTWINDOW_H
#define CHARTWINDOW_H

#include <QMainWindow>
#include <QtCharts/QChartView>
#include <QtCharts/QChart>
#include <QtCharts/QDateTimeAxis>
#include <QtCharts/QValueAxis>
#include <QtCharts/QLineSeries>

using namespace QtCharts;

namespace Ui {
class ChartWindow;
}

class ChartWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit ChartWindow(QWidget *parent = nullptr);
    ~ChartWindow();

private slots:
    void on_pushButton_clicked();

private:
    Ui::ChartWindow *ui;
    QChart *chart;
    QChartView *chartView;
    QDateTimeAxis *axisX;
    QValueAxis *axisY;
};

#endif // CHARTWINDOW_H
