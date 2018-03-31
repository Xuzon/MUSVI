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
    void Config(int bpm, QString compas);
    void detectPulse(QString pulse);
    //artist or practice
    void SetMode(QString type);
    void SetPractice(int id);
    void Calibrate(int time);
};

#endif // SMC_LOGIC_H
