


// Controllers/MusicController.cpp
#include "MusicController.h"

MusicController::MusicController(QObject* parent)
    : QObject(parent),
    m_currentIndex(-1),
    m_sound(new QSoundEffect(this))
{
    // 1) List your tracks here (must be WAV).
    m_urls << QUrl(QStringLiteral("qrc:/ui/assets/song1.wav")).toString()
           << QUrl(QStringLiteral("qrc:/ui/assets/song2.wav")).toString()
           << QUrl(QStringLiteral("qrc:/ui/assets/song3.wav")).toString();

    // 2) Friendly titles
    m_titles << "Song A" << "Song B" << "Song C";

    // Connect to update QML when playing/stopped
    connect(m_sound, &QSoundEffect::playingChanged, this, [this](){
        emit playbackStateChanged();
    });
}

QString MusicController::currentTitle() const {
    return (m_currentIndex >= 0 && m_currentIndex < m_titles.size())
    ? m_titles[m_currentIndex]
    : QString();
}

void MusicController::play() {
    if (m_currentIndex < 0 && !m_urls.isEmpty()) {
        m_currentIndex = 0;
        m_sound->setSource(QUrl(m_urls.at(m_currentIndex)));
        emit currentTrackChanged();
    }
    m_sound->play();
}

void MusicController::pause() {
    m_sound->stop();
}

void MusicController::stop() {
    m_sound->stop();
}

void MusicController::togglePlay() {
    if (m_sound->isPlaying()) pause();
    else play();
}

void MusicController::next() {
    if (m_urls.isEmpty()) return;
    m_currentIndex = (m_currentIndex + 1) % m_urls.size();
    m_sound->setSource(QUrl(m_urls.at(m_currentIndex)));
    emit currentTrackChanged();
    m_sound->play();
}

void MusicController::prev() {
    if (m_urls.isEmpty()) return;
    m_currentIndex = (m_currentIndex - 1 + m_urls.size()) % m_urls.size();
    m_sound->setSource(QUrl(m_urls.at(m_currentIndex)));
    emit currentTrackChanged();
    m_sound->play();
}

void MusicController::playTrack(int index) {
    if (index < 0 || index >= m_urls.size()) return;
    m_currentIndex = index;
    m_sound->setSource(QUrl(m_urls.at(m_currentIndex)));
    emit currentTrackChanged();
    m_sound->play();
}



