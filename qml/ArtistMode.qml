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
                case "stop":
                    menu.playState = "start"
                    stopRecording()
                    figuresModel.clear()
                    figuresModelUp.clear()
                    bothPartitures = false
                    pulseCount = 1
                    break
                case "infoMusvi":
                    break
            }
        }
    }

//    Item{
//        id: menu
//        Rectangle{
//            id: backgoundMenu
//            color: "#7FFFD4"
//            width: 1029
//            height: 110
//            x: -3
//            y: -3
//            opacity: 1
////            border.color: "#26aaa0"
////            border.width: 2

//            //Botón de ir a inicio
//            Rectangle{
//                id: initButton
//                color: "#e2587b"
//                radius: 5
//                width: 160
//                height: 75
//                anchors.verticalCenter: backgoundMenu.verticalCenter
//                x: 30
//                Text {
//                    text: "INICIO"
//                    font.family: gothamBook.name
//                    font.pixelSize: 28
//                    anchors.horizontalCenter: initButton.horizontalCenter
//                    anchors.verticalCenter: initButton.verticalCenter
//                    color: "#ffffff"
//                }
//                MouseArea{
//                    anchors.fill: initButton
//                    onPressed: {
//                        initButton.color = "#c04354"
//                        initButton.scale = 1.1
//                    }

//                    onReleased: {
//                        initButton.color = "#f0546a"
//                        initButton.scale = 1
//                        goInit()
//                    }
//                }
//                transitions: Transition {
//                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
//                }
//            }


//            //Boton de configuracion
//            Rectangle{
//                id: configButton
//                color: "#e2587b"
//                radius: 5
//                width: 160
//                height: 75
//                anchors.verticalCenter: backgoundMenu.verticalCenter
//                x: 260
//                opacity: 1
//                Text {
//                    text: "CONFIG"
//                    font.family: gothamBook.name
//                    font.pixelSize: 28
//                    anchors.horizontalCenter: configButton.horizontalCenter
//                    anchors.verticalCenter: configButton.verticalCenter
//                    color: "#ffffff"
//                }
//                MouseArea{
//                    anchors.fill: configButton
//                    onPressed: {
//                        configButton.color = "#c04354"
//                        configButton.scale = 1.1
//                    }
//                    onReleased: {
//                        configButton.color = "#f0546a"
//                        configButton.scale = 1
//                        showPopUp("config")
//                    }
//                }
//                transitions: Transition {
//                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
//                }

//            }


//            //Boton de empezar a grabar
//            Rectangle{
//                id: startButton
//                color: "#e2587b"
//                radius: 5
//                width: 160
//                height: 75
//                anchors.verticalCenter: backgoundMenu.verticalCenter
//                x: 490
//                opacity: 1
//                Text {
//                    text: "START"
//                    font.family: gothamBook.name
//                    font.pixelSize: 28
//                    anchors.horizontalCenter: startButton.horizontalCenter
//                    anchors.verticalCenter: startButton.verticalCenter
//                    color: "#ffffff"
//                }
//                MouseArea{
//                    anchors.fill: startButton
//                    onPressed: startButton.scale = 1.1
//                    onReleased: {
//                        startButton.opacity = 0.9
//                        //Mostramos el gif de 3 2 1 y cuando acabe enviamos una señal de empezar
//                        circle.visible = true
//                        //Iniciamos la cuenta atras
//                        tempTimer.start()
//                        startButton.scale = 1
//                    }

//                }
//                transitions: Transition {
//                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
//                }

//            }

//            //Boton de parar de grabar
//            Rectangle{
//                id: stopButton
//                color: "#e2587b"
//                radius: 5
//                width: 160
//                height: 75
//                anchors.verticalCenter: backgoundMenu.verticalCenter
//                x: 720
//                opacity:1
//                Text {
//                    text: "STOP"
//                    font.family: gothamBook.name
//                    font.pixelSize: 28
//                    anchors.horizontalCenter: stopButton.horizontalCenter
//                    anchors.verticalCenter: stopButton.verticalCenter
//                    color: "#ffffff"
//                }
//                MouseArea{
//                    anchors.fill: stopButton
//                    onPressed: {
//                        stopButton.scale = 1.1
//                        stopButton.opacity = 0.9
//                        startButton.opacity = 1
//                    }
//                    onReleased: {
//                        stopButton.scale = 1
//                        stopRecording()
//                        //Importante que al acabar de grabar borremos todas las listas y reseteemos todos los valores que usamos
//                        figuresModel.clear()
//                        figuresModelUp.clear()
//                        bothPartitures = false
//                        pulseCount = 1
//                        //Lanzaremos el popup preguntando la accion que quiere tomar sobre el: guardar, cancelar, guardar en practicar
//                    }

//                }
//                transitions: Transition {
//                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
//                }

//            }

//            //Boton informacion
//            Rectangle{
//                id: infoButton
//                color: "#e2587b"
//                radius: 5
//                width: 60
//                height: 60
//                anchors.verticalCenter: backgoundMenu.verticalCenter
//                x: 950
//                opacity:1
//                Text {
//                    text: "INFO"
//                    font.family: gothamBook.name
//                    font.pixelSize: 18
//                    font.bold: true
//                    anchors.horizontalCenter: infoButton.horizontalCenter
//                    anchors.verticalCenter: infoButton.verticalCenter
//                    color: "#ffffff"
//                }
//                MouseArea{
//                    anchors.fill: infoButton
//                    onPressed: {
//                        infoButton.scale = 1.1
//                        infoButton.opacity = 0.8
//                        infoButton.opacity = 1
//                    }
//                    onReleased: {
//                        infoButton.scale = 1
//                        //Lanzaremos el popup informacion
//                    }

//                }
//                transitions: Transition {
//                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
//                }

//            }

//        }
//    }

    //Circulo con el 3 2 1
    Rectangle {
        id: circle
        visible: false
        x: 350
        y: 250
        width: 300
        height: 300
        z: 10
        color: "#e2587b"
        border.color: "#ef4570"
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

    //Cuenta atras
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
            source: "qrc:/images/partitura-practice.png"
            smooth: true
            x: 20
            y: 230
        }

        ListView{
            id: list
            width: 800
            height: 50
            x: 150
            y: 426
            model: figuresModel
            delegate: figuresDelegate
            orientation: ListView.Horizontal
            interactive: false
            layoutDirection: Qt.RightToLeft
        }

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
}
