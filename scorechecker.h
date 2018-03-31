#ifndef SCORECHECKER_H
#define SCORECHECKER_H

#include <QString>
#include <QVector>

class ScoreChecker{

    bool artistMode;
    QVector<QString> data;

public:
    ScoreChecker();

    //if id -1 is artist mode
    void LoadPractice(int id);
    bool CheckError(QString pulse, int nCompas);
};

#endif // SCORECHECKER_H
