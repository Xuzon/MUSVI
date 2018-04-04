#ifndef CLASSIFIER_H
#define CLASSIFIER_H

#include <QDebug>
#include <QVector>
#include <stdlib.h>
#include <cmath>
#include "impulse.h"

class Classifier{

protected:
    QVector<QString> ternaryLUT;
    int subdivisions;
    float totalLength;
    bool* buffer;
    float* timeStamps;

    void FillLUT();
    QString ClassifyTernary(QString compas);
    void CalculateTimeStamps();
    float Lerp(float x, float y, float t);
    bool ClassifyImpulse(float ms);
public:
    Classifier(int subdivisions,float totalLength);
    ~Classifier();

    QString Classify(QVector<Impulse>* beatBuffer);
    static int StringToByte(QString compas);
    static QString ByteToString(int input);
    static int HammingWeight(int vector);
};

#endif // CLASSIFIER_H
