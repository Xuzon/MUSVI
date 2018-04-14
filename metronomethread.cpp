#include "metronomethread.h"

MetronomeThread::MetronomeThread(float bpm, bool* recording, QFile* beat, std::shared_ptr<QAudioOutput> speakers){
    this->bpm = bpm;
    this->recording = recording;
    this->beat = beat;
    this->speakers = speakers;
    this->processBeat = false;
}

void MetronomeThread::Loop(){
    float timeBetweenBeats = 60.0f / this->bpm;
    timeBetweenBeats *= 1000;
    while(*(this->recording) || !processBeat){
        this->beat->close();
        this->beat->open(QIODevice::ReadOnly);
        this->speakers->stop();
        this->speakers->start(this->beat);
        this->msleep((int)timeBetweenBeats);
        if(processBeat){
            this->beatFlag = true;
        }
    }
}

void MetronomeThread::run(){
    this->Loop();
}

bool *MetronomeThread::BeatAddress(){
    return &(this->beatFlag);
}

