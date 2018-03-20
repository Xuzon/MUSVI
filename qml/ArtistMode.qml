import QtQuick 2.0
Item {
    id: artistMode

    //Para el 3 2 1
    property int number : 3

    //Numero de pulsos de un compas
    property int pulsesNumber: 2

    //Contador para saber cuantos pulsos por compas llevamos y mostrar la linea divisoria
    property int pulseCount: 1

    //Esta variable es para saber si ambas lineas estan mostrando informacion o todavia solo la primera
    property bool bothPartitures: false

    //Señal para ir al inicio -> Se recoge desde el main
    signal goInit()
    //Señal para empezar a grabar -> Se recoge en la logica
    signal startRecording()
    //Señal para dejar de grabar -> Se recoge en la logica
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

            //Botón de ir a inicio
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
                    //Se lanza cuando se pulsa el boton
                    onPressed: {
                        initButton.color = "#c04354"
                        //Se cambia la escala para hacer el efecto de pulsado
                        initButton.scale = 1.1
                    }

                    //Se lanza cuando se suelta el botón
                    onReleased: {
                        initButton.color = "#f0546a"
                        //Se cambia la escala para hacer el efecto de pulsado
                        initButton.scale = 1
                        goInit()
                    }
                }
                //Transición que hace que el cambio de escala no se vea brusco
                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                }
            }


            //Boton de configuracion
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


            //Boton de empezar a grabar
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
                        //Iniciamos la cuenta atras
                        tempTimer.start()
                        startButton.scale = 1
                    }

                }
                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                }

            }

            //Boton de parar de grabar
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
                        //Importante que al acabar de grabar borremos todas las listas y reseteemos todos los valores que usamos
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

            //Boton informacion
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

    //Circulo con el 3 2 1
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
        id: figuresModelDown
    }
    //Lista de arriba
    ListModel {
        id: figuresModelUp
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

        //Lista de arriba
        ListView{
            id: listUp
            width: 800
            height: 50
            x: 150
            y: 260
//            onCacheBufferChanged: console.log("cache buffer changed : " + cacheBuffer)
            onContentWidthChanged: console.log("width changed: " + contentWidth)
            //En el modelo añadimos el listado de las figuras que se van a mostrar
            model: figuresModelUp
            //El delegate lleva el formato arriba descrito
            delegate: figuresDelegate
            //Especificamos que la lista es horizontal
            orientation: ListView.Horizontal
            interactive: false
            //Especificamos que la lista va de derecha a izquierda
            layoutDirection: Qt.RightToLeft
        }

        ListView{
            id: listDown
            width: 800
            height: 50
            x: 150
            y: 426
            onContentWidthChanged: {
                //En el caso de la lista de abajo, si resulta que aun no se ha llenado la linea de arriba y que se ha llegado al máximo de espacio en la partitura:
                if(!bothPartitures && contentWidth>800){
                    //Advertimos de que ya tenemos ambas partituras
                    bothPartitures = true
                    //A la lista de arriba le añadimos el ultimo elemento de la de abajo
                    //Se hace con insert así todo lo nuevo se va añadiendo al inicio de la lista, si se quisiera añadir al final de la lista -> usar lista.append(elemento)
                    figuresModelUp.insert(0,figuresModelDown.get(1))
                    //A la lista de abajo se le quita ese ultimo elemento
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
        //A la lista de abajo se le añade la nueva figura
        figuresModelDown.insert(0, {
           "path" : "qrc:/images/" + figure + ".png"
        })
        //Si ya ha cargado el ultimo pulso del compás
        if(pulseCount === pulsesNumber){
            //Se reinicia el valor y se añade la figura de la separación
            pulseCount = 1;
            figuresModelDown.insert(0, {
              "path" : "qrc:/images/bar.png"
            })
        }else{
            pulseCount++;
        }
        //En el caso en el que ya se esté pintando en ambas lineas
        if(bothPartitures){
            //Se inserta arriba y se elimina abajo
            figuresModelUp.insert(0, figuresModelDown.get(listDown.count - 1))
            figuresModelDown.remove(listDown.count - 1)
        }
    }

}
