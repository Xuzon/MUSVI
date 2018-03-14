import QtQuick 2.0
Item {
    id: artistMode

    property int number : 3

    signal goInit()
    signal startRecording()
    signal stopRecording()

    Item{
        id: menu

        Rectangle{
            id: backgoundMenu
            color: "#30d5c8"
            width: 200
            height: 800
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
                height: 100
                anchors.horizontalCenter: backgoundMenu.horizontalCenter
                y: 30
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
                id: modeButton
                color: "#f0546a"
                radius: 5
                width: 160
                height: 100
                anchors.horizontalCenter: backgoundMenu.horizontalCenter
                y: 170
                opacity: 0.8
                Text {
                    text: "  MODO\nARTISTA"
                    font.family: "Chalkboard"
                    font.pixelSize: 28
                    anchors.horizontalCenter: modeButton.horizontalCenter
                    anchors.verticalCenter: modeButton.verticalCenter
                    color: "#ffffff"
                }

            }


            Rectangle{
                id: startButton
                color: "#f0546a"
                radius: 5
                width: 160
                height: 100
                anchors.horizontalCenter: backgoundMenu.horizontalCenter
                y: 300
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
                height: 100
                anchors.horizontalCenter: backgoundMenu.horizontalCenter
                y: 430
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
                        stopButton.opacity = 0.8
                        startButton.opacity = 1
                    }
                    onReleased: {
                        stopButton.scale = 1
                        stopRecording()
                        //Lanzaremos el popup preguntando la accion que quiere tomar sobre el: guardar, cancelar, guardar en practicar
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
        id: figuresModel
    }


    Component {
        id: figuresDelegate
        Image{
            source: path
        }
    }


    Item{
        id: partitura
        x: 240
        y: 100
        height: 500
        width: 720
        Rectangle{
            id: backgoundPartitura
            color: "#F8ECC2"
            clip: true
            radius: 3
            anchors.fill: parent
            Image{
                id:lineUp
                source: "/images/line.png"
                smooth: true
                x: 10
                y: 120
            }
            Image{
                id:lineDown
                source: "/images/line.png"
                smooth: true
                x: 10
                y: 300
            }
            ListView{
                id: listaNotas
                width: 590
                height: 50
                x: 130
                y: 200
                onCacheBufferChanged: console.log("cache buffer changed : " + cacheBuffer)
                onContentWidthChanged: console.log("width changed: " + contentWidth)
                model: figuresModel
                delegate: figuresDelegate
                orientation: ListView.Horizontal
                interactive: false
                layoutDirection: Qt.RightToLeft
            }
        }
    }


    function printFigure(figure){
        //console.log("print figure: " + figure)
        figuresModel.append({
                                "path" : "qrc:/images/" + figure + ".png"
                            })
    }

}
