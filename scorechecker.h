#ifndef SCORECHECKER_H
#define SCORECHECKER_H

#include <QString>
#include <QVector>
#include "scoresaver.h"

class ScoreChecker{

    bool artistMode;
    QVector<QString> data;

public:
    ScoreChecker();

    //if id -1 is artist mode
    //returns speed
    int LoadPractice(int id, int* sub = nullptr);
    bool HasError(QString pulse, int nCompas);
    bool IsArtist();
};

#endif // SCORECHECKER_H
