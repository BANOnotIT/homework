#ifndef EDITABLEPHONESMODEL_H
#define EDITABLEPHONESMODEL_H

#include <QSqlQueryModel>



class EditablePhonesModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    EditablePhonesModel(QObject *parent = nullptr);

    Qt::ItemFlags flags(const QModelIndex &index) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    void refresh();
private:
    bool setField(int prodcutId, int field, const QVariant &value);
};

#endif // EDITABLEPHONESMODEL_H
