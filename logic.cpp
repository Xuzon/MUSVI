#include "logic.h"

//##########################################################################################
//################################### CONSTRUCTOR ##########################################
//##########################################################################################
Musvi_Logic::Musvi_Logic(QObject *parent) : QObject(parent)
{

}

void Musvi_Logic::startRecording(){
    qDebug() << "LOGIC:: startRecording";
}

//void Musvi_Logic::pulse(bool pulseDetected){
//    emit detectPulse(pulseDetected);
//}

//void Musvi_Logic::audioDetected(bool pulseDetected){
//    emit this->detectPulse(pulseDetected);
//    //Y otros timers
//}

//void Musvi_Logic::sendInputDevices(QList<QString> list){
//    emit signalSendInputDevices(list);
//}

//void Musvi_Logic::sendOutputDevices(QList<QString> list){
//    emit signalSendOutputDevices(list);
//}


//##########################################################################################
//################################ RECEIVE FROM BRIDGE #####################################
//##########################################################################################
//void Musvi_Logic::receiveFromBridge(QString infoJson){
//    this->messageFromProcessSound(infoJson);
//}

//##########################################################################################
//################################# SWITCHING STRING #######################################
//##########################################################################################
//Musvi_Logic::enums_types Musvi_Logic::switchString(QString category){

//    QMetaObject MetaObject = this->staticMetaObject;
//    QMetaEnum MetaEnum = MetaObject.enumerator(MetaObject.indexOfEnumerator("enums_types"));

//    switch (MetaEnum.keysToValue(category.toUpper().toUtf8())){

//        case ENUM1:
//            return enums_types::ENUM1;
//            break;

//        case ENUM2:
//            return enums_types::ENUM2;
//            break;

//        default:
//            return enums_types::DEFAULT;
//            break;
//    }

//}


//##########################################################################################
//################################# MESSAGE RECEIVED #######################################
//##########################################################################################
//void Musvi_Logic::messageFromProcessSound(QString infoJson){
//    switch (this->switchString(infoJson)) {

//        case ENUM1:
//            this->processEnum1(infoJson);
//            break;

//        case ENUM2:
//            this->processEnum2(infoJson);
//            break;

//        default:
//            break;
//    }

//}




//##########################################################################################
//################################  PROCESS MESSAGE ########################################
//##########################################################################################
//void Musvi_Logic::processEnum1(QVariantMap Qvar_json){
//    qDebug() << "--- PROCESS - ENUM1";
//    QVariantMap values_map = Qvar_json["values"].toMap();
//    this->value = values_map["value"].toString();
//    emit sendToQml("enum1", QJsonObject::fromVariantMap(Qvar_json));
//}

//void Musvi_Logic::processEnum2(QVariantMap Qvar_json){
//    qDebug() << "--- PROCESS - ENUM2";
//    this->timer->start(5000);
//}

//##########################################################################################
//########################### RECEIVE INSTRUCTION FROM QML #################################
//##########################################################################################
//void Musvi_Logic::receiveFromQml(QString area, QString selection){
//    switch (this->switchString(area)) {

//        case ENUM1:
//            this->messageToProcessSound("enum1", this->json);
//            break;

//        case ENUM2:
//            this->messageToProcessSound("enum2", this->json);
//            QThread::sleep(0.1);
//            break;

//        default:
//            break;
//    }
//}


//##########################################################################################
//#################################### MESSAGE TO MQTT #####################################
//##########################################################################################
//void Musvi_Logic::messageToProcessSound(QString topic, QJsonObject jsonData){
//    Bridge::getInstance().toProcessSound(topic, jsonData);
//}


//##########################################################################################
//#################################### OTHER FUNCTIONS #####################################
//##########################################################################################

//########################### TIME OUT ##########################
//void Musvi_Logic::timeOut(){
//    this->stopTimers();
//    QVariantList values;
//    emit sendToQml("cualquier_cosa", this->jsonParser->createJson("cualquier_cosa"));
//}

//######################### STOP TIMERS #########################
//void Musvi_Logic::stopTimers(){
//    this->timer->stop();
//    //Y otros timers
//}


