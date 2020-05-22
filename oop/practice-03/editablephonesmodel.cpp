#include "editablephonesmodel.h"
#include <QSqlQuery>
#include <QSqlError>

const char* fields[6]  {
   "title", "brand", "receiptDate", "amount", "cost", "producer"
};

EditablePhonesModel::EditablePhonesModel(QObject *parent)
    : QSqlQueryModel(parent)
{}

Qt::ItemFlags EditablePhonesModel::flags(const QModelIndex &index) const
{
    Qt::ItemFlags flags = QSqlQueryModel::flags(index);
    flags |= Qt::ItemIsEditable;
    return flags;
}

bool EditablePhonesModel::setData(const QModelIndex &index, const QVariant &value, int /* role */)
{
    bool ok = setField(index.row(), index.column(), value);

    refresh();
    return ok;
}

bool EditablePhonesModel::setField(int prodcutId, int field, const QVariant &value)
{
    QSqlQuery query;
    query.prepare("UPDATE products SET " + QString(fields[field]) + " = ? WHERE ROWID = ?");
    query.addBindValue(value);
    query.addBindValue(prodcutId + 1);
    return query.exec();
}

void EditablePhonesModel::refresh()
{
    clear();
    setQuery("SELECT title, brand, receiptDate, amount, cost, producer FROM products");
    for (int i=0; i<6; i++){
        setHeaderData(i,Qt::Horizontal, QObject::tr(fields[i]));
    }
}

bool EditablePhonesModel::deleteRow(int rowId)
{
    QSqlQuery query;
    // удалить строчку и пересчитать все номера строчек
    query.prepare("DELETE FROM products WHERE ROWID = ?");
    query.addBindValue(rowId+1);
    bool ok  = query.exec();

    // пересчитываем колонки, если успешно удалили
    if (ok) ok = QSqlQuery("VACUUM").exec();
    return ok;
}

bool EditablePhonesModel::insertEmptyRow()
{
    QSqlQuery query("INSERT INTO products (title, brand, receiptDate, amount, cost, producer)"
                    "VALUES ('', '', '', 0, 0, '')");
    return query.exec();
}

