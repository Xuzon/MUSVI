#ifndef METRONOMETHREAD_H
#define METRONOMETHREAD_H

#include <QObject>
#include <QDebug>
#include <QThread>
#include <QFile>
#include <QTimer>
#include <QtMultimedia/QAudioOutput>
#include <memory>

class MetronomeThread : public QThread{


protected:
    QFile* beat;
    QAudioOutput *speakers;
    bool* recording;
    float bpm;
    bool beatFlag;
    QTimer *timer;

    void Loop();
    void run();

public slots:
    void process();
    void update();

public:
    MetronomeThread(float bpm, bool* recording, QFile* beat, QAudioOutput *speakers);

    bool* BeatAddress();
    bool processBeat;
};

#endif // METRONOMETHREAD_H
