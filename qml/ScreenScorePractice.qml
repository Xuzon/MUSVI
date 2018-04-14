import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: screenScore
    width: 1024
    height: 768
    property var scoreData
    property var dataArray
    property int newCount: 0
    property int pulseCountUp: 1
    property int pulseCount: 1
    property int number : 3
    property int pulsesNumber
    property int speedValue
    property string compasValue

    signal signalStartRecording()

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
                    color: error? "red" : "transparent"
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
        onTriggered: {
            if(number>1){
                number--;
                tempTimer.start()
            }else{
                circle.visible = false
                //Cuando ya llega al 0 reinicia valores y envia señal de empezar a grabar
                number = 3
                signalStartRecording()
            }
        }
    }

    Item{
        id: partituraUp
        Image{
            id:partituraBgUp
            source: "qrc:/images/artist/scorePractice.png"
            smooth: true
            x: 0
            y: 167
        }
        Rectangle{
            width: 950
            height: 200
            x: 70
            y: 187
            color: "transparent"
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
        Image{
            id:partituraBgDown
            source: "qrc:/images/artist/scorePractice.png"
            smooth: true
            x: 0
            y: 429
        }
        Rectangle{
            width: 950
            height: 200
            x: 70
            y: 469
            color: "transparent"
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

    Item{
        id: settings
        Image{
            id: settingsBg
            source: "qrc:/images/artist/settings.png"
            x: 43
            y: 680
        }

        Text{
            id: speed
            text: speedValue
            font.family: gothamBook.name
            font.pixelSize: 22
            color: "#666666"
            //font.bold: true
            x: 165
            y: 720
        }

        Text{
            id: compas
            text: compasValue
            font.family: gothamBook.name
            font.pixelSize: 22
            color: "#666666"
            //font.bold: true
            x: 295
            y: 720
        }
    }


    function printFigure(figure, hasError){
        figuresModelDown.insert(0, {
          "path" : "qrc:/images/figures/" + figure + ".png",
          "error" : hasError
        })
        if(pulseCount === pulsesNumber){
            pulseCount = 1;
            figuresModelDown.insert(0, {
               "path" : "qrc:/images/figures/bar.png"
            })
        }else{
            pulseCount++;
        }
        newCount++
        if (newCount > 1){
            figuresModelUp.remove(0);
            if(pulseCount === pulsesNumber){
                figuresModelUp.remove(0)
            }
        }

    }

    function loadData(){
        console.log("LOAD DATA")
        console.log("name: " + scoreData.name)
        dataArray = scoreData.data
        figuresModelUp.clear()
        figuresModelDown.clear()
        var dataLength = dataArray.length -1
        console.log("data "+dataLength)
        for (var m = 0; m < dataLength; m++){
            console.log("M")
            figuresModelUp.append({
              "path" : "qrc:/images/figures/" + dataArray[m] + ".png"
            })
            if(pulseCountUp === pulsesNumber){
                pulseCountUp = 1;
                figuresModelUp.append({
                   "path" : "qrc:/images/figures/bar.png"
                })
            }else{
                pulseCountUp++;
            }
        }
    }

    function clear(){
        figuresModelDown.clear()
        figuresModelUp.clear()
        newCount = 0
        pulseCountUp = 1
        pulseCount = 1
    }

    function start321(){
        circle.visible = true
        tempTimer.start()
    }
}
