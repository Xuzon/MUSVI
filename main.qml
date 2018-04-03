import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2

import "qml/" as Screens


Item {
    property bool noteVisible: false
    property var inputDevices
    property var outputDevices

    FontLoader {id: gothamBook; source: "qrc:/fonts/gotham/GothamBook.ttf"}
    FontLoader {id: gothamLight; source: "qrc:/fonts/gotham/GothamLight.ttf"}


    //VENTANA PRINCIPAL - INICIO
    Window{
        id: portada
        visible: true
        width: 1024
        height: 768

        Screens.Musvi_Controller{
            id:controller
        }

        Screens.PopUp{
            id: popUp
            visible: false
            onConfigChanged: {
                artistMode.speedValue = speed
                artistMode.compasValue = compas
                controller.configChanged(speed, compas)
            }
            onSavePDFSignal: {
                controller.savePDF(name)
            }
            onClosePopup: popUp.visible = false
        }

        Screens.ArtistMode{
            id: artistMode
            visible: false
            onVisibleChanged: {
                if(visible){
                    popUp.typePopup = "calibrate"
                    popUp.visible = true
                    controller.calibrate(5)
                }
            }

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
                popUp.typePopup = "save"
                popUp.visible = true
                controller.sendStopRecording()
            }
            onShowPopUp: {
                popUp.typePopup = type
                popUp.visible = true
            }
            onMetronome: {
                controller.metronome()
            }
            Connections{
                target: controller
                onDetectPulse:{
                    artistMode.printFigure(figure)
                }
            }

        }


        Screens.Practice_v2{
            id: practice
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
            onTypeScreenChanged: {
                if(typeScreen === "screenScore"){
                    controller.calibrate(5)
                }
            }
            onSetPractice: {
                //Llamar a la funcion de controller que llame a setPractice(id) de la logica
                console.log("OnSetPractice")
            }
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
                        artistMode.clear()
                        controller.mode("artist")
                        controller.configChanged(artistMode.speedValue, artistMode.compasValue)
                        artistMode.visible = true
                        break
                    case "practice":
                        info.visible = false
                        init.visible = false
                        artistMode.visible = false
                        controller.mode("practice")
                        practice.typeScreen = "screenSelection"
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
