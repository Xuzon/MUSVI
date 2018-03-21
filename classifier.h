#ifndef CLASSIFIER_H
#define CLASSIFIER_H

#include <QDebug>
#include <QVector>
#include <stdlib.h>
#include "impulse.h"

class Classifier{

protected:
    int subdivisions;
    float totalLength;
    bool* buffer;
    float* timeStamps;

    void CalculateTimeStamps();
    float Lerp(float x, float y, float t);
    bool ClassifyImpulse(float ms);
public:
    Classifier(int subdivisions,float totalLength);
    ~Classifier();

    QString Classify(QVector<Impulse>* beatBuffer);
};

#endif // CLASSIFIER_H
