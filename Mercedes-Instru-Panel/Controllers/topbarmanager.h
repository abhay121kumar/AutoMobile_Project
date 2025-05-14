#pragma once

#include <QObject>
#include <QString>

class TopBarManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString callStatus READ callStatus NOTIFY callStatusChanged)

public:
    static TopBarManager& getInstance() {
        static TopBarManager instance;
        return instance;
    }

    QString callStatus() const {
        return m_callStatus;
    }

    Q_INVOKABLE void setCallStatus(const QString& status); // <-- Added as invokable

signals:
    void callStatusChanged();

private:
    explicit TopBarManager(QObject *parent = nullptr);
    ~TopBarManager() = default;
    Q_DISABLE_COPY(TopBarManager)

    QString m_callStatus;
};
