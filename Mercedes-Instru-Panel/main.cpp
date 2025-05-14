
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "Controllers/system.h"
#include "Controllers/hvachandler.h"
#include "Controllers/audiocontroller.h"
#include "Controllers/ContactManager.h"
#include "Controllers/CallManager.h"
#include "Controllers/SMSManager.h"
#include "Controllers/VoiceController.h"
#include "Controllers/TopBarManager.h"
#include "Controllers/MusicController.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    System m_systemHandler;
    HVACHandler m_driverHVACHandler;
    HVACHandler m_passengerHVACHandler;
    AudioController m_audioController;

    QQmlApplicationEngine engine;

    // Register singletons
    qmlRegisterSingletonInstance<ContactManager>("App.Backend", 1, 0, "ContactManager", &ContactManager::getInstance());
    qmlRegisterSingletonInstance<CallManager>("App.Backend", 1, 0, "CallManager", &CallManager::getInstance());
    qmlRegisterSingletonInstance<TopBarManager>("App.Backend", 1, 0, "TopBarManager", &TopBarManager::getInstance());
    qmlRegisterSingletonInstance<MusicController>("App.Backend", 1, 0, "MusicController", &MusicController::instance());
    // Register others
    qmlRegisterType<SMSManager>("App.Backend", 1, 0, "SMSManager");
    qmlRegisterType<VoiceController>("App.Backend", 1, 0, "VoiceController");

    // Set context properties
    engine.rootContext()->setContextProperty("systemHandler", &m_systemHandler);
    engine.rootContext()->setContextProperty("driverHVAC", &m_driverHVACHandler);
    engine.rootContext()->setContextProperty("passengerHVAC", &m_passengerHVACHandler);
    engine.rootContext()->setContextProperty("audioController", &m_audioController);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
