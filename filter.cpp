#include "filter.h"


double Filter::Sinc(double input){
    return input > -1.0E-5 && input < 1.0E-5 ? 1 : sin(input) / input;
}

double Filter::filter(double input){
    double toRet = 0;
    *(this->history) = input;
    history++;
    //check bounds
    if(history == endHistory){
        history = startHistory;
    }

    double* history = this->history;
    for(int i = 0; i < numCoeffs ;i++){
        history--;
        if(history < startHistory){
            history = endHistory - 1;
        }
        toRet += *history * this->coeff[i];
    }
    return toRet;
}

Filter::Filter(int numCoeffs) : numCoeffs(numCoeffs){
    this->coeff = new double[numCoeffs];
    this->history = new double[numCoeffs];
    for(int i = 0; i < numCoeffs; i++){
        this->history[i] = 0;
    }
    this->startHistory = this->history;
    this->endHistory = (this->history + numCoeffs);
}
Filter::~Filter(){
    delete[] this->coeff;
    delete[] this->history;
}

