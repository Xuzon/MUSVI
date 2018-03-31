import QtQuick 2.0
import Qt.labs.platform 1.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0


Item{
    id: popUp
    z: 10

    property string typePopup //config, info, save, save_PDF, save_App
    property string title

    signal closePopup()
    signal configChanged(var speed, var compas)



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

    //    FolderDialog {
    //        id: folderDialog
    //        folder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
    //    }

    Item{
        //Popup de información
        //  Ver como poder generar un cuadro de texto 'html por ejemplo', que tenga la propiedad de deslizar hacia abajo
        id: info
    }

    Item{
        //Popup de guardar partitura
        //  - Opción guardar partitura en .xml:
        //      - Ver como añadir un buscar ruta en la que guardar el archivo
        //      - Como exportar a music .xml el array de las figuras para poder exportarlo con el programita famoso.
        //      - Pasar los datos a logica
        //  - Opción guardar partitura en la app
        //      - Determinar en donde se van a guardar: ejercicios o tus creaciones
        //      - Pasar datos a logica
        //  - Opción cancelar arriba derecha
        id: save
    }

    Item{
        //Popup de guardar partitura
        //  -
        id: save_path
    }

    Item{
        id: save_ex
    }

}
