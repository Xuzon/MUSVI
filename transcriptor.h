#ifndef TRANSCRIPTOR_H
#define TRANSCRIPTOR_H

#include <QObject>
#include <QFile>
#include <memory>
#include "metronomethread.h"
#include <QtMultimedia/QAudioInput>
#include <QtMultimedia/QAudioOutput>
#include <QDebug>
#include "bufferprocessor.h"
#include <QDir>
#include <QStandardPaths>
#include "scoresaver.h"
#include "calibrator.h"

class Musvi_Logic;

class Transcriptor : public QObject{
    Q_OBJECT
    bool recording;
    bool calibrating;
    float fs;
    int subdivisions;
    int bpm;
    float window;

    QString beatFileName;
    QFile beatFile;

    std::unique_ptr<MetronomeThread> metronomeThread;
    std::shared_ptr<Musvi_Logic> logic;
    BufferProcessor *processor;
    std::unique_ptr<Calibrator> calibrator;
    std::shared_ptr<QAudioInput> input;
    std::shared_ptr<QAudioOutput> speakers;


    void startRecording();
    void stopRecording();

public:
    Q_INVOKABLE void record();
    Q_INVOKABLE const QStringList comboList();
    void ChangeTempoCompas(int bpm, int subdivisions);
    void Calibrate(int time);
    void SaveScore(QString fileName,int errors,QString folder,QString comments, QString compas);
    void StartMetronome();

    explicit Transcriptor(std::shared_ptr<Musvi_Logic> logic);
    explicit Transcriptor();
    ~Transcriptor();
    bool IsRecording();


signals:

public slots:
    void StopCalibration();

};

#endif // TRANSCRIPTOR_H
