#ifndef INITDB_H
#define INITDB_H

#include <QSqlDatabase>
#include <QSqlError>
#include <QDebug>

QSqlError initDb()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE", "Connection");
    db.setDatabaseName("./DB.sqlite3");

    qDebug() << "table1";
    if (!db.open()){
        return db.lastError();
    }
    QStringList tables = db.tables();
    for (QString table : tables) {
        qDebug() << table;
    }
    qDebug() << "table";
    return QSqlError();
}


#endif // INITDB_H
