#include "calibrator.h"

Calibrator::Calibrator(QAudioInput *input){
    this->input = input;
    this->threshold = 0;
}

Calibrator::~Calibrator(){

}

///Useless but needed
qint64 Calibrator::readData(char *data, qint64 maxSize){
    return 0;
}

///Open the QIODevice
bool Calibrator::open(QIODevice::OpenMode mode){
    this->setOpenMode(mode);
    return true;
}

qint64 Calibrator::writeData(const char *data, qint64 maxSize){
    qint16* iData = (qint16*)(data);
    int iSize = maxSize / 2;
    for(int i = 0; i < iSize; i++){
        if(iData[i] > threshold){
            if(abs(iData[i]) > threshold){
                threshold = iData[i];
            }
        }
    }
    return maxSize;
}
