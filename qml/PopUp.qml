import QtQuick 2.6
import Qt.labs.platform 1.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0


Item{
    id: popUp
    z: 10

    property string typePopup //config, info, save, save_PDF, save_App, calibrate, deleteScore
    property string title
    //Para info y para deleteScore
    property var scoreData : {
        "id"        : "0",
        "name"      : "Partitura 2/4",
        "speed"     : "120",
        "compas"    : "2/4",
        "comments"  : "Este ejercicio es de nivel\n1, tiene un compás 2/4 a una\nvelocidad de 120",
        "numErrors" : "1"
    }


    signal closePopup()
    signal configChanged(var speed, var compas)
    signal savePDFSignal(var name)
    signal deleteScoreSignal(var id)


    Item{
        //Popup de configuración
        //  - Velocity : velocidades a elegir o escritas (int)
        //  - Compas : compases a elegir (string)
        id: config
        visible: typePopup === "config"
        Image{
            id: bgConfig
            source: "qrc:/images/popupConfig/bgConfig.png"
        }
        Image{
            id: closePopupConfig
            source: "qrc:/images/popupConfig/closePopup.png"
            x: 780
            y: 31
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    closePopupConfig.scale = 1.1
                }
                onReleased: {
                    closePopupConfig.scale = 1
                    closePopup()
                }
            }
        }

        Text{
            id: textConfig
            text: "¿Quieres cambiar los ajustes de tu creación?"
            font.family: gothamBook.name
            font.pixelSize: 18
            color: "#666666"
            //font.bold: true
            anchors.horizontalCenter: bgConfig.horizontalCenter
            y: 210
        }
        Text{
            id: speedConfig
            text: "Velocidad"
            font.family: gothamBook.name
            font.pixelSize: 18
            color: "#0a465b"
            //font.bold: true
            x: 266
            y: 289
        }

        Slider {
            id: slider
            from: 60
            to: 200
            value: 60
            stepSize: 1
            width: 493
            x: 267
            y: 310
            ToolTip {
                parent: slider.handle
                visible: slider.pressed
                contentItem: Text {
                    text: slider.value
                    font.family: gothamLight.name
                    font.pixelSize: 16
                    color: "#666666"
                }
                background: Rectangle {
                    border.color: "transparent"
                }
            }
        }



        Text{
            id: compasConfig
            text: "Compás"
            font.family: gothamBook.name
            font.pixelSize: 18
            color: "#0a465b"
            x: 266
            y: 372
        }

        ComboBox {
            id: compasSelector
            model: [ "2/4", "3/4", "4/4", "3/8", "6/8", "9/8", "12/8" ]
            x: 270
            y: 385
            background: Rectangle {
                implicitWidth: 120
                implicitHeight: 40
                border.color: "#c4c4c4"
                border.width: 1
                radius: 5
            }
        }

        Image {
            id: cancelConfig
            source: "qrc:/images/popupConfig/botonCancel.png"
            x: 247
            y: 456
            MouseArea{
                anchors.fill: cancelConfig
                onPressed: {
                    cancelConfig.scale = 1.1
                }
                onReleased: {
                    cancelConfig.scale = 1
                    closePopup()
                }
            }
        }
        Image {
            id: changeConfig
            source: "qrc:/images/popupConfig/botonChange.png"
            x: 557
            y: 456
            MouseArea{
                anchors.fill: changeConfig
                onPressed: {
                    changeConfig.scale = 1.1
                }
                onReleased: {
                    changeConfig.scale = 1
                    configChanged(slider.value, compasSelector.currentText)
                    closePopup()
                }
            }
        }
    }

    Item{
        //Popup de información
        //  Ver como poder generar un cuadro de texto 'html por ejemplo', que tenga la propiedad de deslizar hacia abajo
        id: calibrate
        visible: typePopup === "calibrate"
        onVisibleChanged: {
            if(visible){
                timerCalibrate.start()
            }
        }

        Image{
            id: bgCalibrate
            source: "qrc:/images/calibrate/bgCalibrate.png"
        }

        AnimatedImage{
            id: calibrateGif
            source: "qrc:/images/calibrate/calibrate.gif"
            playing: true
            x: 474
            y: 225
        }

        Timer{
            id: timerCalibrate
            interval: 1500
            onTriggered: {
                console.log("finish calibrate")
                closePopup()
            }
        }

        Image{
            id: textCalibrate
            source: "qrc:/images/calibrate/textCalibrate.png"
            anchors.horizontalCenter: calibrateGif.horizontalCenter
            y: 339
        }
    }

    Item{
        //Popup de información
        //  Ver como poder generar un cuadro de texto 'html por ejemplo', que tenga la propiedad de deslizar hacia abajo
        id: info
        visible: typePopup === "info"
        Image{
            id: bgInfo
            source: "qrc:/images/popupInfo/bgPopupInfo.png"
        }
        Image{
            id: closePopupInfo
            source: "qrc:/images/popupSave/closePopup.png"
            x: 780
            y: 31
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    closePopupInfo.scale = 1.1
                }
                onReleased: {
                    closePopupInfo.scale = 1
                    closePopup()
                }
            }
        }
        Image {
            id: nameInfo
            source: "qrc:/images/popupInfo/name.png"
            x: 300
            y: 196
        }
        Text{
            id: textNameInfo
            text: scoreData.name
            font.family: gothamLight.name
            font.pixelSize: 22
            color: "#666666"
            //font.bold: true
            x: 344
            y: 233
        }
        Image{
            id: speedInfo
            source: "qrc:/images/popupInfo/speed.png"
            x: 300
            y: 273
        }
        Text{
            id: textSpeedInfo
            text: scoreData.speed
            font.family: gothamLight.name
            font.pixelSize: 22
            color: "#666666"
            //font.bold: true
            x: 344
            y: 309
        }
        Image{
            id: compasInfo
            source: "qrc:/images/popupInfo/compas.png"
            x: 300
            y: 346
        }
        Text{
            id: textCompasInfo
            text: scoreData.compas
            font.family: gothamLight.name
            font.pixelSize: 22
            color: "#666666"
            //font.bold: true
            x: 344
            y: 382
        }
        Image{
            id: commentsInfo
            source: "qrc:/images/popupInfo/comments.png"
            x: 300
            y: 424
        }
        Text{
            id: textComentsInfo
            text: scoreData.comments
            font.family: gothamLight.name
            font.pixelSize: 22
            color: "#666666"
            //font.bold: true
            x: 344
            y: 471
        }
        Image{
            id: closeInfo
            source: "qrc:/images/popupInfo/closeButton.png"
            x: 410
            y: 644
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    closeInfo.scale = 1.1
                }
                onReleased: {
                    closeInfo.scale = 1
                    closePopup()
                }
            }
        }
    }

    Item{
        //Popup de guardar partitura
        id: save
        visible: typePopup === "save"
        Image {
            id: bgSave
            source: "qrc:/images/popupSave/bgSave.png"
        }
        Image{
            id: closePopupSave
            source: "qrc:/images/popupSave/closePopup.png"
            x: 780
            y: 31
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    closePopupSave.scale = 1.1
                }
                onReleased: {
                    closePopupSave.scale = 1
                    closePopup()
                }
            }
        }
        Text{
            id: textSave
            text: "¿Cómo quieres que se guarde? PDF o en la propia app"
            font.family: gothamBook.name
            font.pixelSize: 18
            color: "#666666"
            x: 283
            y: 210
        }

        Image{
            id: saveAPPButtonSave
            source: "qrc:/images/popupSave/save.png"
            x: 400
            y: 234
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    saveAPPButtonSave.scale = 1.1
                }
                onReleased: {
                    saveAPPButtonSave.scale = 1
                    typePopup = "saveApp"
                }
            }
        }
        Image{
            id: exportPDFButtonSave
            source: "qrc:/images/popupSave/export.png"
            x: 400
            y: 299
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    exportPDFButtonSave.scale = 1.1
                }
                onReleased: {
                    exportPDFButtonSave.scale = 1
                    typePopup = "savePDF"
                }
            }
        }
        Image{
            id: cancelButtonSave
            source: "qrc:/images/popupSave/botonCancel.png"
            x: 400
            y: 365
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    cancelButtonSave.scale = 1.1
                }
                onReleased: {
                    cancelButtonSave.scale = 1
                    closePopup()
                }
            }
        }

    }

    Item{
        //Popup de guardar partitura
        id: savePDF
        visible: typePopup === "savePDF"
        Image {
            id: bgSavePDF
            source: "qrc:/images/popupSavePDF/bgSavePDF.png"
        }
        Text{
            id: textSavePDF
            text: "Elige un nombre para tu creación"
            font.family: gothamBook.name
            font.pixelSize: 18
            color: "#666666"
            x: 354
            y: 210
        }
        Image{
            id: namePDF
            source: "qrc:/images/popupSavePDF/nameSpace.png"
            x: 288
            y: 269
        }

        TextArea {
            id: fieldText
            x: 390
            y: 282
            activeFocusOnPress: true
            width: 308
            height: 60
            font.pixelSize: 18
            font.family: gothamLight.name
            color: "#666666"
        }

        Image {
            id: buttonBackSavePDF
            source: "qrc:/images/popupSavePDF/backButton.png"
            x: 263
            y: 396
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    buttonBackSavePDF.scale = 1.1
                }
                onReleased: {
                    buttonBackSavePDF.scale = 1
                    typePopup = "save"
                }
            }
        }

        Image {
            id: buttonSavePDF
            source: "qrc:/images/popupSavePDF/saveButton.png"
            x: 555
            y: 396
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    buttonSavePDF.scale = 1.1
                }
                onReleased: {
                    buttonSavePDF.scale = 1
                    savePDFSignal(fieldText.text)
                    closePopup()
                }
            }
        }
    }

    Item{
        id: saveApp
        visible: typePopup === "saveApp"
        Image {
            id: bgSaveAPP
            source: "qrc:/images/popupSaveApp/bgSaveApp.png"
            x:0
            y:-5
        }
        Image {
            id: buttonBackSaveApp
            source: "qrc:/images/popupSaveApp/backButton.png"
            x: 239
            y: 595
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    buttonBackSaveApp.scale = 1.1
                }
                onReleased: {
                    buttonBackSaveApp.scale = 1
                    typePopup = "save"
                }
            }
        }
        Image {
            id: buttonSaveApp
            source: "qrc:/images/popupSaveApp/saveButton.png"
            x: 567
            y: 595
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    buttonBackSaveApp.scale = 1.1
                }
                onReleased: {
                    buttonBackSaveApp.scale = 1
                    //typePopup = "save"
                }
            }
        }
    }

    Item{
        id: deleteScore
        visible: typePopup === "deleteScore"
        Image{
            id: bgDelete
            source: "qrc:/images/popupDelete/bgPopupDelete.png"
        }
        Text{
            id: textDelete
            text: "¿Estás seguro de que quieres eliminar esta partitura?"
            font.family: gothamBook.name
            font.pixelSize: 18
            color: "#666666"
            //font.bold: true
            anchors.horizontalCenter: bgDelete.horizontalCenter
            y: 210
        }
        Image{
            id: closePopupDelete
            source: "qrc:/images/popupDelete/closeButton.png"
            x: 780
            y: 31
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    closePopupDelete.scale = 1.1
                }
                onReleased: {
                    closePopupDelete.scale = 1
                    closePopup()
                }
            }
        }
        Image{
            id: cancelDeleteButton
            source: "qrc:/images/popupDelete/cancelButton.png"
            x: 238
            y: 278
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    cancelDeleteButton.scale = 1.1
                }
                onReleased: {
                    cancelDeleteButton.scale = 1
                    closePopup()
                }
            }
        }
        Image{
            id: deleteButton
            source: "qrc:/images/popupDelete/deleteButton.png"
            x: 238
            y: 278
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    deleteButton.scale = 1.1
                }
                onReleased: {
                    deleteButton.scale = 1
                    deleteScoreSignal(scoreData.id)
                    closePopup()
                }
            }
        }
    }
}
