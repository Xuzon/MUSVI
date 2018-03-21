#include "transcriptor.h"

///Start recording, get the selected input
void Transcriptor::startRecording(){
    //QString selectedItem = this->inputComboBox->property("currentText").toString();
    QAudioDeviceInfo info = QAudioDeviceInfo::defaultInputDevice();
    //Get selected audio device
    /*for(QAudioDeviceInfo inf : QAudioDeviceInfo::availableDevices(QAudio::Mode::AudioInput)){
        if(QString::compare(inf.deviceName(),selectedItem)){
            info = inf;
        }
    }*/
    //set format
    QAudioFormat inputFormat;
    inputFormat.setSampleRate(this->fs);
    inputFormat.setChannelCount(1);
    inputFormat.setSampleSize(16);
    inputFormat.setCodec("audio/pcm");
    inputFormat.setByteOrder(QAudioFormat::LittleEndian);
    inputFormat.setSampleType(QAudioFormat::SignedInt);
    for(auto rate : info.supportedSampleRates()){
        qDebug() << rate;
    }
    //check format
    if (!info.isFormatSupported(inputFormat)) {
        inputFormat = info.nearestFormat(inputFormat);
        qWarning() << "RECORDER::: Default format not supported, trying to use the nearest:: " + inputFormat.sampleRate();
    }

    //speakers = new QAudioOutput();
    if(this->metronomeThread != nullptr){
        //delete this->metronomeThread;
    }
    this->metronomeThread = new MetronomeThread(this->bpm,&this->recording,&this->beatFile,this->speakers);
    this->metronomeThread->start();
    //open buffer
    this->processor->open(QIODevice::ReadWrite);
    //create audio input
    this->input = new QAudioInput(info,inputFormat);
    //set current input and beat address
    this->processor->SetInput(this->input,this->metronomeThread->BeatAddress());
    //start recording audio
    this->input->start(this->processor);
}

///stop recording
void Transcriptor::stopRecording(){
    if(input != nullptr){
        input->stop();
        delete input;
        if(this->metronomeThread != nullptr){
            this->metronomeThread->wait();
            delete this->metronomeThread;
        }
    }
}


///Return the avaliable audio inputs
const QStringList Transcriptor::comboList(){
    QStringList toRet;
    for(auto info : QAudioDeviceInfo::availableDevices(QAudio::Mode::AudioInput)){
        toRet.append(info.deviceName());
    }
    return toRet;
}

///Change the bpm and compas, so need to change the buffer processor
void Transcriptor::ChangeTempoCompas(int bpm, int subdivisions){
    this->bpm = bpm;
    this->subdivisions = subdivisions;
    if(this->processor != nullptr){
        delete this->processor;
    }
    this->processor = new BufferProcessor(logic,2,this->fs,this->window,subdivisions,60.0f / bpm);
}


///Interface to start and stop recording from qml
void Transcriptor::record(){    
    this->recording = !this->recording;
    if(!recording){
        this->stopRecording();
    }else{
        this->startRecording();
    }
}

///Default constructor
Transcriptor::Transcriptor(){
  qDebug() << "This should never be called";
}

Transcriptor::Transcriptor(Musvi_Logic* logic){
    //set variables
    this->logic = logic;
    this->fs = 44100;
    //this->fs = 24000;
    this->bpm = 60;
    this->subdivisions = 4;
    this->window = 100;
    this->processor = new BufferProcessor(logic,2,this->fs,this->window,subdivisions,60.0f / bpm);
    this->recording = false;
    this->beatFileName = ":/sounds/beat.wav";
    this->beatFile.setFileName(beatFileName);
    qDebug() << "file exists: " << this->beatFile.exists();


    //Output
    QAudioDeviceInfo output = QAudioDeviceInfo::defaultOutputDevice();
    //set format
    QAudioFormat outputFormat;
    outputFormat.setSampleRate(this->fs);
    outputFormat.setChannelCount(1);
    outputFormat.setSampleSize(16);
    outputFormat.setCodec("audio/pcm");
    outputFormat.setByteOrder(QAudioFormat::LittleEndian);
    outputFormat.setSampleType(QAudioFormat::SignedInt);
    //check format
    if (!output.isFormatSupported(outputFormat)) {
       qWarning() << "Default format not supported, trying to use the nearest.";
       outputFormat = output.nearestFormat(outputFormat);
    }
    speakers = new QAudioOutput(output,outputFormat);
}

///Destructor
Transcriptor::~Transcriptor(){
    qDebug() << "Deleting transcriptor";
    delete this->processor;
    delete this->input;
    delete this->metronomeThread;
    delete this->speakers;
}

bool Transcriptor::IsRecording(){
    return this->recording;
}
