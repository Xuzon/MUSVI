#ifndef SCORESAVER_H
#define SCORESAVER_H

#include <QVector>
#include <QString>
#include <QDir>
#include <QDirIterator>
#include <QStandardPaths>
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>
#include <QVector>

class ScoreSaver{

private:

    static QVector<QJsonObject> scores;


public:

    static void SaveScore(QString fileName, QVector<QString>* data,QString comments, QString folder, int lastErrors);
    static void LoadScores();
    static QJsonObject LoadScore(int id);
};

#endif // SCORESAVER_H
