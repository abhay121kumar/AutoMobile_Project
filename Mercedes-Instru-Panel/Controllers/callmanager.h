#pragma once

#include <QObject>

class CallManager : public QObject
{
    Q_OBJECT
public:
    static CallManager& getInstance() {
        static CallManager instance;
        return instance;
    }

    Q_INVOKABLE void startCall(const QString& contactName);

signals:
    void callStarted(const QString& contactName);

private:
    explicit CallManager(QObject *parent = nullptr);
    ~CallManager() = default;
    Q_DISABLE_COPY(CallManager)
};
