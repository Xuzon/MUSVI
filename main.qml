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
            onDeleteScoreSignal: {
                controller.deleteScore(id)
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
            onShowInfoPopup: {
                popUp.typePopup = "infoMusvi"
                popUp.visible = true
            }
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
                        practice.visible = true
                        break
                }
            }
        }

    }

}
