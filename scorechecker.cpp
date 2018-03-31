#include "scorechecker.h"

ScoreChecker::ScoreChecker(){
    this->data.clear();
}

void ScoreChecker::LoadPractice(int id){
    //check if artist mode
    this->artistMode = id == -1 ? true : false;
    if(this->artistMode){
        return;
    }
    //TODO
}

///Check if there is an error in the score
/// return true if the pulse was right
bool ScoreChecker::CheckError(QString pulse, int nCompas){
    if(this->artistMode){
        return true;
    }

    QString toCompare = nCompas < this->data.count() ? this->data[nCompas] : "-1";
    return pulse.compare(toCompare);
}
