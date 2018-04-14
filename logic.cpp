#include "logic.h"

//##########################################################################################
//################################### CONSTRUCTOR ##########################################
//##########################################################################################
Musvi_Logic::Musvi_Logic(QObject *parent) : QObject(parent)
{
    timer = new QTimer(this);
    this->transcriptor = std::unique_ptr<Transcriptor>(new Transcriptor(std::shared_ptr<Musvi_Logic>(this)));
    //this->checker.LoadPractice(1);
}

Musvi_Logic::~Musvi_Logic(){
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
    }
}

///Change the tempo and compas
void Musvi_Logic::config(int speed, QString compas){
    qDebug() << "QML->LOGIC :: CHANGE CONFIG:: " << speed << " " << compas;
    this->sCurrentCompas = compas;
    if(this->transcriptor == nullptr){
        return;
    }
    //if subdivided by 4 is binary, if by 8 is ternary
    int subdivisions = compas.at(2) == "8" ? 6 : 4;
    this->transcriptor->ChangeTempoCompas(speed,subdivisions);
}

void Musvi_Logic::mode(QString type){
    //qDebug() << "QML->LOGIC :: MODE TYPE:: " << type;
    //SI ES PRACTICE HAY QUE ENVIAR LA SEÑAL CON LA LISTA DE PARTITURAS
    if(type == "practice"){
        emit getScoreList(ScoreSaver::GetScores());
    }
    if(type == "artist"){
        this->setPractice(-1);
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
    this->transcriptor->StartMetronome();
}

///Load the practice into the checker
///
void Musvi_Logic::setPractice(int id){
    qDebug() << "setting practice::" << id;
    int sub;
    int speed = this->checker.LoadPractice(id,&sub);
    qDebug() << "speed " << speed;
    this->config(speed,sub == 4 ? "2/4" : "3/6");
}

/* SEÑALES PARA EL QML */

/*
 * Cada vez que se recibe un pulso, se envía la señal al QML
 */
void Musvi_Logic::detectPulse(QString pulse){
    qDebug() << "LOGIC->QML :: SEND PULSE:: " << pulse;
    int hasError = this->checker.HasError(pulse,currentCompas) ? 1 : 0;
    this->errors += hasError;
    currentCompas++;
    if(this->checker.IsArtist()){
        emit sendPulseArtist(pulse);
    }else{
        emit sendPulsePractice(pulse,hasError);
    }
}

void Musvi_Logic::savePDF(QString name){
    qDebug() << "LOGIC->QML :: SAVE PDF:: " << name;

}

void Musvi_Logic::saveExample(QString name, QString comments, QString folder){
    qDebug() << "LOGIC->QML :: SAVE EXAMPLE:: " << name << "\n " << comments << "\n " << folder;
    this->transcriptor->SaveScore(name,errors,folder,comments,sCurrentCompas);

}
void Musvi_Logic::deleteScore(int id){
    qDebug() << "LOGIC->QML :: DELETE SCORE:: " << id;
}
