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
#include <cstdlib>
#include "transcriptor.h"
#include "scorechecker.h"

using namespace std;

class Musvi_Logic : public QObject{

    Q_OBJECT

protected:

    int errors;
    int currentCompas;

public:

    /* Constructor */
    explicit Musvi_Logic(QObject *parent = 0);
    ~Musvi_Logic();

    /* Objects */
    QTimer *timer;
    Transcriptor* transcriptor;
    ScoreChecker checker;

signals:

    /* Signal a QML del buffer */
    void sendPulse(QString pulse);

public slots:
    /* Slot para recoger datos del QML */
    void startRecording();
    void stopRecording();
    //artist or practice
    void mode(QString type);
    //change bpm and subdivisions
    void config(int speed, QString compas);
    //calibrate the mic while time
    void calibrate(int time);
    //load the practice of id
    void SetPractice(int id);
    //
    void metronome();
    //On pulse detected
    void detectPulse(QString pulse);
    void savePDF(QString name);


};

#endif // SMC_LOGIC_H
