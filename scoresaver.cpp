#include "scoresaver.h"

QVector<QJsonObject> ScoreSaver::scores;


///Save a score
void ScoreSaver::SaveScore(QString fileName, QVector<QString>* data,QString comments, QString folder,QString compas, int lastErrors,int speed, int subdivisions){
    QJsonObject json;

    //*****SEARCH IN TO THE PATH SYSTEM*************
    QString id = "/MUSVI/";
    QString dir = QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation)[0] + id;
    fileName = dir + fileName + ".json";
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
    json["compas"] = compas;

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


///Giving a path load a json into the current scores if exists
void ScoreSaver::LoadJsonFromFile(QString fileName){
    QJsonObject json;
    QString fileVal;
    QFile* file = new QFile(fileName);
    if(!file->exists()){
        qDebug() << "the file: " << fileName << " don't exists";
        delete file;
        return;
    }
    file->open(QIODevice::ReadOnly | QIODevice::Text);
    fileVal = file->readAll();
    file->close();
    delete file;
    QJsonDocument doc = QJsonDocument::fromJson(fileVal.toUtf8());
    json = doc.object();
    scores.append(json);
}

///Load all scores on the heap
void ScoreSaver::LoadScores(){

    scores.clear();

    QString fileName;
    //*****SEARCH IN TO THE PATH SYSTEM*************
    QString musviDir = "/MUSVI/";
    QString dir = QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation)[0] + musviDir;
    QDirIterator it(dir, QStringList() << "*.json", QDir::Files, QDirIterator::Subdirectories);

    //iterate over files to load them
    while (it.hasNext()){
        fileName = it.next();
        LoadJsonFromFile(fileName);
    }
    LoadJsonFromFile(":/json/example0.json");
    LoadJsonFromFile(":/json/example1.json");
    LoadJsonFromFile(":/json/example2.json");
    LoadJsonFromFile(":/json/example3.json");
}

///Return a score with the given id, if there isn't a score with that id
/// return a new empty json
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

///Get a new non used id
int ScoreSaver::GetNewId(){
    int toRet = 4;
    for(QJsonObject score : ScoreSaver::scores){
        if(!score.contains("id")){
            continue;
        }
        int temp = score["id"].toInt();
        if(temp > toRet){
            toRet = temp + 1;
        }
    }
    return toRet;
}

///Delete score with the given id
void ScoreSaver::DeleteFromFileSystem(int id){
    QJsonObject json;
    QString fileName;
    //*****SEARCH IN TO THE PATH SYSTEM*************
    QString musviDir = "/MUSVI/";
    QString dir = QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation)[0] + musviDir;
    QDirIterator it(dir, QStringList() << "*.json", QDir::Files, QDirIterator::Subdirectories);

    //iterate over files to load them
    while (it.hasNext()){
        fileName = it.next();
        QString fileVal;
        QFile* file = new QFile(fileName);
        file->open(QIODevice::ReadOnly | QIODevice::Text);
        fileVal = file->readAll();
        file->close();
        QJsonDocument doc = QJsonDocument::fromJson(fileVal.toUtf8());
        json = doc.object();
        if(!json.contains("id")){
            continue;
        }
        int jsonId = json["id"].toInt();
        if(jsonId == id){
            file->remove();
        }
        delete file;
    }
}

void ScoreSaver::DeleteScore(int id){
    DeleteFromCurrentScores(id);
    DeleteFromFileSystem(id);
}

QList<QJsonObject> ScoreSaver::GetScores(){

    return ScoreSaver::scores.toList();
}

///Delete the score with the given id on the loaded scores
void ScoreSaver::DeleteFromCurrentScores(int id){
    for(int i = 0; i < ScoreSaver::scores.count(); i++){
        if(!ScoreSaver::scores[i].contains(("id"))){
            continue;
        }
        int temp = (ScoreSaver::scores[i])["id"].toInt();
        if(temp == id){
            ScoreSaver::scores.removeAt(i);
            break;
        }
    }
}

