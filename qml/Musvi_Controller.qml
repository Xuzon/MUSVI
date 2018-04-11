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
    signal detectPulse(var figure)
    signal scoreList(var list)
    signal errores(var hasError)

    Connections{
        target: Logic
        onSendPulse:{
            detectPulse(pulse)
            errores(hasError)
        }
        onGetScoreList: {
            scoreList(list)
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
        Logic.deleteScore(id)
    }

    function setPractice(id){
        Logic.setPractice(id);
    }

}
