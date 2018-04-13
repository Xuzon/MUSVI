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
    //for(auto rate : info.supportedSampleRates()){
    //    qDebug() << rate;
    //}
    //check format
    if (!info.isFormatSupported(inputFormat)) {
        inputFormat = info.nearestFormat(inputFormat);
        qWarning() << "RECORDER::: Default format not supported, trying to use the nearest:: " + inputFormat.sampleRate();
    }
    this->metronomeThread->processBeat = true;
    //open buffer
    this->processor->open(QIODevice::ReadWrite);
    //create audio input
    this->input = std::shared_ptr<QAudioInput>(new QAudioInput(info,inputFormat));
    //set current input and beat address
    this->processor->SetInput(this->input,this->metronomeThread->BeatAddress());
    //start recording audio
    this->input->start(this->processor.get());
    //qDebug() << "record error" << this->input->error() << " state::" << this->input->state();
}

///stop recording
void Transcriptor::stopRecording(){
    if(input != nullptr){
        input->stop();
        if(this->metronomeThread){
            this->metronomeThread->wait();
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
    int threshold = this->calibrator != nullptr ? this->calibrator->threshold : 4000;
    this->processor = std::unique_ptr<BufferProcessor>(new BufferProcessor(logic,2,this->fs,this->window,subdivisions,60.0f / bpm,threshold));
}

void Transcriptor::Calibrate(int time){
    if(calibrating){
        return;
    }
    calibrating = true;
    this->calibrator = std::unique_ptr<Calibrator>(new Calibrator());
    this->calibrator->open(QIODevice::ReadWrite);
    QAudioDeviceInfo info = QAudioDeviceInfo::defaultInputDevice();

    QAudioFormat inputFormat;
    inputFormat.setSampleRate(this->fs);
    inputFormat.setChannelCount(1);
    inputFormat.setSampleSize(16);
    inputFormat.setCodec("audio/pcm");
    inputFormat.setByteOrder(QAudioFormat::LittleEndian);
    inputFormat.setSampleType(QAudioFormat::SignedInt);

    //check format
    if (!info.isFormatSupported(inputFormat)) {
        inputFormat = info.nearestFormat(inputFormat);
        qWarning() << "RECORDER::: Default format not supported, trying to use the nearest:: " + inputFormat.sampleRate();
    }
    //create audio input
    this->input = std::shared_ptr<QAudioInput>(new QAudioInput(info,inputFormat));
    //start recording audio
    this->input->start(this->calibrator.get());
    QTimer::singleShot(time *1000,this,SLOT(StopCalibration()));
}

void Transcriptor::SaveScore(QString fileName, int errors, QString folder, QString comments, QString compas){
    ScoreSaver::SaveScore(fileName,&this->processor->currentScore,comments,folder,compas,errors,this->bpm,this->subdivisions);
}

void Transcriptor::StartMetronome(){
    if(this->metronomeThread != nullptr){
        //delete this->metronomeThread;
    }
    this->metronomeThread = std::unique_ptr<MetronomeThread>(new MetronomeThread(this->bpm,&this->recording,&this->beatFile,this->speakers));
    this->metronomeThread->start();
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

Transcriptor::Transcriptor(std::shared_ptr<Musvi_Logic> logic){
    //HACK for testing
    ScoreSaver::LoadScores();
    //ScoreSaver::LoadScore(1);

    //set variables
    this->logic = logic;
    this->fs = 44100;
    //this->fs = 24000;
    this->bpm = 60;
    this->subdivisions = 4;
    this->window = 100;
    this->recording = false;
    this->calibrating = false;
    this->beatFileName = ":/sounds/beat.aiff";
    this->beatFile.setFileName(beatFileName);
    //qDebug() << "beat file exists: " << this->beatFile.exists();


    //Output
    QAudioDeviceInfo output = QAudioDeviceInfo::defaultOutputDevice();
    //set format
    for(QAudioDeviceInfo inf : QAudioDeviceInfo::availableDevices(QAudio::Mode::AudioOutput)){
        qDebug() << inf.deviceName();
    }
    QAudioFormat outputFormat;
    outputFormat.setSampleRate(this->fs);
    outputFormat.setChannelCount(2);
    outputFormat.setSampleSize(16);
    outputFormat.setCodec("audio/pcm");
    outputFormat.setByteOrder(QAudioFormat::LittleEndian);
    outputFormat.setSampleType(QAudioFormat::SignedInt);
    //check format
    if (!output.isFormatSupported(outputFormat)) {
        qWarning() << "Default format not supported, trying to use the nearest.";
        outputFormat = output.nearestFormat(outputFormat);
    }
    speakers = std::shared_ptr<QAudioOutput>(new QAudioOutput(output,outputFormat));
}

///Destructor
Transcriptor::~Transcriptor(){
    qDebug() << "Deleting transcriptor";
}

bool Transcriptor::IsRecording(){
    return this->recording;
}

void Transcriptor::StopCalibration(){
    this->calibrator->close();
    this->calibrating = false;
    //only for the presentation
    this->calibrator->threshold=4000; //DELETE this line later

    this->input->stop();
    qDebug() << "THRESHOLD:: " << this->calibrator->threshold;
    this->processor = std::unique_ptr<BufferProcessor>(new BufferProcessor(logic,2,this->fs,this->window,subdivisions,60.0f / bpm,this->calibrator->threshold));
}
