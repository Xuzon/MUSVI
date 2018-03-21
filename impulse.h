#ifndef IMPULSE_H
#define IMPULSE_H

#include <QObject>
class Impulse{

protected:
    float seconds;
    qint16 amplitude;

public:
    Impulse();
    explicit Impulse(float seconds, qint16 amplitude);

    float Mseconds();
    qint16 Amp();

    void SetMseconds(float seconds);
    void SetAmp(qint16 amp);
};

#endif // IMPULSE_H
