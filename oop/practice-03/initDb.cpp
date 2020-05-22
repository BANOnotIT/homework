#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>

QSqlError initDb()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("./DB.sqlite3");

    if (!db.open()){
        return db.lastError();
    }
    return QSqlError();
}
