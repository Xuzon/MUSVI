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

#include <QXmlStream.h>
#include <QtXml/qxml.h>
#include <QtXml/Qdom.h>
#include <qglobal.h>


typedef struct XMLNote{
    QString m_Note;
    bool m_Dot;
    bool m_Rest;

    explicit XMLNote(){ m_Dot = false; m_Rest = false;}
}XMLNote;

class ScoreSaver{

private:
    static QVector<QJsonObject> scores;
    static void DeleteFromCurrentScores(int id);
    static bool DeleteFromFileSystem(int id);
    static bool WriteJsonScore(QString filePath, QJsonObject json);
    static QString FromFileNameToPath(QString fileName);
    static int CountNote(QString pulse,int* index);



    static XMLNote IntToXMLNote(int value);

public:

    static bool SaveScore(QString fileName, QVector<QString>* data,QString comments, QString folder,QString compas, int lastErrors,int speed, int subdivisions);
    static void LoadScores();
    static void LoadJsonFromFile(QString fileName);
    static void RefreshErrors(int id, int errors);
    static void SaveXML(QString fileName, QJsonObject json);
    static QJsonObject LoadScore(int id);
    static int GetNewId();
    static bool DeleteScore(int id);
    static QVariantList GetScores();
    static QVector<XMLNote> PulseToXMLNotes(QString pulse);



};

#endif // SCORESAVER_H
