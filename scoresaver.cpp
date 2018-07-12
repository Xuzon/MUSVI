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
    ScoreSaver::scores.append(json);
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



/********************************************
 * @origin scoresaver.cpp
 * @brief Function to save the score at MusicXML format
 * @param f_fileName String with the name of the final file
 * @param f_json Json with the data of the score
 * @author Ismael Orge
 * @return void
 ***********************************************/
void ScoreSaver::SaveXML(QString f_fileName, QJsonObject f_json)
{
    //Create the file where write
    QFile l_fileMxml(f_fileName);
    if(!l_fileMxml.open(QFile::WriteOnly | QFile::Text ))
    {
        qDebug()<<"Error saving the XML file.";
        l_fileMxml.close();
        return;
    }

//    //QDomDocument is the element where we go to write the data of the XML
//    QDomDocument l_mXml("Score");

//    //Do the XML
//    QDomElement l_root=l_mXml.createElement("score-partwise");
//    l_root.setAttribute("Version", "3.1");
//        //General data of the score
//        QDomElement l_partList=l_mXml.createElement("part-list");
//        l_root.appendChild(l_partList);
//            //General data of the part
//            QDomElement l_scorePart=l_mXml.createElement("score-part");
//            l_scorePart.setAttribute("id","P1");
//            l_partList.appendChild(l_scorePart);
//                QDomElement l_partName=l_mXml.createElement("part-name");
//                QDomText l_textName=l_mXml.createTextNode(f_fileName);
//                l_partName.appendChild(l_textName);
//                l_scorePart.appendChild(l_partName);
//        //Data of the score (notes, clef...)
//        QDomElement l_part=l_mXml.createElement("part");
//        l_part.setAttribute("id","P1");
//        l_root.appendChild(l_part);
//            QDomElement l_measure1=l_mXml.createElement("measure");
//            l_measure1.setAttribute("number", 1);
//            l_part.appendChild(l_measure1);
//                QDomElement l_attributes=l_mXml.createElement("attributes");
//                l_measure1.appendChild(l_attributes);
//                    QDomElement l_divisions=l_mXml.createElement("divisions");
//                    QDomText l_numberDivisions=l_mXml.createTextNode(QString::number(1));
//                    l_divisions.appendChild(l_numberDivisions);
//                    l_attributes.appendChild(l_divisions);
//                    QDomElement l_key=l_mXml.createElement("key");
//                    l_attributes.appendChild(l_key);
//                        QDomElement l_fifths=l_mXml.createElement("fifths");
//                        QDomText l_numberFifths=l_mXml.createTextNode(QString::number(0));
//                        l_fifths.appendChild(l_numberFifths);
//                        l_key.appendChild(l_fifths);
//                    QDomElement l_time=l_mXml.createElement("time");
//                    l_attributes.appendChild(l_time);
//                        QDomElement l_clef=l_mXml.createElement("clef");
//                        l_time.appendChild(l_clef);
//                            QDomElement l_sign=l_mXml.createElement("sign");
//                            QDomText l_typeClef=l_mXml.createTextNode("G");
//                            l_sign.appendChild(l_typeClef);
//                            l_clef.appendChild(l_sign);
//                            QDomElement l_line=l_mXml.createElement("line");
//                            QDomText l_numberLine=l_mXml.createTextNode(QString::number(2));
//                            l_line.appendChild(l_numberLine);
//                            l_clef.appendChild(l_line);

//                //At this part, need to access the data of the json
//                QDomElement l_note=l_mXml.createElement("note");
//                //Access to the json


//    //Saving the XML
//    QTextStream l_output(&l_fileMxml);
//    l_output<<l_mXml.toString();
//    l_fileMxml.close();

}




QVector<XMLNote> ScoreSaver::PulseToXMLNotes(QString pulse)
{
    QVector<XMLNote> toRet;
    int index = 0;
    bool isRest = pulse[0] == '0';
    while(index < pulse.size()){
        XMLNote note = IntToXMLNote(CountNote(pulse,&index));
        note.m_Rest = isRest;
        isRest = false;
        toRet.append(note);
    }
    return toRet;
}

int ScoreSaver::CountNote(QString pulse, int* index)
{
    int counter = 0;
    for(int i = (*index) + 1; i < pulse.size(); i++, counter++){
        if(pulse[i] == '1'){
            (*index) = i;
            return counter;
        }
    }
    (*index) = pulse.size() + 1;
    return counter;
}

XMLNote ScoreSaver::IntToXMLNote(int value){
    XMLNote toRet;
    switch (value) {
    case 0:
        toRet.m_Note = "sixteenth";
        break;
    case 1:
        toRet.m_Note = "eighth";
        break;
    case 2:
        toRet.m_Note = "eighth";
        toRet.m_Dot = true;
        break;
    case 3:
        toRet.m_Note = "half";
        break;
    case 4:
        toRet.m_Note = "NO DEBERIA PASAR";
        break;
    case 5:
        toRet.m_Note = "half";
        toRet.m_Dot = true;
        break;
    }
    return toRet;
}
