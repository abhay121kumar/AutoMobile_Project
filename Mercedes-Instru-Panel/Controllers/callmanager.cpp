#include "CallManager.h"
#include "TopBarManager.h"

CallManager::CallManager(QObject *parent)
    : QObject(parent)
{
}

void CallManager::startCall(const QString &contactName)
{
    emit callStarted(contactName);

    // Also update TopBarManager directly
    TopBarManager::getInstance().setCallStatus(QString("Calling %1...").arg(contactName));
}
