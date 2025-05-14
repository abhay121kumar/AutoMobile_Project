



// Controllers/MusicController.h
#pragma once
#include <QObject>
#include <QStringList>
#include <QSoundEffect>

class MusicController : public QObject {
    Q_OBJECT
    Q_PROPERTY(QStringList trackList READ trackList CONSTANT)
    Q_PROPERTY(QString currentTitle READ currentTitle NOTIFY currentTrackChanged)
    Q_PROPERTY(bool isPlaying READ isPlaying NOTIFY playbackStateChanged)

public:
    static MusicController& instance() {
        static MusicController inst;
        return inst;
    }

    QStringList trackList() const { return m_titles; }
    QString currentTitle() const;
    bool isPlaying() const { return m_sound->isPlaying(); }

    Q_INVOKABLE void play();
    Q_INVOKABLE void pause();   // QSoundEffect only has stop(); we'll map pause→stop
    Q_INVOKABLE void stop();
    Q_INVOKABLE void togglePlay();
    Q_INVOKABLE void next();
    Q_INVOKABLE void prev();
    Q_INVOKABLE void playTrack(int index);

signals:
    void playbackStateChanged();
    void currentTrackChanged();

private:
    explicit MusicController(QObject* parent = nullptr);
    QStringList        m_urls;    // resource URLs
    QStringList        m_titles;  // friendly names
    int                m_currentIndex;
    QSoundEffect*      m_sound;
};


