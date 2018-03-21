#include "classifier.h"

Classifier::Classifier(int subdivisions,float totalLength){
    this->subdivisions = subdivisions;
    this->totalLength = totalLength * 1000;
    this->buffer = new bool[subdivisions];
    this->CalculateTimeStamps();
}

///Delete allocated memory
Classifier::~Classifier(){
    delete[] this->buffer;
    delete[] this->timeStamps;
}

///Linear interpolation
float Classifier::Lerp(float x, float y, float t) {
    return x + t * (y - x);
}

///Calculate subbeats in ms
void Classifier::CalculateTimeStamps(){
    this->timeStamps = new float [subdivisions + 1];
    for(int i = 0; i < subdivisions + 1; i++){
        float t = (float)i / (float)subdivisions;
        this->timeStamps[i] = this->Lerp(0,totalLength,t);
    }
}

///All the impulses are classified, just searching over the subdivisions
/// who has the min distance
bool Classifier::ClassifyImpulse(float ms){
    float minDistance = totalLength;
    int index = 0;
    for(int i = 0; i < this->subdivisions + 1; i++){
        float distance = abs(ms - timeStamps[i]);
        if(distance < minDistance){
            minDistance = distance;
            index = i;
        }
    }
    if(index < this->subdivisions){
        this->buffer[index] = true;
        return false;
    }else{
        return true;
    }
}

///Classify the beat buffer, remove the impulses of the current beat and
/// let live the impulses of the next beat
QString Classifier::Classify(QVector<Impulse>* beatBuffer){
    QString toRet = "";
    QVector<Impulse> nextPulses;
    //reset buffer
    for(int i = 0; i < subdivisions ; i++){
        buffer[i] = false;
    }
    //iterate over impulses
    for(int j = 0; j < beatBuffer->count(); j++){
        Impulse& impulse = (*beatBuffer)[j];
        if(this->ClassifyImpulse(impulse.Mseconds())){
            impulse.SetMseconds(impulse.Mseconds() - totalLength);
            nextPulses.append(impulse);
        }
    }
    //clear impulses buffer
    beatBuffer->clear();
    //save the next beat impulses
    beatBuffer->append(nextPulses);
    //calculate return buffer
    for(int i = 0; i < this->subdivisions; i++){
        QString toAdd = this->buffer[i] ? "1" : "0" ;
        toRet.append(toAdd);
    }
    return toRet;
}
