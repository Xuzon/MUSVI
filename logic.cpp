#include "logic.h"

//##########################################################################################
//################################### CONSTRUCTOR ##########################################
//##########################################################################################
Musvi_Logic::Musvi_Logic(QObject *parent) : QObject(parent)
{
    timer = new QTimer(this);
    this->transcriptor = new Transcriptor(this);
    //this->checker.LoadPractice(1);
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
    errors = 0;
    currentCompas = 0;
    if(!this->transcriptor->IsRecording()){
        this->transcriptor->record();
    }
}

void Musvi_Logic::stopRecording(){
    qDebug() << "QML->LOGIC :: STOP RECORDING";
    if(this->transcriptor->IsRecording()){
        this->transcriptor->record();
        this->transcriptor->SaveScore("test.json",this->errors,"This is a folder","This is a comment");
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
    //dont know why but there was an invisible character
    type.chop(1);
    if(QString::compare(type,"artist")){
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
    if(this->checker.HasError(pulse,currentCompas)){
        this->errors++;
    }
    currentCompas++;
    emit sendPulse(pulse);
}

void Musvi_Logic::savePDF(QString name){
    qDebug() << "LOGIC->QML :: SAVE PDF:: " << name;

}



