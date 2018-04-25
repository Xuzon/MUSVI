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
#include <QJsonArray>
#include <QVector>
#include <QVariantList>


class ScoreSaver{

private:

    static QVector<QJsonObject> scores;
    static void DeleteFromCurrentScores(int id);
    static bool DeleteFromFileSystem(int id);
    static bool WriteJsonScore(QString filePath, QJsonObject json);
    static QString FromFileNameToPath(QString fileName);

public:

    static bool SaveScore(QString fileName, QVector<QString>* data,QString comments, QString folder,QString compas, int lastErrors,int speed, int subdivisions);
    static void LoadScores();
    static void LoadJsonFromFile(QString fileName);
    static void RefreshErrors(int id, int errors);
    static QJsonObject LoadScore(int id);
    static int GetNewId();
    static bool DeleteScore(int id);
    static QVariantList GetScores();


};

#endif // SCORESAVER_H
