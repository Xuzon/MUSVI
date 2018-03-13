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
            x: -1
            y: -1
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
                x: 10
                y: 10
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
                    }
                    onReleased: {
                        initButton.color = "#f0546a"
                        goInit()
                    }
                }
            }


            Rectangle{
                id: modeButton
                color: "#f0546a"
                radius: 5
                width: 160
                height: 100
                x: 10
                y: 140
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
                property bool pressed: false

                color: "#f0546a"
                radius: 5
                width: 160
                height: 100
                x: 10
                y: 270
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
                    onClicked: {
                        console.log("onclicked start")
                        startButton.color = "#f0546a"
                        //Mostramos el gif de 3 2 1 y cuando acabe enviamos una señal de empezar
                        circle.visible = true

                        tempTimer.start()
                    }

                }

            }

            Rectangle{
                id: stopButton
                property bool pressed: false

                color: "#f0546a"
                radius: 5
                width: 160
                height: 100
                x: 10
                y: 400
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
                    onClicked: {
                        if(pressed){
                            //Pasa a no pulsado
                            stopButton.color = "#f0546a"
                            stopRecording()
                            //Y será cuando empezaremos a recibir datos
                        }
                    }

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


    Item{
        id:centralZonePlay
        Rectangle{
            id: partitura
            color: "#F8ECC2"
            clip: true
            radius: 3
            x: 240
            y: 100
            height: 300
            width: 720
            Image{
                id:line
                source: "/images/line.png"
                smooth: true
                x: 10
                y: 120
            }
        }
        Item{
            id: dataBottomPlay
            Text{
                id:compasTextPlay
                text: "COMPÁS"
                font.family: "Chalkboard"
                anchors.horizontalCenter: compasPlay.horizontalCenter
                y: 470
                font.pixelSize: 18
                color: "#000000"
            }
            Rectangle{
                id: compasPlay
                x: 240
                y: 500
                height: 40
                width: 100
                radius: 3
                border.color: "#000000"
                Text{
                    id:compasValuePlay
                    text: "2 / 4"
                    font.family: "Chalkboard"
                    anchors.horizontalCenter: compasPlay.horizontalCenter
                    anchors.verticalCenter: compasPlay.verticalCenter
                    font.pixelSize: 18
                    color: "#000000"
                }
            }

            Text{
                id:velTextPlay
                text: "VELOCIDAD"
                font.family: "Chalkboard"
                anchors.horizontalCenter: velPlay.horizontalCenter
                y: 470
                font.pixelSize:18
                color: "#000000"
            }
            Rectangle{
                id: velPlay
                x: 380
                y: 500
                height: 40
                width: 100
                radius: 3
                border.color: "#000000"
                Text{
                    id:velValuePlay
                    text: "70"
                    font.family: "Chalkboard"
                    anchors.horizontalCenter: velPlay.horizontalCenter
                    anchors.verticalCenter: velPlay.verticalCenter
                    font.pixelSize: 18
                    color: "#000000"
                }
            }
        }
    }




}
