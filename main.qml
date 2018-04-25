import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2
import QtMultimedia 5.8

import "qml/" as Screens


Item {
    property bool noteVisible: false
    property var inputDevices
    property var outputDevices

    FontLoader {id: gothamBook; source: "qrc:/fonts/gotham/GothamBook.ttf"}
    FontLoader {id: gothamLight; source: "qrc:/fonts/gotham/GothamLight.ttf"}
    FontLoader {id: gothamThin; source: "qrc:/fonts/gotham/GothamLight.otf"}


    //VENTANA PRINCIPAL - INICIO
    Window{
        id: portada
        visible: true
        width: 1024
        height: 768

        Screens.Musvi_Controller{
            id:controller
            onDeleteResponseLogic: {
                console.log("onDeleteResponseLogic")
                if(error){
                    popUp.typePopup = "deleteScoreError"
                    popUp.visible = true
                }else{
                    popUp.typePopup = "deleteScoreOk"
                    popUp.visible = true
                }
            }
            onSaveResponseLogic: {
                console.log("onSaveResponseLogic")
                if(error){
                    popUp.typePopup = "saveError"
                    popUp.visible = true
                }else{
                    popUp.typePopup = "saveOk"
                    popUp.visible = true
                }
            }
        }

        Screens.PopUp{
            id: popUp
            visible: false
            onVisibleChanged: {
                if(visible){
                    artistMode.enabled = false
                    practice.enabled = false
                }else{
                    artistMode.enabled = true
                    practice.enabled = true
                }
            }

            onConfigChanged: {
                artistMode.changeConfig(speed, compas)
                controller.configChanged(speed, compas)
            }
            onSavePDFSignal: {
                controller.savePDF(name)
            }
            onSaveExample: {
                controller.saveExample(name, comments, folder)
            }
            onDeleteScoreSignal: {
                controller.deleteScore(id)
                practice.deleteScoreFromList(id)
            }
            onClosePopup: {
                console.log("close popup")
                popUp.visible = false
            }
            onChangeScreenScore: {
                practice.loadData(json)
                practice.typeScreen = "screenScore"
                popUp.typePopup = "calibrate"
                popUp.visible = true
                practice.enabled = false
                controller.calibrate(5)
            }
        }

        Screens.ArtistMode{
            id: artistMode
            visible: false
            onShowInfoMusvi: {
                info.visible = infoShow
            }
            onVisibleChanged: {
                if(visible){
                    popUp.typePopup = "calibrate"
                    popUp.visible = true
                    artistMode.enabled = false
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
                onDetectPulseArtist:{
                    artistMode.printFigure(figure)
                }
            }

        }


        Screens.Practice{
            id: practice
            visible: false
            onShowInfoMusvi: {
                info.visible = infoShow
            }
            onShowPopUp: {
                popUp.typePopup = typePopup
                popUp.visible = true
            }
            onGoInit: {
                practice.visible = false
                info.visible = false
                artistMode.visible = false
                init.visible = true
            }
            onStartRecording: {
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
            onMetronome: {
                controller.metronome()
            }
            onSetPractice: {
                controller.setPractice(id)
            }
            onDeleteById: {
                console.log("MAIN LIST deletebyid: " + id)
                popUp.deleteId = id
                popUp.typePopup = "deleteScore"
                popUp.visible = true
            }
            onSendInformationToPopup: {
                popUp.scoreData = scoreData
                popUp.typePopup = "info"
                popUp.visible = true
            }
        }

        Screens.Information{
            id: info
            visible: false
            z: 10
            Rectangle {
              id: containerInfo
              x: 0
              y: 100
              width: 1025; height: 668;
              Flickable {
                id: flickable
                anchors.fill: parent;
                contentWidth: image.width;
                contentHeight: image.height
                clip: true
                Image {
                    id: image;
                    mipmap : true
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                    source: "qrc:/images/info_musvi.png"
                }
              }
            }
        }

        Screens.Init{
            id: init
            onShowInfoMusvi: {
                info.visible = infoShow
            }
            onSelectMode: {
                switch(type){
                    case "artist":
                        practice.visible = false
                        info.visible = false
                        init.visible = false
                        artistMode.clear()
                        controller.mode("artist")
                        controller.configChanged(60, "4/4")
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

                }
            }

        }

    }

}
