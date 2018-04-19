import QtQuick 2.7
import Qt.labs.platform 1.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0


Item{
    id: popUp
    z: 10

    property string typePopup //config, info, save, save_PDF, save_App, calibrate, deleteScore
    onTypePopupChanged: console.log("Ha cambiado typePopup: " + typePopup)
    property string title
    //Para info y para deleteScore
    property var scoreData
    property int deleteId

    signal closePopup()
    signal configChanged(var speed, var compas)
    signal savePDFSignal(var name)
    signal saveExample(var name, var comments, var folder)

    signal deleteScoreSignal(var id)
    signal changeScreenScore(var json)

    /*************************/
    /* POPUP - CONFIGURACION */
    /*************************/
    Item{
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
            from: 40
            to: 120
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

    /***********************/
    /* POPUP - CALIBRACIÓN */
    /***********************/
    Item{
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
            interval: 5000
            onTriggered: {
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

    /***********************/
    /* POPUP - INFORMACIÓN */
    /***********************/
    Item{
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
        Text{
            id: textNameInfo
            text: scoreData.name
            font.family: gothamThin.name
            font.pixelSize: 18
            color: "#808080"
            //font.bold: true
            x: 344
            y: 239
        }
        Text{
            id: textSpeedInfo
            text: scoreData.BPM
            font.family: gothamThin.name
            font.pixelSize: 18
            color: "#808080"
            //font.bold: true
            x: 344
            y: 314
        }
        Text{
            id: textCompasInfo
            text: scoreData.compas
            font.family: gothamThin.name
            font.pixelSize: 18
            color: "#808080"
            x: 344
            y: 386
        }
        Rectangle{
            id: spaceComments
            color: "transparent"
            x: 344
            y: 471
            width: 385
            height: 161
        }

        Text{
            id: textComentsInfo
            text: scoreData.comments
            font.family: gothamThin.name
            font.pixelSize: 18
            color: "#808080"
            horizontalAlignment: Text.AlignJustify
            anchors.fill: spaceComments
            wrapMode: Text.WordWrap
            //font.bold: true
            x: 344
            y: 471
        }
        Image{
            id: selectInfo
            source: "qrc:/images/practice/ejer_vs_ejem/Select.png"
            x: 400
            y: 644
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    selectInfo.scale = 1.1
                }
                onReleased: {
                    console.log("ENVIAMOS DATOS DE LA PARTITURA")
                    selectInfo.scale = 1
                    changeScreenScore(scoreData)
                }
            }
        }
    }

    /****************************/
    /* POPUP - OPCIONES GUARDAR */
    /****************************/
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

        Image{
            id: saveAPPButtonSave
            source: "qrc:/images/popupSave/save.png"
            x: 552
            y: 286
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
            id: cancelButtonSave
            source: "qrc:/images/popupSave/botonCancel.png"
            x: 257
            y: 286
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

    /*****************************/
    /* POPUP - GUARDAR EN APP OK */
    /*****************************/
    Item{
        //Popup de guardar partitura
        id: saveOk
        visible: typePopup === "saveOk"
        onVisibleChanged: console.log("saveOk visible: " + visible)
        Image {
            id: bgSaveOk
            source: "qrc:/images/popupSave/bgSaveOk.png"
        }
        Image{
            id: closePopupSaveOk
            source: "qrc:/images/popupSave/closePopup.png"
            x: 780
            y: 31
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    closePopupSaveOk.scale = 1.1
                }
                onReleased: {
                    closePopupSaveOk.scale = 1
                    closePopup()
                }
            }
        }

        Image{
            id: cerrarButton
            source: "qrc:/images/popupSave/cerrarButton.png"
            anchors.horizontalCenter: bgSaveOk.horizontalCenter
            y: 286
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    cerrarButton.scale = 1.1
                }
                onReleased: {
                    cerrarButton.scale = 1
                    closePopup()
                }
            }
        }

    }

    /********************************/
    /* POPUP - GUARDAR EN APP ERROR */
    /********************************/
    Item{
        //Popup de guardar partitura
        id: saveError
        visible: typePopup === "saveError"
        Image {
            id: bgSaveError
            source: "qrc:/images/popupSave/bgSaveOk.png"
        }
        Image{
            id: closePopupSaveError
            source: "qrc:/images/popupSave/closePopup.png"
            x: 780
            y: 31
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    closePopupSaveError.scale = 1.1
                }
                onReleased: {
                    closePopupSaveError.scale = 1
                    closePopup()
                }
            }
        }

        Image{
            id: cerrarButtonError
            source: "qrc:/images/popupSave/cerrarButton.png"
            anchors.horizontalCenter: bgSaveError.horizontalCenter
            y: 286
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    cerrarButtonError.scale = 1.1
                }
                onReleased: {
                    cerrarButtonError.scale = 1
                    closePopup()
                }
            }
        }

    }

    /**************************/
    /* POPUP - GUARDAR EN APP */
    /**************************/
    Item{
        id: saveApp
        visible: typePopup === "saveApp"
        Image {
            id: bgSaveAPP
            source: "qrc:/images/popupSaveApp/bgSaveApp.png"
            x:0
            y:-5
        }
        Image{
            id: closePopupSaveApp
            source: "qrc:/images/popupSave/closePopup.png"
            x: 780
            y: 31
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    closePopupSaveApp.scale = 1.1
                }
                onReleased: {
                    closePopupSaveApp.scale = 1
                    closePopup()
                }
            }
        }
        TextField {
            id: nameText
            x: 415
            y: 274
            width: 282
            height: 32
            font.pixelSize: 18
            color: "#808080"
            background: Rectangle{
                anchors.fill: parent
                border.color: "#808080"
                border.width: 1.2
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        nameText.focus = true;
                    }
                }
            }
        }

        TextArea {
            id: commentsText
            x: 415
            y: 336
            width: 282
            height: 141
            font.pixelSize: 18
            color: "#808080"
            wrapMode: TextArea.Wrap
            background: Rectangle{
                anchors.fill: parent
                border.color: "#808080"
                border.width: 1.2
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        commentsText.focus = true;
                    }
                }
            }
        }


        ComboBox {
            id: folderSelector
            model: [ "Ejercicios", "Tus creaciones"]
            x: 415
            y: 510
            font.pixelSize: 18
            height: 32
            width: 282
            background: Rectangle{
                anchors.fill: parent
                border.color: "#808080"
                border.width: 1.2
            }
        }

        Image {
            id: buttonBackSaveApp
            source: "qrc:/images/popupSaveApp/backButton.png"
            x: 239
            y: 650
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
            y: 650
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    buttonSaveApp.scale = 1.1
                }
                onReleased: {

                    buttonSaveApp.scale = 1
                    var name = nameText.text
                    var comments = commentsText.text
                    var folder = (folderSelector.currentText === "Ejercicios") ? "exercises" : "creations"
                    saveExample(name, comments, folder)
                    //closePopup()
                }
            }
        }
    }

    /********************/
    /* POPUP - ELIMINAR */
    /********************/
    Item{
        id: deleteScore
        visible: typePopup === "deleteScore"
        Image{
            id: bgDelete
            source: "qrc:/images/popupDelete/bgPopupDelete.png"
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
            x: 573
            y: 278
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    deleteButton.scale = 1.1
                }
                onReleased: {
                    deleteButton.scale = 1
                    deleteScoreSignal(deleteId)
                    //closePopup()
                }
            }
        }
    }

    /***********************/
    /* POPUP - ELIMINAR-OK */
    /***********************/
    Item{
        id: deleteScoreOk
        visible: typePopup === "deleteScoreOk"
        Image{
            id: bgDeleteOk
            source: "qrc:/images/popupDelete/bgPopupDeleteOk.png"
        }
        Image{
            id: closePopupDeleteOk
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
            id: cancelDeleteButtonOk
            source: "qrc:/images/popupDelete/cerrarButton.png"
            anchors.horizontalCenter: bgDeleteOk.horizontalCenter
            y: 278
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    cancelDeleteButtonOk.scale = 1.1
                }
                onReleased: {
                    cancelDeleteButtonOk.scale = 1
                    closePopup()
                }
            }
        }
    }

    /**************************/
    /* POPUP - ELIMINAR-ERROR */
    /**************************/
    Item{
        id: deleteScoreError
        visible: typePopup === "deleteScoreError"
        Image{
            id: bgDeleteError
            source: "qrc:/images/popupDelete/bgPopupDeleteError.png"
        }
        Image{
            id: closePopupDeleteError
            source: "qrc:/images/popupDelete/closeButton.png"
            x: 780
            y: 31
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    closePopupDeleteError.scale = 1.1
                }
                onReleased: {
                    closePopupDeleteError.scale = 1
                    closePopup()
                }
            }
        }
        Image{
            id: cancelDeleteButtonError
            source: "qrc:/images/popupDelete/cerrarButton.png"
            anchors.horizontalCenter: bgDeleteError.horizontalCenter
            y: 278
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    cancelDeleteButtonError.scale = 1.1
                }
                onReleased: {
                    cancelDeleteButtonError.scale = 1
                    closePopup()
                }
            }
        }
    }

    /**************************/
    /******** DEPRECATED ******/
    /**************************/
    Item{
        id: savePDF
        visible: typePopup === "savePDF"
        Image {
            id: bgSavePDF
            source: "qrc:/images/popupSavePDF/bgSavePDF.png"
        }
        Image{
            id: closePopupSavePDF
            source: "qrc:/images/popupSave/closePopup.png"
            x: 780
            y: 31
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    closePopupSavePDF.scale = 1.1
                }
                onReleased: {
                    closePopupSavePDF.scale = 1
                    closePopup()
                }
            }
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
}
