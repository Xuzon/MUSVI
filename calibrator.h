#ifndef CALIBRATOR_H
#define CALIBRATOR_H

#include <QAudioInput>

class Calibrator: public QIODevice{

public:
    Calibrator();
    ~Calibrator();

    bool open(OpenMode mode);
    qint64 writeData(const char *data, qint64 maxSize);
    qint64 readData ( char * data, qint64 maxSize );
    int threshold;
    int counter;
};


#endif // CALIBRATOR_H
