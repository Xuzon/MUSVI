#include "scorechecker.h"

ScoreChecker::ScoreChecker(){
    this->data.clear();
}

///Load a practice and returns its speed
int ScoreChecker::LoadPractice(int id, int* sub){
    this->data.clear();
    //check if artist mode
    this->artistMode = id == -1 ? true : false;
    if(this->artistMode){
        qDebug() << "Setting artist mode";
        return 0;
    }
    //TODO
    QJsonObject json = ScoreSaver::LoadScore(id);
    QString jsonData = json["data"].toString();
    int subdivisions = json["subdivisions"].toInt();
    int pulses = jsonData.length() / subdivisions;
    for(int i = 0; i < pulses; i++){
        QString subString = jsonData.mid(i * subdivisions,subdivisions);
        this->data.append(subString);
    }
    if(sub != nullptr){
        *sub = subdivisions;
    }
    return json["speed"].toInt();
}

///Check if there is an error in the score
/// return true if the pulse was right
bool ScoreChecker::HasError(QString pulse, int nCompas){
    if(this->artistMode){
        return false;
    }

    QString toCompare = nCompas < this->data.count() ? this->data[nCompas] : "-1";
    return !pulse.compare(toCompare);
}
