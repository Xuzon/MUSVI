#ifndef MUSVI_LOGIC_H
#define MUSVI_LOGIC_H

#include <cstdlib>
#include <string>
#include <QObject>
#include <QDebug>
#include <QVariantMap>
#include <QMetaEnum>
#include <QMetaObject>
#include <QThread>
#include <QTimer>
#include <QList>


/* sin usar */
//#include "jsonutils.h"


using namespace std;

class Musvi_Logic : public QObject{

    Q_OBJECT
    //    Q_ENUMS(enums_types)

public:

    /* Constructor */
    explicit Musvi_Logic(QObject *parent = 0);

    /* Objects */
    //    QTimer *timer;
    //    JsonUtil *jsonParser;

    //ProcessingBuffer *buffer;

    /* Variables */
    //    int time1;
    //    int time2;

    //    QJsonObject json;
    //QString value;

    //    enum enums_types
    //    {
    //        ENUM1,
    //        ENUM2,
    //        DEFAULT
    //    };


    //    void processEnum1(QVariantMap Qvar_json);
    //    void processEnum2(QVariantMap Qvar_json);
    //    void stopTimers();
    //    Musvi_Logic::enums_types  switchString(QString category);

    /* Auxiliary functions */
//    void messageToProcessSound(QString topic,QJsonObject jsonData);
//    void messageFromProcessSound(QString infojson);




signals:
    //    void sendToQml(QString enums, QJsonObject Qvar_json);


    /* Signal a QML del buffer */
//    void detectPulse(bool pulse);

//    /* Signal a QML del transcriptor */
//    void signalSendInputDevices(QList<QString> list);
//    void signalSendOutputDevices(QList<QString> list);

public slots:

    //    void receiveFromQml(QString place, QString selection);
    //    void receiveFromBridge(QString infoJson);
    //    void timeOut();

    /* Slot para recoger datos del QML */
    void startRecording();

    /* Slots para recoger señales de transcriptor */
//    void sendInputDevices(QList<QString> list);
//    void sendOutputDevices(QList<QString> list);

//    /* Slots para recoger señales del buffer */
//    void audioDetected(bool pulseDetected);
//    void pulse(bool pulseDetected);
};

#endif // SMC_LOGIC_H
