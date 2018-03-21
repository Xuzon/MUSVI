#ifndef METRONOMETHREAD_H
#define METRONOMETHREAD_H

#include <QObject>
#include <QDebug>
#include <QThread>
#include <QFile>
#include <QtMultimedia/QAudioOutput>


class MetronomeThread : public QThread{

protected:
    QFile* beat;
    QAudioOutput* speakers;
    bool* recording;
    float bpm;
    bool beatFlag;

    void Loop();
    void run();

public slots:
    void process();

public:
    MetronomeThread(float bpm, bool* recording, QFile* beat, QAudioOutput* speakers);

    bool* BeatAddress();
};

#endif // METRONOMETHREAD_H
