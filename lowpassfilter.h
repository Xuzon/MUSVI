#ifndef LOWPASSFILTER_H
#define LOWPASSFILTER_H

#include "filter.h"
#include <QDebug>

class LowPassFilter : public Filter{

protected:
    void CalculateCoeffs();
    double normalizedFreq;

public:
    LowPassFilter(int numCoeffs,double freq,double sampleFreq);
    ~LowPassFilter();
};

#endif // LOWPASSFILTER_H
