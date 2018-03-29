#include "scoresaver.h"


void ScoreSaver::SaveScore(QString fileName, QVector<QString>* data,QString comments, QString folder, int lastErrors){
    QJsonObject json;

    //*****SEARCH IN TO THE PATH SYSTEM*************
    QString id = "/MUSVI/";
    QString dir = QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation)[0] + id;
    fileName = dir + fileName;
    if (!QDir(dir).exists()) {
        if (!QDir().mkdir(dir)) {
            qDebug() << "Fatal error: Insufficient premissions to create directory -> " << dir;
            return;
        }
    }

    //****CREATE JSON OBJECT*****
    QString sData;
    for(QString string : (*data)){
        sData.append(string);
    }
    json["data"] = sData;
    json["lastErrors"] = lastErrors;
    json["comments"] = comments;
    json["folder"] = folder;

    //****WRITE JSON OBJECT******
    QFile* file = new QFile(fileName);
    if(file->open(QIODevice::WriteOnly)){
        qDebug() << "Writing to json";
        QJsonDocument doc(json);
        QString strJson(doc.toJson(QJsonDocument::Compact));
        file->write(strJson.toUtf8());
        file->close();
    }else{
        qDebug() << "Error creating file:: " << fileName << "  error:: "<< file->errorString();
    }
}
