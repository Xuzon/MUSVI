#include "scoresaver.h"

QVector<QJsonObject> ScoreSaver::scores;

void ScoreSaver::SaveScore(QString fileName, QVector<QString>* data,QString comments, QString folder, int lastErrors,int speed, int subdivisions){
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

    json["id"] = ScoreSaver::GetNewId();
    json["data"] = sData;
    json["lastErrors"] = lastErrors;
    json["comments"] = comments;
    json["folder"] = folder;
    json["speed"] = speed;
    json["subdivisions"] = subdivisions;

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
    delete file;
}

void ScoreSaver::LoadScores(){

    scores.clear();


    QJsonObject json;
    QString fileName;
    //*****SEARCH IN TO THE PATH SYSTEM*************
    QString id = "/MUSVI/";
    QString dir = QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation)[0] + id;
    QDirIterator it(dir, QStringList() << "*.json", QDir::Files, QDirIterator::Subdirectories);

    //iterate over files to load them
    while (it.hasNext()){
        fileName = it.next();
        QString fileVal;
        QFile* file = new QFile(fileName);
        file->open(QIODevice::ReadOnly | QIODevice::Text);
        fileVal = file->readAll();
        file->close();
        delete file;
        QJsonDocument doc = QJsonDocument::fromJson(fileVal.toUtf8());
        json = doc.object();
        scores.append(json);
    }
}

QJsonObject ScoreSaver::LoadScore(int id){
    QJsonObject toRet;
    for(QJsonObject json : scores){
        int jsonId = json["id"].toInt();

        if(jsonId == id){
            qDebug() << "Returning json of id:: " << json["id"];
            toRet = json;
            break;
        }
    }
    return toRet;
}

int ScoreSaver::GetNewId(){
    int toRet = 0;
    for(QJsonObject score : ScoreSaver::scores){
        if(!score.contains("id")){
            continue;
        }
        int temp = score["id"].toString().toInt();
        if(temp > toRet){
            toRet = temp + 1;
        }
    }
    return toRet;
}
