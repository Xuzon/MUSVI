#ifndef METRONOMETHREAD_H
#define METRONOMETHREAD_H

#include <QObject>
#include <QDebug>
#include <QThread>
#include <QFile>
#include <QtMultimedia/QAudioOutput>
#include <memory>

class MetronomeThread : public QThread{

protected:
    QFile* beat;
    std::shared_ptr<QAudioOutput> speakers;
    bool* recording;
    float bpm;
    bool beatFlag;

    void Loop();
    void run();

public slots:
    void process();

public:
    MetronomeThread(float bpm, bool* recording, QFile* beat, std::shared_ptr<QAudioOutput> speakers);

    bool* BeatAddress();
    bool processBeat;
};

#endif // METRONOMETHREAD_H
