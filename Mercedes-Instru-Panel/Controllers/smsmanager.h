#ifndef SMSMANAGER_H
#define SMSMANAGER_H

#include <QObject>

class SMSManager : public QObject
{
    Q_OBJECT
public:
    explicit SMSManager(QObject *parent = nullptr);

signals:
};

#endif // SMSMANAGER_H
