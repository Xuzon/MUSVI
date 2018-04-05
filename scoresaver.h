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
    static void DeleteFromCurrentScores(int id);
    static void DeleteFromFileSystem(int id);

public:

    static void SaveScore(QString fileName, QVector<QString>* data,QString comments, QString folder,QString compas, int lastErrors,int speed, int subdivisions);
    static void LoadScores();
    static void LoadJsonFromFile(QString fileName);
    static QJsonObject LoadScore(int id);
    static int GetNewId();
    static void DeleteScore(int id);
    static QVector<QJsonObject> GetScores();


};

#endif // SCORESAVER_H
