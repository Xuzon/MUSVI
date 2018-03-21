#include "highpassfilter.h"



void HighPassFilter::CalculateCoeffs(){
    //if samples are even
    if(numCoeffs % 2 == 1){
        for(int i = 0; i < numCoeffs; i++){
            double temp = (double) i - (double)(numCoeffs - 1) / 2.0f;
            this->coeff[i] = this->Sinc(temp * M_PI) - normalizedFreq * this->Sinc(normalizedFreq * temp * M_PI);
        }
    }else{
        for(int i = 0; i < numCoeffs; i++){
            double temp = (double) i - (double)(numCoeffs - 1) / 2.0f;
            if(temp == 0.0){
                this->coeff[i] = 0.0;
            }else{
                this->coeff[i] = cos(normalizedFreq * temp * M_PI) / M_PI / temp + cos(temp * M_PI);
            }
        }
    }
}


HighPassFilter::HighPassFilter(int numCoeffs, double freq, double sampleFreq) : Filter(numCoeffs){
    qDebug() << "Creating high pass filter" << numCoeffs;
    this->normalizedFreq = freq * 2 / sampleFreq;
    this->CalculateCoeffs();
}

HighPassFilter::~HighPassFilter(){
    qDebug() << "Deleting high pass filter";
}
