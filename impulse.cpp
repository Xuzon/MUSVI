#include "impulse.h"

Impulse::Impulse(){}

Impulse::Impulse(float seconds, qint16 amplitude){
    this->seconds = seconds;
    this->amplitude = amplitude;
}

float Impulse::Mseconds(){
    return this->seconds;
}

qint16 Impulse::Amp(){
    return this->amplitude;
}

void Impulse::SetMseconds(float seconds){
    this->seconds = seconds;
}

void Impulse::SetAmp(qint16 amp){
    this->amplitude = amp;
}
