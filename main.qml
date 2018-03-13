import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2
import "qml/" as Screens

//import ArtistMode 1.0
//import "../ArtistMode" as artist
//import "C:/Users/usuario/Desktop/musvi_interface-Eva/ArtistMode.qml"

Item {
    property bool noteVisible: false
    property var inputDevices
    property var outputDevices



    //    Connections{
    //        target: Logic
    //        onDetectPulse:{
    //            noteVisible = pulse
    //        }
    //        onSendInputDevices:{
    //            inputDevices = list
    //        }
    //        onSendOutputDevices:{
    //            outputDevices = list
    //        }
    //    }

//    Timer{
    //        id: timerNote
    //        interval: 100;
//        onTriggered: noteVisible = false
//    }



    //VENTANA PRINCIPAL - INICIO
    Window{
        id: portada
        visible: true
        width: 1024
        height: 768

        Screens.Musvi_Controller{
            id:controller
        }

        Screens.ArtistMode{
            id: artistMode
            visible: false
            onGoInit: {
                //Llamar a la función que reinicie todo
                practice.visible = false
                info.visible = false
                artistMode.visible = false
                init.visible = true
            }
            onStartRecording: {
                //Enviar la señal al controlador
                controller.sendStartRecording()
            }
            onStopRecording: {
                controller.sendStopRecording()
            }
        }
        Screens.Practice{
            id: practice
            visible: false
        }

        Screens.Information{
            id: info
            visible: false
        }

        Screens.Init{
            id: init
            onSelectMode: {
                switch(type){
                    case "artist":
                        practice.visible = false
                        info.visible = false
                        init.visible = false
                        artistMode.visible = true
                        break
                    case "practice":
                        info.visible = false
                        init.visible = false
                        artistMode.visible = false
                        practice.visible = true
                        break
                    case "info":
                        practice.visible = false
                        init.visible = true
                        artistMode.visible = false
                        info.visible = true
                        break
                }
            }
        }


    }

}
