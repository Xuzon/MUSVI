#ifndef FILTER_H
#define FILTER_H

#include <math.h>
#include <QDebug>

class Filter{
protected:
    double* coeff;
    int numCoeffs;
    double* history;
    double* startHistory;
    double* endHistory;

    virtual void CalculateCoeffs() = 0;
    double Sinc(double input);

public:
    virtual double filter(double input);
    Filter(int numCoeffs);
    ~Filter();
};

#endif // FILTER_H
