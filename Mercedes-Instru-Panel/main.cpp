#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QQmlContext>

#include<Controllers/system.h>
#include<Controllers/hvachandler.h>
#include<Controllers/audiocontroller.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    System m_systemHandler;
    HVACHandler m_driverHVACHandler;
    HVACHandler m_passenderHVACHandler;
    AudioController m_audioController;

    QQmlApplicationEngine engine;

    // ⚠️ Expose before loading QML
    engine.rootContext()->setContextProperty("systemHandler", &m_systemHandler);
    engine.rootContext()->setContextProperty("driverHVAC", &m_driverHVACHandler);
    engine.rootContext()->setContextProperty("passengerHVAC", &m_passenderHVACHandler);
    engine.rootContext()->setContextProperty("audioController", &m_audioController);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

