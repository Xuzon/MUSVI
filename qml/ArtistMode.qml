import QtQuick 2.0
Item {
    id: artistMode

    property int number : 3

    property int pulsesNumber: 2

    property int pulseCount: 1

    signal goInit()
    signal startRecording()
    signal stopRecording()
    signal showPopUp(var type)

    Menu{
        id: menu
        type: "artist"
        onPressButton: {
            switch(type){
                case "init":
                    goInit()
                    break
                case "config":
                    showPopUp("config")
                    break
                case "infoScore":
                    break
                case "start":
                    circle.visible = true
                    menu.playState = "stop"
                    tempTimer.start()
                    break
                case "stop":
                    menu.playState = "start"
                    stopRecording()
                    break
                case "infoMusvi":
                    break
            }
        }
    }

    //Circulo con el 3 2 1
    Image{
        id: circle
        visible: false
        source: "qrc:/images/artist/count" + number + ".png"
        x: 392
        y: 271
        z: 10
    }

    //Cuenta atras
    Timer{
        id: tempTimer
        interval: 1000
        onTriggered: {
            if(number>1){
                number--;
                tempTimer.start()
            }else{
                circle.visible = false
                //Cuando ya llega al 0 reinicia valores y envia señal de empezar a grabar
                number = 3
                startRecording()
            }
        }
    }


    //Lista de abajo
    ListModel {
        id: figuresModel
    }

    //Este es el formato que va a tener cada uno de los elementos que se van a mostrar en la lista, en este caso imagenes
    Component {
        id: figuresDelegate
        Image{
            source: path
        }
    }



    //Partitura
    Item{
        id: partitura
        Image{
            id:partituraBg
            source: "qrc:/images/artist/score.png"
            x: 0
            y: 185
        }

        ListView{
            id: list
            width: 800
            height: 50
            x: 150
            y: 285
            model: figuresModel
            delegate: figuresDelegate
            orientation: ListView.Horizontal
            interactive: false
            layoutDirection: Qt.RightToLeft
        }

    }


    Image{
        id: settings
        source: "qrc:/images/artist/settings.png"
        x: 43
        y: 615
    }

    Text{
        id: speed
        text: "120"
        font.family: gothamBook.name
        font.pixelSize: 22
        color: "#666666"
        //font.bold: true
        x: 165
        y: 660
    }

    Text{
        id: compas
        text: "2/4"
        font.family: gothamBook.name
        font.pixelSize: 22
        color: "#666666"
        //font.bold: true
        x: 295
        y: 660
    }

    function printFigure(figure){
        figuresModel.insert(0, {
           "path" : "qrc:/images/" + figure + ".png"
        })
        if(pulseCount === pulsesNumber){
            pulseCount = 1;
            figuresModel.insert(0, {
              "path" : "qrc:/images/bar.png"
            })
        }else{
            pulseCount++;
        }
    }

    function clear(){
        figuresModel.clear()
        pulseCount = 1
    }

}
