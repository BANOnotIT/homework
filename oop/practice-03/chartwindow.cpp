#include "chartwindow.h"
#include "ui_chartwindow.h"

#include <QSqlQuery>
#include <QtCharts/QChartView>
#include <QtCharts/QLineSeries>
#include <QtCore/QDateTime>
#include <QtCharts/QDateTimeAxis>
#include <QtCore/QFile>
#include <QtCore/QTextStream>
#include <QtCharts/QValueAxis>
#include <QSqlError>

using namespace QtCharts;

ChartWindow::ChartWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::ChartWindow),
    chart(new QChart),
    chartView(new QChartView)
{
    ui->setupUi(this);

    chart->legend()->hide();

    chartView->setRenderHint(QPainter::Antialiasing);
    chartView->setChart(chart);

    ui->verticalLayout->addWidget(chartView);
}

ChartWindow::~ChartWindow()
{
    delete ui;
    delete chart;
    delete chartView;
}

void ChartWindow::on_pushButton_clicked()
{
    QString title = ui->lineEdit->text();

    chart->setTitle(QString("Receipt chart for %1").arg(title));

    QSqlQuery query;
    query.prepare("SELECT amount, receiptDate"
                  " FROM products"
                  " WHERE title = :title"
                  " ORDER BY receiptDate");
    query.bindValue(":title", title);
    query.exec();


    QLineSeries *series = new QLineSeries;

    while (query.next()) {
        QDateTime time;
        time.setDate(QDate::fromString(query.value(1).toString(), "yyyyMMdd"));
        series->append(time.toMSecsSinceEpoch(), query.value(0).toInt());
    }
    chart->removeAxis(axisX);
    chart->removeAxis(axisY);
    chart->removeAllSeries();
    chart->addSeries(series);

    axisX = new QDateTimeAxis;
    axisX->setFormat("MMM yyyy");
    axisX->setTitleText("Date");
    chart->addAxis(axisX, Qt::AlignBottom);
    series->attachAxis(axisX);

    axisY = new QValueAxis;
    axisY->setLabelFormat("%i");
    axisY->setTitleText("Sunspots count");
    chart->addAxis(axisY, Qt::AlignLeft);
    series->attachAxis(axisY);
}
