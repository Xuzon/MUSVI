import QtQuick 2.0
import Qt.labs.platform 1.0

Item{
    id: popUp

    property string typePopup; //config, info, save, save_PDF, save_app
    property string title;


    Item{
        //Popup de configuración
        //  - Velocity : velocidades a elegir o escritas (int)
        //  - Compas : compases a elegir (string)
        id: config
        visible: typePopup === "config"

        Rectangle{
            id: spacePopup
            x: 100
            y: -3
            width: 924
            height: 776
            color:"#ffffff"
            border.color: "#000000"
            border.width: 2
            radius: 5
            Rectangle{
                id: saveAs
                x: 100
                y: 50
                color: "lightblue"
                height: 30
                width: 100
                Text {
                    id: textSaveAs
                    text: "SAVE AS"
                    anchors.horizontalCenter: saveAs.horizontalCenter
                    anchors.verticalCenter: saveAs.verticalCenter
                    color: "#000000"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        folderDialog.open()
                    }
                }
            }
            FolderDialog {
                id: folderDialog
                //currentFolder: viewer.folder
                folder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
                acceptLabel: "Guardar"
                //options: FolderDialog.ShowDirsOnly
            }


        }
    }

    Item{
        //Popup de información
        //  Ver como poder generar un cuadro de texto 'html por ejemplo', que tenga la propiedad de deslizar hacia abajo
        id: info
        visible: typePopup === "info"
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
        visible: typePopup === "save"
    }

    Item{
        //Popup de guardar partitura en PDF
        //  -
        id: save_path
        visible: typePopup === "save_PDF"
    }

    Item{
        //Popup de guardar partitura en ejercicios o tus creaciones
        id: save_ex
        visible: typePopup === "save_app"
    }

}
