import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtMultimedia 5.8


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
    signal signalStopRecording()

    SoundEffect{
        id: beat
        volume: 1
        source: "qrc:/sounds/beat.wav"
    }

    Image{
        id: circle
        visible: false
        source: "qrc:/images/artist/count" + number + ".png"
        x: 392
        y: 251
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
                    color: error? "#ff0000" : "transparent"
                }
            }

        }

    }

    Component {
        id: figuresDelegate
        Item{
            width: imageFigure.width + clausureL.width + clausureR.width
            height: imageFigure.height
            y: 18
            Image{
                id: clausureL
                source: "qrc:/images/practice/barLeft.png"
                visible: selected
                x :0
            }
            Image{
                id: imageFigure
                source: path
                x : clausureL.width
            }
            Image{
                id: clausureR
                visible: selected
                x : clausureL.width  + imageFigure.width
                source: "qrc:/images/practice/barRight.png"
            }
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
            x: -15
            y: 137
        }
        Image{
            id:compasImageUp
            source: "qrc:/images/compas/" + compasValue.split("/").join("-") + ".png"
            x: 29
            anchors.verticalCenter: partituraBgUp.verticalCenter
        }
        Rectangle{
            width: 935
            height: 200
            x: 80
            y: 147
            color: "transparent"
            ListView{
                id: listUp
                clip: true
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                model: figuresModelUp
                delegate: figuresDelegate
                orientation: ListView.Horizontal
                interactive: true
//                remove: Transition {
//                    NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 400 }
//                    NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 400 }
//                }
                displaced: Transition {
                    NumberAnimation { properties: "x,y"; duration: 400; easing.type: Easing.OutInCirc }
                }
            }
        }

    }

    Item{
        id: partituraDown
        Image{
            id:partituraBgDown
            source: "qrc:/images/artist/scorePractice.png"
            smooth: true
            x: -15
            y: 389
        }
        Image{
            id:compasImageDown
            source: "qrc:/images/compas/" + compasValue.split("/").join("-") + ".png"
            x: 29
            anchors.verticalCenter: partituraBgDown.verticalCenter
        }
        Rectangle{
            width: 935
            height: 200
            x: 80
            y: 419
            color: "transparent"
            ListView{
                id: listDown
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                model: figuresModelDown
                delegate: figuresDelegateDown
                orientation: ListView.Horizontal
                interactive: true
                clip: true
                layoutDirection: Qt.RightToLeft
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
            y: 640
        }

        Text{
            id: speed
            text: speedValue
            font.family: gothamBook.name
            font.pixelSize: 22
            color: "#666666"
            //font.bold: true
            x: 165
            y: 683
        }

        Text{
            id: compas
            text: compasValue
            font.family: gothamBook.name
            font.pixelSize: 22
            color: "#666666"
            //font.bold: true
            x: 295
            y: 683
        }
    }


    function printFigure(figure, hasError){
        beat.stop()
        beat.play()
        newCount++

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
        if (newCount > 1 && figuresModelUp.count>0){
            figuresModelUp.remove(0);
            if(figuresModelUp.get(0).bar){
                figuresModelUp.remove(0);
            }
            changeSelected()
        }else{
            if(figuresModelUp.count === 0){
                console.log("figures 0")
                signalStopRecording()
            }else{
                changeSelected()
            }
        }
    }

    function loadData(){
        dataArray = scoreData.data
        figuresModelUp.clear()
        figuresModelDown.clear()
        var dataLength = dataArray.length -1
        for (var m = 0; m < dataLength; m++){
            if(m === 0){
                console.log("Marcada")
                figuresModelUp.append({
                  "path" : "qrc:/images/figures/" + dataArray[m] + ".png",
                  "selected" : true,
                  "bar" : false
                })
            }else{
                console.log("Figure")
                figuresModelUp.append({
                  "path" : "qrc:/images/figures/" + dataArray[m] + ".png",
                  "selected" : false,
                  "bar" : false
                })
            }
            if(pulseCountUp === pulsesNumber){
                pulseCountUp = 1;
                console.log("Bar")
                figuresModelUp.append({
                   "path" : "qrc:/images/figures/bar.png",
                   "selected" : false,
                   "bar" : true
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

    function changeSelected(){
        for (var i=0; i < figuresModelUp.count; i++){
            figuresModelUp.get(i).selected = false
        }
        if(figuresModelUp.get(0).bar){
            console.log("0 -> BAR")
            figuresModelUp.get(1).selected = true
        }else{
            console.log("0 -> NO BAR")
            figuresModelUp.get(0).selected = true
        }
    }
}
