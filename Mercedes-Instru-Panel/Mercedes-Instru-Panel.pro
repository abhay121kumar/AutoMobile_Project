QT += quick widgets
QT += location
QT += quick

RESOURCES += \
    qml.qrc

SOURCES += \
    Controllers/audiocontroller.cpp \
    Controllers/hvachandler.cpp \
    Controllers/system.cpp \
    main.cpp

HEADERS += \
    Controllers/audiocontroller.h \
    Controllers/hvachandler.h \
    Controllers/system.h
