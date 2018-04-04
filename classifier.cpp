#include "classifier.h"

Classifier::Classifier(int subdivisions,float totalLength){
    this->subdivisions = subdivisions;
    this->totalLength = totalLength * 1000;
    this->buffer = new bool[subdivisions];
    this->CalculateTimeStamps();
    this->FillLUT();
    /*qDebug() << "classifying 100001:: " << this->ClassifyTernary("100001");
    qDebug() << "classifying 100010:: " << this->ClassifyTernary("100010");
    qDebug() << "classifying 010010:: " << this->ClassifyTernary("010010");
    qDebug() << "classifying 011000:: " << this->ClassifyTernary("011000");
    qDebug() << "classifying 101010:: " << this->ClassifyTernary("101010");
    qDebug() << "classifying 101001:: " << this->ClassifyTernary("101001");*/
}

///Delete allocated memory
Classifier::~Classifier(){
    delete[] this->buffer;
    delete[] this->timeStamps;
}

///Linear interpolation
float Classifier::Lerp(float x, float y, float t) {
    return x + t * (y - x);
}

///Fill the ternary LUT
void Classifier::FillLUT(){
    this->ternaryLUT.append("100010");
    this->ternaryLUT.append("101000");
    this->ternaryLUT.append("100100");
    this->ternaryLUT.append("110000");
    this->ternaryLUT.append("001100");
    this->ternaryLUT.append("101010");
}

///Return a 111000 (binary string) to a int 0011 -> 3
int Classifier::StringToByte(QString compas){
    int toRet = 0;
    for(int i = 0; i < compas.length(); i++){
        int nextBit = compas.at(i).unicode() -  '0';
        toRet = toRet | nextBit << (compas.length() - i - 1) ;
    }
    return toRet;
}

///Returns a binary int to a string 2 -> 000010 , 3 -> 000011
QString Classifier::ByteToString(int input){
    QString toRet = "";
    for(int i = 0; i < 6 ; i++){
        if(input % 2 == 0){
            toRet.append("0");
        }else{
            toRet.append("1");
        }
        input >>= 1;
    }
    std::reverse(toRet.begin(), toRet.end());
    return toRet;
}

///Returns the hamming weight of an int
int Classifier::HammingWeight(int vector){
    int result = 0;
    while(vector != 0){
        result++;
        vector &=vector-1;
    }
    return result;
}

///Search over the LUT for the closest vector using Hamming Weight
QString Classifier::ClassifyTernary(QString compas){
    int compasByte = Classifier::StringToByte(compas);
    int compasWeight = Classifier::HammingWeight(compasByte);
    int index = -1;

    QVector<QString> candidates;
    int minZeroes = 6;

    for(int i = 0; i < this->ternaryLUT.count(); i++){
        int lutByte = Classifier::StringToByte(this->ternaryLUT[i]);
        if(compasWeight != Classifier::HammingWeight(lutByte)){
            continue;
        }
        //todo search for error distance
        QString common = Classifier::ByteToString(~(compasByte ^ lutByte));
        int zeroes = 0;
        for(int j = 0; j < common.length(); j++){
            if(common[j] == '0'){
                zeroes++;
            }
        }
        if(zeroes < minZeroes){
            if(zeroes != minZeroes){
                candidates.clear();
            }
            minZeroes = zeroes;
            candidates.append(this->ternaryLUT[i]);
        }
    }

    int minErrorDistance = 6;
    for(int i = 0; i < candidates.count(); i++){
        int subIndex = 0;
        int errorDistance = 0;
        while(candidates.indexOf("0",subIndex) != -1){
            int firstIndex = candidates.indexOf("0",subIndex);
            subIndex = firstIndex;
            int secondIndex = candidates.indexOf("0",subIndex);
            errorDistance += (secondIndex - firstIndex - 1);
        }
        if(errorDistance < minErrorDistance){
            minErrorDistance = errorDistance;
            index = i;
        }
    }
    return index > -1 ? candidates[index] : compas;
}

///Calculate subbeats in ms
void Classifier::CalculateTimeStamps(){
    this->timeStamps = new float [subdivisions + 1];
    for(int i = 0; i < subdivisions + 1; i++){
        float t = (float)i / (float)subdivisions;
        this->timeStamps[i] = this->Lerp(0,totalLength,t);
    }
}

///All the impulses are classified, just searching over the subdivisions
/// who has the min distance
bool Classifier::ClassifyImpulse(float ms){
    float minDistance = totalLength;
    int index = 0;
    for(int i = 0; i < this->subdivisions + 1; i++){
        float distance = abs(ms - timeStamps[i]);
        if(distance < minDistance){
            minDistance = distance;
            index = i;
        }
    }
    if(index < this->subdivisions){
        this->buffer[index] = true;
        return false;
    }else{
        return true;
    }
}

///Classify the beat buffer, remove the impulses of the current beat and
/// let live the impulses of the next beat
QString Classifier::Classify(QVector<Impulse>* beatBuffer){
    QString toRet = "";
    QVector<Impulse> nextPulses;
    //reset buffer
    for(int i = 0; i < subdivisions ; i++){
        buffer[i] = false;
    }
    //iterate over impulses
    for(int j = 0; j < beatBuffer->count(); j++){
        Impulse& impulse = (*beatBuffer)[j];
        if(this->ClassifyImpulse(impulse.Mseconds())){
            impulse.SetMseconds(impulse.Mseconds() - totalLength);
            nextPulses.append(impulse);
        }
    }
    //clear impulses buffer
    beatBuffer->clear();
    //save the next beat impulses
    beatBuffer->append(nextPulses);
    //calculate return buffer
    for(int i = 0; i < this->subdivisions; i++){
        QString toAdd = this->buffer[i] ? "1" : "0" ;
        toRet.append(toAdd);
    }
    //Classify ternaries
    if(this->subdivisions == 6){
        toRet = ClassifyTernary(toRet);
    }
    return toRet;
}
