import QtQuick 2.0
import Qt.labs.platform 1.0


Item{
    id: popUp
    property string typePopup; //config, info, save, save_PDF, save_App
    property string title;

    z: 10
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
    }

    Text{
        //Titulo que va a recibir el popup
        id: titlePopup
    }

    Item{
        //Popup de configuración
        //  - Velocity : velocidades a elegir o escritas (int)
        //  - Compas : compases a elegir (string)
        id: config
        visible: typePopup === "config"
        Rectangle{
            x: 100
            y: 100
            width: 100
            height: 100
            color:"#000000"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    folderDialog.open()
                }
            }
        }

        FolderDialog {
            id: folderDialog
            folder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
        }
    }

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
