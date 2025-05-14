#include "TopBarManager.h"

TopBarManager::TopBarManager(QObject *parent)
    : QObject(parent),
    m_callStatus("")
{
}

void TopBarManager::setCallStatus(const QString& status)
{
    if (m_callStatus != status) {
        m_callStatus = status;
        emit callStatusChanged();
    }
}
