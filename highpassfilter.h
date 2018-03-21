#ifndef HIGHPASSFILTER_H
#define HIGHPASSFILTER_H

#include <QDebug>
#include "filter.h"

class HighPassFilter : public Filter{

protected:
    void CalculateCoeffs();
    double normalizedFreq;

public:
    HighPassFilter(int numCoeffs,double freq,double sampleFreq);
    ~HighPassFilter();
};

#endif // HIGHPASSFILTER_H
