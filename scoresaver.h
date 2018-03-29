#ifndef SCORESAVER_H
#define SCORESAVER_H

#include <QVector>
#include <QString>
#include <QDir>
#include <QStandardPaths>
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>

class ScoreSaver{
public:
    static void SaveScore(QString fileName, QVector<QString>* data,QString comments, QString folder, int lastErrors);
};

#endif // SCORESAVER_H
