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


    Connections{
        target: Logic
        /* El elemento Logic ha emitido la señal sendToLogic(QJsonObject Qvar_json) */
        //        onSendToQml: {
        //            //Qvar_json es lo que recibimos
        //            message = Qvar_json
        //            emitAllQmlFiles()
        //        }

    }

    Keys.onPressed: {
        console.log("pressed")
        if (event.key === Qt.Key_0) {
            console.log("Negra");
            detectPulse("negra")
        }
        if (event.key === Qt.Key_1) {
            console.log("Negra");
            detectPulse("corchea")
        }
        if (event.key === Qt.Key_2) {
            console.log("Negra");
            detectPulse("silencio")
        }
        if (event.key === Qt.Key_5) {
            console.log("5");
            sendStartRecording("gg")
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

}
