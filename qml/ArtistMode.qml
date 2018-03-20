import QtQuick 2.0
Item {
    id: artistMode

    property int number : 3

    property int pulsesNumber: 2
    property int pulseCount: 1

    property bool bothPartitures: false

    signal goInit()
    signal startRecording()
    signal stopRecording()


    Item{
        id: menu

        Rectangle{
            id: backgoundMenu
            color: "#30d5c8"
            width: 1029
            height: 110
            x: -3
            y: -3
            opacity: 1
            border.color: "#26aaa0"
            border.width: 2
            radius: 5

            Rectangle{
                id: initButton
                color: "#f0546a"
                radius: 5
                width: 160
                height: 75
                anchors.verticalCenter: backgoundMenu.verticalCenter
                x: 30
                Text {
                    text: "INICIO"
                    font.family: "Chalkboard"
                    font.pixelSize: 28
                    anchors.horizontalCenter: initButton.horizontalCenter
                    anchors.verticalCenter: initButton.verticalCenter
                    color: "#ffffff"
                }
                MouseArea{
                    anchors.fill: initButton
                    onPressed: {
                        initButton.color = "#c04354"
                        initButton.scale = 1.1
                    }
                    onReleased: {
                        initButton.color = "#f0546a"
                        initButton.scale = 1
                        goInit()
                    }
                }
                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                }
            }


            Rectangle{
                id: configButton
                color: "#f0546a"
                radius: 5
                width: 160
                height: 75
                anchors.verticalCenter: backgoundMenu.verticalCenter
                x: 260
                opacity: 1
                Text {
                    text: "CONFIG"
                    font.family: "Chalkboard"
                    font.pixelSize: 28
                    anchors.horizontalCenter: configButton.horizontalCenter
                    anchors.verticalCenter: configButton.verticalCenter
                    color: "#ffffff"
                }
                MouseArea{
                    anchors.fill: configButton
                    onPressed: {
                        configButton.color = "#c04354"
                        configButton.scale = 1.1
                    }
                    onReleased: {
                        configButton.color = "#f0546a"
                        configButton.scale = 1
                    }
                }
                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                }

            }


            Rectangle{
                id: startButton
                color: "#f0546a"
                radius: 5
                width: 160
                height: 75
                anchors.verticalCenter: backgoundMenu.verticalCenter
                x: 490
                opacity: 1
                Text {
                    text: "START"
                    font.family: "Chalkboard"
                    font.pixelSize: 28
                    anchors.horizontalCenter: startButton.horizontalCenter
                    anchors.verticalCenter: startButton.verticalCenter
                    color: "#ffffff"
                }
                MouseArea{
                    anchors.fill: startButton
                    onPressed: startButton.scale = 1.1
                    onReleased: {
                        startButton.opacity = 0.9
                        //Mostramos el gif de 3 2 1 y cuando acabe enviamos una señal de empezar
                        circle.visible = true
                        tempTimer.start()
                        startButton.scale = 1
                    }

                }
                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                }

            }

            Rectangle{
                id: stopButton
                color: "#f0546a"
                radius: 5
                width: 160
                height: 75
                anchors.verticalCenter: backgoundMenu.verticalCenter
                x: 720
                opacity:1
                Text {
                    text: "STOP"
                    font.family: "Chalkboard"
                    font.pixelSize: 28
                    anchors.horizontalCenter: stopButton.horizontalCenter
                    anchors.verticalCenter: stopButton.verticalCenter
                    color: "#ffffff"
                }
                MouseArea{
                    anchors.fill: stopButton
                    onPressed: {
                        stopButton.scale = 1.1
                        stopButton.opacity = 0.9
                        startButton.opacity = 1
                    }
                    onReleased: {
                        stopButton.scale = 1
                        stopRecording()
                        figuresModelDown.clear()
                        figuresModelUp.clear()
                        bothPartitures = false
                        pulseCount = 1
                        //Lanzaremos el popup preguntando la accion que quiere tomar sobre el: guardar, cancelar, guardar en practicar
                    }

                }
                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                }

            }

            Rectangle{
                id: infoButton
                color: "#f0546a"
                radius: 5
                width: 60
                height: 60
                anchors.verticalCenter: backgoundMenu.verticalCenter
                x: 950
                opacity:1
                Text {
                    text: "INFO"
                    font.family: "Chalkboard"
                    font.pixelSize: 24
                    anchors.horizontalCenter: infoButton.horizontalCenter
                    anchors.verticalCenter: infoButton.verticalCenter
                    color: "#ffffff"
                }
                MouseArea{
                    anchors.fill: infoButton
                    onPressed: {
                        infoButton.scale = 1.1
                        infoButton.opacity = 0.8
                        infoButton.opacity = 1
                    }
                    onReleased: {
                        infoButton.scale = 1
                        //Lanzaremos el popup informacion
                    }

                }
                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                }

            }

        }
    }

    Rectangle {
        id: circle
        visible: false
        x: 450
        y: 250
        width: 300
        height: 300
        z: 10
        color: "#f0546a"
        border.color: "#f05460"
        border.width: 1
        radius: 300*0.5
        Text {
            font.family: "Chalkboard"
            font.pixelSize: 50
            anchors.horizontalCenter: circle.horizontalCenter
            anchors.verticalCenter: circle.verticalCenter
            color: "#ffffff"
            text: number
        }
    }

    Timer{
        id: tempTimer
        interval: 1000
        onTriggered: {
            console.log("TRIGGER")
            if(number>1){
                number--;
                tempTimer.start()
            }else{
                circle.visible = false
                number = 3
                startRecording()
            }
        }
    }


    ListModel {
        id: figuresModelDown
    }

    ListModel {
        id: figuresModelUp
    }

    Component {
        id: figuresDelegate
        Image{
            source: path
        }
    }


    Item{
        id: partitura
        Image{
            id:partituraBg
            source: "qrc:/images/partitura-practice.png"
            smooth: true
            x: 20
            y: 230
        }

        ListView{
            id: listUp
            width: 800
            height: 50
            x: 150
            y: 260
//            onCacheBufferChanged: console.log("cache buffer changed : " + cacheBuffer)
            onContentWidthChanged: console.log("width changed: " + contentWidth)
            model: figuresModelUp
            delegate: figuresDelegate
            orientation: ListView.Horizontal
            interactive: false
            layoutDirection: Qt.RightToLeft
        }

        ListView{
            id: listDown
            width: 800
            height: 50
            x: 150
            y: 426
            onContentWidthChanged: {
                if(!bothPartitures && contentWidth>800){
                    bothPartitures = true
                    console.log("no estaban las dos partituras, tamaño es " + listDown.count)
                    figuresModelUp.insert(0,figuresModelDown.get(1))
                    figuresModelDown.remove(listDown.count - 1)
                }
            }
            model: figuresModelDown
            delegate: figuresDelegate
            orientation: ListView.Horizontal
            interactive: false
            layoutDirection: Qt.RightToLeft
        }

    }


    function printFigure(figure){
        //console.log("print figure: " + figure)
        figuresModelDown.insert(0, {
           "path" : "qrc:/images/" + figure + ".png"
        })
        if(pulseCount === 2){
            pulseCount = 1;
            figuresModelDown.insert(0, {
              "path" : "qrc:/images/bar.png"
            })
        }else{
            pulseCount++;
        }
        if(bothPartitures){
            console.log("insertamos: " + figuresModelDown.get(listDown.count - 1))
            figuresModelUp.insert(0, figuresModelDown.get(listDown.count - 1))
            figuresModelDown.remove(listDown.count - 1)
        }
    }

}
