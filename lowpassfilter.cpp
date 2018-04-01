#include "lowpassfilter.h"

void LowPassFilter::CalculateCoeffs(){
    for(int i = 0; i < numCoeffs; i++){
        double temp = (double) i - (double)(numCoeffs - 1) / 2.0f;
        this->coeff[i] = normalizedFreq * this->Sinc(normalizedFreq * temp * M_PI);
    }
}

LowPassFilter::LowPassFilter(int numCoeffs,double freq, double sampleFreq) : Filter(numCoeffs){
    //qDebug() << "Creating low pass filter" << numCoeffs;
    this->normalizedFreq = freq * 2 / sampleFreq;
    this->CalculateCoeffs();
}

LowPassFilter::~LowPassFilter(){
    //qDebug() << "Deleting low pass filter";
}
