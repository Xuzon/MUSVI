#include "logic.h"

//##########################################################################################
//################################### CONSTRUCTOR ##########################################
//##########################################################################################
Musvi_Logic::Musvi_Logic(QObject *parent) : QObject(parent)
{
    timer = new QTimer(this);
    this->transcriptor = new Transcriptor(this);
}

Musvi_Logic::~Musvi_Logic(){
    delete this->transcriptor;
}

//#############################################################
//########################## OTRAS ############################
//#############################################################
/* SEÑALES RECIBIDAS DESDE EL QML */

/*
 * Cuando desde la interfaz el usuario decide empezar a detectar pulsos, se recibe esta señal de comienzo
 */
void Musvi_Logic::startRecording(){
    qDebug() << "QML->LOGIC :: START RECORDING";
    if(!this->transcriptor->IsRecording()){
        this->transcriptor->record();
    }
}

void Musvi_Logic::stopRecording(){
    qDebug() << "QML->LOGIC :: STOP RECORDING";
    if(this->transcriptor->IsRecording()){
        this->transcriptor->record();
    }
}

void Musvi_Logic::mode(QString type){
    qDebug() << "QML->LOGIC :: MODE TYPE:: " << type;

}

void Musvi_Logic::calibrate(int time){
    qDebug() << "QML->LOGIC :: CALIBRATE:: " << time;

}

void Musvi_Logic::metronome(){
    qDebug() << "QML->LOGIC :: METRONOME";

}

void Musvi_Logic::config(int speed, QString compas){
    qDebug() << "QML->LOGIC :: CHANGE CONFIG:: " << speed << " " << compas;

}

void Musvi_Logic::ChangeTempoCompas(int bpm, int subdivisions){
    if(this->transcriptor == nullptr){
        return;
    }
    this->transcriptor->ChangeTempoCompas(bpm,subdivisions);
}

/* SEÑALES PARA EL QML */

/*
 * Cada vez que se recibe un pulso, se envía la señal al QML
 */
void Musvi_Logic::detectPulse(QString pulse){
    qDebug() << "LOGIC->QML :: SEND PULSE:: " << pulse;
    emit sendPulse(pulse);
}


