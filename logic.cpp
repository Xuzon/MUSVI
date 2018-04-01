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

///Change the tempo and compas
void Musvi_Logic::config(int speed, QString compas){
    qDebug() << "QML->LOGIC :: CHANGE CONFIG:: " << speed << " " << compas;
    if(this->transcriptor == nullptr){
        return;
    }
    //todo
    // 2/4 3/4 6/8 12/8
    // 4/4 3/8 9/8
    int subdivisions = 4;
    this->transcriptor->ChangeTempoCompas(speed,subdivisions);
}

void Musvi_Logic::mode(QString type){
    qDebug() << "QML->LOGIC :: MODE TYPE:: " << type;
    if(type.compare("artist")){
        this->SetPractice(-1);
    }
}

void Musvi_Logic::calibrate(int time){
    qDebug() << "QML->LOGIC :: CALIBRATE:: " << time;
    if(this->transcriptor == nullptr){
        return;
    }
    this->transcriptor->Calibrate(time);
}

void Musvi_Logic::metronome(){
    qDebug() << "QML->LOGIC :: METRONOME";

}

///Load the practice into the checker
///
void Musvi_Logic::SetPractice(int id){
    this->checker.LoadPractice(id);
}

/* SEÑALES PARA EL QML */

/*
 * Cada vez que se recibe un pulso, se envía la señal al QML
 */
void Musvi_Logic::detectPulse(QString pulse){
    qDebug() << "LOGIC->QML :: SEND PULSE:: " << pulse;
    emit sendPulse(pulse);
}




