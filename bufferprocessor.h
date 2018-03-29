#ifndef PROCESSINGBUFFER_H
#define PROCESSINGBUFFER_H

#include <QObject>
#include <QTimer>
#include <QDebug>
#include <QtMultimedia/QAudioFormat>
#include <QtMultimedia/QAudioInput>
#include <QVector>
#include "impulse.h"
#include "classifier.h"
#include "lowpassfilter.h"
#include "highpassfilter.h"

//forward declaration because only need one pointer, include the .h in the cpp to
//use a method of musvilogic
class Musvi_Logic;

class BufferProcessor : public QIODevice{

public:
    BufferProcessor(Musvi_Logic* logic,int bytesPerFrame,float fs,float window,int subdivisions,float length,int threshold);
    ~BufferProcessor();

    QVector<QString> currentScore;

    bool open(OpenMode mode);
    void SetInput(QAudioInput* input,bool* beatFlag);
    qint64 writeData(const char *data, qint64 maxSize);
    qint64 readData ( char * data, qint64 maxSize );

protected:
    QVector<Impulse> impulses;
    QVector<Impulse> lowFreqImpulses;
    QVector<Impulse> highFreqImpulses;

    QAudioInput* input;
    Classifier* classifier;
    Musvi_Logic* logic;
    LowPassFilter* lowPassFilter;
    HighPassFilter* highPassFilter;

    int bytesPerFrame;
    int counter;
    float fs;
    float window;
    int waveThreshold;
    int filterOrder;
    double lowFreq;
    double highFreq;
    bool* beatFlag;

    void processBuffer8(const char* data, qint64 size);
    void processBuffer16(const char* data, qint64 size);
    void processBeat();

public slots:
    void sendBuffer();
};

#endif // PROCESSINGBUFFER_H
