#include "scoresaver.h"


void ScoreSaver::SaveScore(QString fileName, QVector<QString>* data){
    QString id = "/MUSVI/";
    QString dir = QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation)[0] + id;
    fileName = dir + fileName;
    if (!QDir(dir).exists()) {
        if (!QDir().mkdir(dir)) {
            qDebug() << "Fatal error: Insufficient premissions to create directory -> " << dir;
            return;
        }
    }
    QFile* file = new QFile(fileName);
    if(file->open(QIODevice::WriteOnly)){
        qDebug() << "Writing to json";
        for(QString string : (*data)){
            file->write(string.toUtf8());
        }
        file->close();
    }else{
        qDebug() << "Error creating file:: " << fileName << "  error:: "<< file->errorString();
    }
}
