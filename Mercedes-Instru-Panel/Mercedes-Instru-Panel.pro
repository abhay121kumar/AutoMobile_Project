
# QT += quick
# QT += widgets
# QT += qml
# QT += quickcontrols2
# QT += multimedia
# QT += core
# QT += gui
# QT += network
# QT += concurrent
# QT += quickwidgets

QT += quick widgets multimedia core gui network concurrent quickcontrols2 quickwidgets


RESOURCES += \
    qml.qrc

SOURCES += \
    Controllers/audiocontroller.cpp \
    Controllers/callmanager.cpp \
    Controllers/contactmanager.cpp \
    Controllers/hvachandler.cpp \
    Controllers/musiccontroller.cpp \
    Controllers/smsmanager.cpp \
    Controllers/system.cpp \
    Controllers/topbarmanager.cpp \
    Controllers/voicecontroller.cpp \
    main.cpp

HEADERS += \
    Controllers/audiocontroller.h \
    Controllers/callmanager.h \
    Controllers/contactmanager.h \
    Controllers/hvachandler.h \
    Controllers/musiccontroller.h \
    Controllers/smsmanager.h \
    Controllers/system.h \
    Controllers/topbarmanager.h \
    Controllers/voicecontroller.h

