#ifndef SCORESAVER_H
#define SCORESAVER_H

#include <QVector>
#include <QString>
#include <QDir>
#include <QStandardPaths>
#include <QDebug>

class ScoreSaver{
public:
    static void SaveScore(QString fileName, QVector<QString>* data);
};

#endif // SCORESAVER_H
