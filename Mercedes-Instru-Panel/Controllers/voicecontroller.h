#ifndef VOICECONTROLLER_H
#define VOICECONTROLLER_H

#include <QObject>

class VoiceController : public QObject
{
    Q_OBJECT
public:
    explicit VoiceController(QObject *parent = nullptr);

signals:
};

#endif // VOICECONTROLLER_H



