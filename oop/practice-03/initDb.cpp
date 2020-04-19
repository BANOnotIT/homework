#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QDebug>

QSqlError initDb()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
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

    QSqlQuery query("SELECT * FROM products");
    query.exec();

    while(query.next())
        qDebug()<<query.value(0);
    qDebug() << "table222222";

    return QSqlError();
}
