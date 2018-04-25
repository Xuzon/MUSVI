#include "scorechecker.h"

ScoreChecker::ScoreChecker(){
    this->data.clear();
}

///Load a practice and returns its speed
int ScoreChecker::LoadPractice(int id, int* sub){
    this->id = id;
    this->data.clear();
    //check if artist mode
    this->artistMode = id == -1 ? true : false;
    if(this->artistMode){
        qDebug() << "Setting artist mode";
        return 0;
    }
    QJsonObject json = ScoreSaver::LoadScore(id);
    QJsonArray jsonData = json["data"].toArray();
    if(jsonData.count() == 0){
        qDebug() << "Count data is 0" << jsonData.empty();
        return -1;
    }
    for(int i = 0; i < jsonData.count(); i++){
        this->data.append(jsonData.at(i).toString());
    }

    int subdivisions = json["subdivisions"].toInt();
    if(sub != nullptr){
        *sub = subdivisions;
    }
    return json["BPM"].toInt();
}

///Check if there is an error in the score
/// return true if the pulse was right
bool ScoreChecker::HasError(QString pulse, int nCompas){
    if(this->artistMode){
        return false;
    }

    QString toCompare = nCompas < this->data.count() ? this->data[nCompas] : "-1";
    return pulse != toCompare;
}

bool ScoreChecker::IsArtist(){
    return this->artistMode;
}

int ScoreChecker::GetId(){
    return this->id;
}
