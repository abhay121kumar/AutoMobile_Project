#include "ContactManager.h"

ContactManager::ContactManager(QObject *parent)
    : QObject(parent)
{
    // Initial contact list
    m_contacts << "John Doe" << "Alice Smith" << "Bob Johnson";
}

void ContactManager::refreshContacts()
{
    // (In future) Refresh logic from database/network
    // For now, just clear and reload same mock data
    m_contacts.clear();
    m_contacts << "John Doe" << "Alice Smith" << "Bob Johnson";
}


