import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: screenScore
    signal changeScreen(var typeScreenSelected)


    Image{
        id: circle
        visible: false
        source: "qrc:/images/artist/count" + number + ".png"
        x: 392
        y: 271
        z: 10
    }

    //Lista de abajo
    ListModel {
        id: figuresModelDown
    }
    //Lista de arriba
    ListModel {
        id: figuresModelUp
    }


    //Este es el formato que va a tener cada uno de los elementos que se van a mostrar en la lista, en este caso imagenes
    Component {
        id: figuresDelegateDown
        Item{
            width: imageFigure.width
            height: imageFigure.height
            Image {
                id: imageFigure
                source: path
                x:0
                y:0
                ColorOverlay {
                    anchors.fill: parent
                    source: parent
                    color: existeError? "red" : "transparent"
                }
            }

        }

    }

    Component {
        id: figuresDelegate
        Image{
            source: path
            y: 8
        }
    }

    Timer{
        id: tempTimer
        interval: (60/speedValue)*1000
        onIntervalChanged: console.log(interval)
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

    Image{
        id:partituraBg
        source: "qrc:/images/partitura-practice.png"
        smooth: true
        x: 20
        y: 230
    }

    Item{
        id: partituraUp
        Rectangle{
            width: 950
            height: 200
            x: 70
            y: 260
            color: "transparent"
            border.color: "red"
            ListView{
                id: listUp
                clip: true
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                model: figuresModelUp
                delegate: figuresDelegate
                orientation: ListView.Horizontal
                interactive: false
            }
        }

    }

    Item{
        id: partituraDown
        Rectangle{
            width: 950
            height: 200
            x: 70
            y: 480
            color: "transparent"
            border.color : "red"
            ListView{
                id: listDown
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                onContentWidthChanged: {
                    if(contentWidth>800){
                        figuresModelDown.remove(listDown.count - 1)
                    }
                }
                model: figuresModelDown
                delegate: figuresDelegateDown
                orientation: ListView.Horizontal
                interactive: false
                clip: true
                layoutDirection: Qt.RightToLeft
            }
        }
    }


    function printFigure(figure){
        figuresModelDown.insert(0, {
          "path" : "qrc:/images/figures/" + figure + ".png"
        })
        if(pulseCount === pulsesNumber){
            pulseCount = 1;
            figuresModelDown.insert(0, {
               "path" : "qrc:/images/figures/bar.png"
            })
        }else{
            pulseCount++;
        }
        nuevoCont++
        if (nuevoCont > 1){
            figuresModelUp.remove(0);
            if(pulseCount === pulsesNumber){
                figuresModelUp.remove(0)
            }
        }

    }


    function printFigureArriba(dataEntero){
        figuresModelUp.clear()
        figuresModelDown.clear()
        longitud = dataEntero.length -1
        for (m = 0; m < longitud; m++){
            figuraActual = dataEntero[m]
            figuresModelUp.append({
              "path" : "qrc:/images/figures/" + figuraActual + ".png"
            })
            if(pulseCountArriba === pulsesNumber){
                pulseCountArriba = 1;
                figuresModelUp.append({
                   "path" : "qrc:/images/figures/bar.png"
                })
            }else{
                pulseCountArriba++;
            }
        }
    }



    function clear(){
        figuresModelDown.clear()
        pulseCount = 1
    }
}
