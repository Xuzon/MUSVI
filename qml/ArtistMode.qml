import QtQuick 2.0
import QtMultimedia 5.8

Item {
    id: artistMode

    property int number : 3
    property int pulsesNumber: 4
    property int pulseCount: 1
    property int speedValue: 60
    property string compasValue: "4/4"
    property bool finishScorePrint : false

    onCompasValueChanged: clear()
    onSpeedValueChanged: clear()



    signal goInit()
    signal startRecording()
    signal stopRecording()
    signal showPopUp(var type)
    signal metronome()


    SoundEffect{
        id: beat
        volume: 1
        source: "qrc:/sounds/beat.wav"
    }

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
                    metronome()
                    tempTimer.start()
                    break
                case "stop":
                    menu.playState = "start"
                    finishScorePrint = true
                    stopRecording()
                    break
                case "infoMusvi":
                    stopRecording()
                    showPopUp("info")
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
        interval: (60/speedValue)*1000
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
            y: 8
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

        Rectangle{
            width: 950
            height: 200
            x: 70
            y: 285
            color: "transparent"
            ListView{
                id: list
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                model: figuresModel
                delegate: figuresDelegate
                orientation: ListView.Horizontal
                interactive: true
                layoutDirection: Qt.RightToLeft
                clip: true
                add: Transition {
                    NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 400 }
                    NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 400 }
                }
                displaced: Transition {
                    NumberAnimation { properties: "x,y"; duration: 400; easing.type: Easing.OutInCirc }
                }
            }

        }


    }


    Item{
        id: settings
        Image{
            id: settingsBg
            source: "qrc:/images/artist/settings.png"
            x: 43
            y: 615
        }

        Text{
            id: speed
            text: speedValue
            font.family: gothamBook.name
            font.pixelSize: 22
            color: "#666666"
            //font.bold: true
            x: 165
            y: 660
        }

        Text{
            id: compas
            text: compasValue
            font.family: gothamBook.name
            font.pixelSize: 22
            color: "#666666"
            //font.bold: true
            x: 295
            y: 660
        }
    }



    function printFigure(figure){
        beat.stop()
        beat.play()
        figuresModel.insert(0, {
           "path" : "qrc:/images/figures/" + figure + ".png"
        })
        if(pulseCount === pulsesNumber){
            pulseCount = 1;
            figuresModel.insert(0, {
              "path" : "qrc:/images/figures/bar.png"
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
