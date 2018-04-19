import QtQuick 2.1
//import "../../functions.js" as Functions

Item{
    id: musvi_controller

    property url soundFolder: ""
    property url imgFolder: "../../../ressources/images/images_smart_car/"

    property string enumReceived


    property var message: {}

    signal emitAllQmlFiles(var data)
    signal info(var data)
    signal detectPulseArtist(var figure)
    signal detectPulsePractice(var figure, var error)
    signal scoreList(var list)
    signal errores(var hasError)
    signal deleteResponseLogic(var error)
    signal saveResponseLogic(var error)

    Connections{
        target: Logic
        onSendPulseArtist:{
            detectPulseArtist(pulse)
        }
        onSendPulsePractice:{
            detectPulsePractice(pulse, hasError)
        }
        onGetScoreList: {
            scoreList(list)
        }
        onDeleteResponse: {
            deleteResponseLogic(error)
        }
        onSaveResponse: {
            saveResponseLogic(error)
        }
    }


    /* Cualquier elemento .qml que haga un import de Musvi_Controller puede acceder a estas funciones */
    function sendToLogic(place, selection){
        console.log("QML:: SEND TO LOGIC")
        Logic.receiveFromQml(place, selection)
    }

    function sendStartRecording(){
        console.log("QML:: SEND TO LOGIC - start Recording")
        Logic.startRecording()
    }

    function sendStopRecording(){
        Logic.stopRecording()
    }

    function mode(type){
        Logic.mode(type)
    }

    function configChanged(speed, compas){
        console.log(" ------------------------- CONFIGURACION CAMBIADA -----------------------")
        Logic.config(speed, compas)
    }

    function metronome(){
        Logic.metronome()
    }

    function calibrate(time){
        Logic.calibrate(time)
    }

    function savePDF(name){
        Logic.savePDF(name)
    }

    function saveExample(name, comments, folder){
        Logic.saveExample(name, comments, folder)
    }
    
    function deleteScore(id){
        console.log("Qml:: deleteScore " + id)
        Logic.deleteScore(id)
    }

    function setPractice(id){
        console.log("Logic setPractice " + id)
        Logic.setPractice(id);
    }

}
