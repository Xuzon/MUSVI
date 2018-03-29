#include "bufferprocessor.h"
#include "logic.h"

BufferProcessor::BufferProcessor(Musvi_Logic* logic, int bytesPerFrame,float fs,float window,int subdivisions,float length, int threshold){
    this->logic = logic;
    this->bytesPerFrame = bytesPerFrame;
    this->fs = fs;
    this->window = window;
    this->filterOrder = 100;
    //set the threshold 10% more than the received
    this->waveThreshold = threshold + threshold * 10 / 100;
    this->lowFreq = 1000;
    this->highFreq = 5000;
    this->classifier = new Classifier(subdivisions,length);
    this->lowPassFilter = new LowPassFilter(filterOrder,lowFreq,fs);
    this->highPassFilter = new HighPassFilter(filterOrder,highFreq,fs);
}

BufferProcessor::~BufferProcessor(){
    delete this->classifier;
    delete this->lowPassFilter;
    delete this->highPassFilter;
}

///Get the data from the microphpne
qint64 BufferProcessor::writeData(const char *data, qint64 maxSize){
    switch(this->bytesPerFrame){
        case 1:
            processBuffer8(data,maxSize);
            break;
        case 2:
            processBuffer16(data,maxSize);
            break;
        default:
            qDebug() << "buffer size not supported";
            break;
    }
    return maxSize;
}

///Useless but needed
qint64 BufferProcessor::readData(char *data, qint64 maxSize){
    return 0;
}

///Set the input and the beatflag
void BufferProcessor::SetInput(QAudioInput *input, bool *beatFlag){
    this->input = input;
    this->beatFlag = beatFlag;
    this->counter = 0;
}

///Open the QIODevice
bool BufferProcessor::open(QIODevice::OpenMode mode){
    this->setOpenMode(mode);
    this->currentScore.clear();
    return true;
}

///Detect the impulses on the 8 bits buffer
/// and store them into a buffer
void BufferProcessor::processBuffer8(const char *data, qint64 size){
    qint8* iData = (qint8*)(data);
    for(int i = 0; i < size; i++){
        if(iData[i] > 100 || iData[i] < -100){
            float ms = (float)(this->counter + i) * 1000;
            ms /= fs;
            Impulse imp (ms,iData[i]);
            impulses.append(imp);
            break;
        }
    }
    this->counter += size;
    this->processBeat();
}

///Detect the impulses on the 16 bits buffer
/// and store them into a buffer
void BufferProcessor::processBuffer16(const char *data, qint64 size){
    qint16* iData = (qint16*)(data);
    int iSize = size / 2;
    for(int i = 0; i < iSize; i++){
        //apply filters
        double lowFilteredData = fabs(this->lowPassFilter->filter((double)iData[i]));
        double highFilteredData = fabs(this->highPassFilter->filter((double)iData[i]));
        if(abs(iData[i]) > waveThreshold){
            float ms = (float)(this->counter + i) * 1000;
            ms /= fs;
            Impulse imp (ms,iData[i]);
            impulses.append(imp);
            //classify by frequencies
            //qDebug() << "LOW FILTERED: " << lowFilteredData << "HIGH FILTERED: " << highFilteredData;
            if(highFilteredData > lowFilteredData){
                highFreqImpulses.append(imp);
            }else{
                lowFreqImpulses.append(imp);
            }
            //bool highCandidate = abs(highFilteredData) > 900;
            //bool lowCandidate = abs(lowFilteredData) > 150;
            break;
        }
    }
    this->counter += iSize;
    this->processBeat();
}

///Start a timer if a beat has passed to process the buffer
void BufferProcessor::processBeat(){
    if(!(*beatFlag)){
        return;
    }
    *beatFlag = false;
    QTimer::singleShot(this->window / 2.0f,this,&BufferProcessor::sendBuffer);
}

///Classify the buffer and emit signal to qml
void BufferProcessor::sendBuffer(){
    this->counter = 0;
    QString compas = this->classifier->Classify(&this->impulses);
    this->currentScore.append(compas);
    //qDebug() << "LowFreqs: " << this->classifier->Classify(&this->lowFreqImpulses);
    //qDebug() << "HighFreqs: " << this->classifier->Classify(&this->highFreqImpulses);
    this->logic->detectPulse(compas);
}
