#ifndef PROCESSINGBUFFER_H
#define PROCESSINGBUFFER_H

#include <QObject>
#include <QTimer>
#include <QDebug>
#include <QtMultimedia/QAudioFormat>
#include <QtMultimedia/QAudioInput>
#include <QVector>
#include <memory>
#include "impulse.h"
#include "classifier.h"
#include "lowpassfilter.h"
#include "highpassfilter.h"

//forward declaration because only need one pointer, include the .h in the cpp to
//use a method of musvilogic
class Musvi_Logic;

class BufferProcessor : public QIODevice{

public:
    BufferProcessor(std::shared_ptr<Musvi_Logic> logic,int bytesPerFrame,float fs,float window,int subdivisions,float length,int threshold);
    ~BufferProcessor();

    QVector<QString> currentScore;

    bool open(OpenMode mode);
    void SetInput(std::shared_ptr<QAudioInput> input,bool* beatFlag);
    qint64 writeData(const char *data, qint64 maxSize);
    qint64 readData ( char * data, qint64 maxSize );

protected:
    QVector<Impulse> impulses;
    QVector<Impulse> lowFreqImpulses;
    QVector<Impulse> highFreqImpulses;

    std::shared_ptr<QAudioInput> input;
    std::unique_ptr<Classifier> classifier;
    std::shared_ptr<Musvi_Logic> logic;
    std::unique_ptr<LowPassFilter> lowPassFilter;
    std::unique_ptr<HighPassFilter> highPassFilter;

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
