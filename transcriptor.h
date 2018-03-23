#ifndef TRANSCRIPTOR_H
#define TRANSCRIPTOR_H

#include <QObject>
#include <QFile>
#include "metronomethread.h"
#include <QtMultimedia/QAudioInput>
#include <QtMultimedia/QAudioOutput>
#include <QDebug>
#include "bufferprocessor.h"
#include <QDir>
#include <QStandardPaths>
#include "scoresaver.h"

class Musvi_Logic;

class Transcriptor : public QObject{
    Q_OBJECT
    bool recording;
    float fs;
    int subdivisions;
    int bpm;
    float window;
    QString beatFileName;
    MetronomeThread* metronomeThread;

    void startRecording();
    void stopRecording();

    Musvi_Logic* logic;
    BufferProcessor* processor;
    QAudioInput* input;
    QAudioOutput* speakers;
    QFile beatFile;

public:
    Q_INVOKABLE void record();
    Q_INVOKABLE const QStringList comboList();
    void ChangeTempoCompas(int bpm, int subdivisions);

    explicit Transcriptor(Musvi_Logic* logic);
    explicit Transcriptor();
    ~Transcriptor();
    bool IsRecording();
signals:

public slots:
};

#endif // TRANSCRIPTOR_H
