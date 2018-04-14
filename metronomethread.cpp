#include "metronomethread.h"

MetronomeThread::MetronomeThread(float bpm, bool* recording, QFile* beat, QAudioOutput *speakers){
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
        //emit launchBeep();
        //this->beat->close();
        //this->beat->open(QIODevice::ReadOnly);
        //this->speakers->stop();
        //this->speakers->start(this->beat);
        qDebug() << "AUDIO!";
        this->msleep((int)timeBetweenBeats);
        if(processBeat){
            this->beatFlag = true;
        }
    }
}

void MetronomeThread::run(){
    qDebug() << "RUN";
    this->Loop();
}

void MetronomeThread::update(){
    qDebug() << "update";
    if(*(this->recording) || !processBeat){
        float timeBetweenBeats = 60.0f / this->bpm;
        timeBetweenBeats *= 1000;
        this->beat->close();
        this->beat->open(QIODevice::ReadOnly);
        this->speakers->stop();
        qDebug() << "paso de readwrite";
        this->speakers->start(this->beat);
        timer->start((int)timeBetweenBeats);
        if(processBeat){
            this->beatFlag = true;
        }
    }

}

bool *MetronomeThread::BeatAddress(){
    return &(this->beatFlag);
}

