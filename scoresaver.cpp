#include "scoresaver.h"

QVector<QJsonObject> ScoreSaver::scores;


///Write a json into the filesystem
bool ScoreSaver::WriteJsonScore(QString filePath, QJsonObject json){
    bool toRet = true;
    QFile* file = new QFile(filePath);
    if(file->open(QIODevice::WriteOnly)){
        qDebug() << "Writing to json";
        QJsonDocument doc(json);
        QString strJson(doc.toJson(QJsonDocument::Compact));
        file->write(strJson.toUtf8());
        file->close();
        toRet = false;
    }else{
        qDebug() << "Error creating file:: " << filePath << "  error:: "<< file->errorString();
    }
    delete file;
    return toRet;
}

///Append the file name to the documents folder, if there is an error creating or accessing that
/// directory returns ""
QString ScoreSaver::FromFileNameToPath(QString fileName){
    QString id = "/MUSVI/";
    QString dir = QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation)[0] + id;
    QString filePath = dir + fileName + ".json";
    if (!QDir(dir).exists()) {
        if (!QDir().mkdir(dir)) {
            qDebug() << "Fatal error: Insufficient premissions to create directory -> " << dir;
            return "";
        }
    }
    return filePath;
}

bool ScoreSaver::SaveScore(QString fileName, QVector<QString>* data,QString comments, QString folder,QString compas, int lastErrors,int speed, int subdivisions){

    QJsonObject json;

    //*****SEARCH IN TO THE PATH SYSTEM*************
    QString filePath = ScoreSaver::FromFileNameToPath(fileName);
    if(filePath == ""){
        return true;
    }


    //****CREATE JSON OBJECT*****
    QJsonArray array;
    QString initialZeroes = subdivisions == 4 ? "0000" : "000000";
    array.append(initialZeroes);
    for(QString string : (*data)){
        array.append(string);
    }

    json["name"] = fileName;
    json["id"] = ScoreSaver::GetNewId();
    json["data"] = array;
    json["errors"] = lastErrors;
    json["comments"] = comments;
    json["folder"] = folder;
    json["BPM"] = speed;
    json["subdivisions"] = subdivisions;
    json["compas"] = compas;


    //****WRITE JSON OBJECT******
    return WriteJsonScore(filePath, json);;
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

///Delete from current score in the heap, refresh the file in file system
void ScoreSaver::RefreshErrors(int id, int errors){
    QJsonObject score = LoadScore(id);
    ScoreSaver::DeleteFromCurrentScores(id);
    score["errors"] = errors;
    QString filePath = ScoreSaver::FromFileNameToPath(score["name"].toString());
    if(filePath == ""){
        qDebug() << "RefreshErrors:: There was an error getting the path";
        return;
    }
    if(ScoreSaver::WriteJsonScore(filePath,score)){
        qDebug() << "RefreshErrors:: There was an error writing the refreshed score";
    }
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
        if(temp >= toRet){
            toRet = temp + 1;
        }
    }
    return toRet;
}

///Delete score with the given id
bool ScoreSaver::DeleteFromFileSystem(int id){
    bool toRet = true;
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
            toRet = false;
        }
        delete file;
    }
    return toRet;
}

bool ScoreSaver::DeleteScore(int id){
    DeleteFromCurrentScores(id);
    return DeleteFromFileSystem(id);
}

//QList<QJsonObject> ScoreSaver::GetScores(){
QVariantList ScoreSaver::GetScores(){

    //return ScoreSaver::scores.toList();
    QVariantList toRet;
    for(QJsonObject json : scores){
    toRet.append(json.toVariantMap());
    }
    return toRet;

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

