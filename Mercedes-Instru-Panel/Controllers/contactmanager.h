#pragma once

#include <QObject>
#include <QStringList>

class ContactManager : public QObject
{
    Q_OBJECT
public:
    static ContactManager& getInstance() {
        static ContactManager instance;
        return instance;
    }

    Q_INVOKABLE QStringList getContactList() const {
        return m_contacts;
    }

    Q_INVOKABLE void refreshContacts(); // <-- Added method to refresh

private:
    explicit ContactManager(QObject *parent = nullptr);
    ~ContactManager() = default;
    Q_DISABLE_COPY(ContactManager)

    QStringList m_contacts;
};
