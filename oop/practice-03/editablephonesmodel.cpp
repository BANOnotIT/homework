#include "editablephonesmodel.h"
#include <QSqlQuery>

const char* fields[7]  {
   "ROWID", "title", "brand", "receiptDate", "amount", "cost", "producer"
};

EditablePhonesModel::EditablePhonesModel(QObject *parent)
    : QSqlQueryModel(parent)
{}

Qt::ItemFlags EditablePhonesModel::flags(const QModelIndex &index) const
{
    Qt::ItemFlags flags = QSqlQueryModel::flags(index);
    // Все кроме первого столбца
    if (index.column() != 0)
        flags |= Qt::ItemIsEditable;
    return flags;
}

bool EditablePhonesModel::setData(const QModelIndex &index, const QVariant &value, int /* role */)
{
    if (index.column() < 1)
        return false;

    QModelIndex primaryKeyIndex = QSqlQueryModel::index(index.row(), 0);
    int id = data(primaryKeyIndex).toInt();

    clear();

    bool ok = setField(id, index.column(), value);

    refresh();
    return ok;
}

bool EditablePhonesModel::setField(int prodcutId, int field, const QVariant &value)
{
    QSqlQuery query;
    query.prepare("UPDATE products SET ? = ? WHERE ROWID = ?");
    query.addBindValue(fields[field]);
    query.addBindValue(value);
    query.addBindValue(prodcutId);
    return query.exec();
}

void EditablePhonesModel::refresh()
{
    setQuery("SELECT ROWID, title, brand, receiptDate, amount, cost, producer FROM products");
    for (int i=0; i<7; i++){
        setHeaderData(i,Qt::Horizontal, QObject::tr(fields[i]));
    }
}

