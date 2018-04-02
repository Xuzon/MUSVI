import QtQuick 2.0

Item {
    //id: practice_bottom
    id: practice
    visible: false

//Para el 3 2 1
property int number : 3
//Numero de pulsos de un compas
property int pulsesNumber: 2

//Contador para saber cuantos pulsos por compas llevamos y mostrar la linea divisoria
property int pulseCount: 1

//Esta variable es para saber si ambas lineas estan mostrando informacion o todavia solo la primera
//property bool bothPartitures: false

    signal goInit()
//Señal para empezar a grabar -> Se recoge en la logica
signal startRecording()
//Señal para dejar de grabar -> Se recoge en la logica
signal stopRecording()


    signal showPopUp(var type)
    signal metronome()

onVisibleChanged: {
    //menu.visible = visible
  //  menuLeft.visible = visible
   // initMenu.visible = visible
    //atras.visible = visible
    //start.visible = visible
    //stop.visible = visible
   // atras.visible = false
   // start.visible = false
   // stop.visible = false
   // examplesButtons.visible= false
    fase_previa.visible = visible
  //  ejem.visible = visible
   // creaciones.visible = visible
  //  ejem_menu.visible = false
   // crea_menu.visible = false

}






Item {
    id: fase_previa
    visible: practice.visible
 /*   signal selectMode(var type)

    Menu{
        id: menu
        type: "init"
    }
*/

    Item{
    id: fasePreviaMenu
    visible: true
    Image {
        id: previaMenu
        source: "qrc:/images/practice/ejer_vs_ejem/Menu.png"
        x: 0
        y: 0
    }
    Image {
        id: previaIni
        source: "qrc:/images/practice/ejer_vs_ejem/BotonInit.png"
        anchors.verticalCenter: previaMenu.verticalCenter
        x: 305
        MouseArea{

            anchors.fill: previaIni
            onPressed: {
                previaIni.scale = 1.1
            }
            onReleased: {
                previaIni.scale = 1
                partitura.visible = false
                goInit()
            }
        }
        //Transición que hace que el cambio de escala no se vea brusco
        transitions: Transition {
            NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
        }
    }
}
    Item{
        id: ejem
        Image{
            id: previaExam
            source: "qrc:/images/practice/ejer_vs_ejem/BgExamples.png"
            x: 77
            y: 175
        }
        Text{
            id: titleExam
            text: "EJEMPLOS"
            font.family: gothamBook.name
            font.pixelSize:28
            //font.bold: true
            anchors.horizontalCenter: previaExam.horizontalCenter
            y: 383
            color: "#666666"
        }
        Text{
            id: textExam
            text: "Aprende a usar MUSVI con varios \nejemplos. ¡Comencemos!"
            font.family: gothamLight.name
            font.pixelSize: 18
            color: "#666666"
            //font.bold: true
            anchors.horizontalCenter: previaExam.horizontalCenter
            y: 440

        }
        Image{
            id: selectExam
            source: "qrc:/images/practice/ejer_vs_ejem/Select.png"
            anchors.horizontalCenter: previaExam.horizontalCenter
            y: 524
            MouseArea{
                anchors.fill: selectExam
                onPressed: {
                    selectExam.scale = 1.1
                }
                onReleased: {
                    selectExam.scale = 1
                 //   selectMode("artist")
                    examplesButtons.visible= true
                    fase_previa.visible = false
                  //  atras.visible = true
                }
            }
            transitions: Transition {
                NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
            }
        }
    }

    Item{
        id: creaciones
        Image{
            id: previaCrea
            source: "qrc:/images/practice/ejer_vs_ejem/BgExCreate.png"
            x: 541
            y: 175
        }
        Text{
            id: titleCrea
            text: "EJERCICIOS \nTUS CREACIONES"
            font.family: gothamBook.name
            font.pixelSize:28
            //font.bold: true
            anchors.horizontalCenter: previaCrea.horizontalCenter
            y: 383
            color: "#666666"
        }
        Text{
            id: textCreaciones
            text: "Accede a tus creaciones o a los \nejercicios de tu profesor"
            font.family: gothamLight.name
            font.pixelSize: 18
            //font.bold: true
            anchors.horizontalCenter: previaCrea.horizontalCenter
            y: 460
            color: "#666666"
        }
        Image{
            id: selectCrea
            source: "qrc:/images/practice/ejer_vs_ejem/Select.png"
            anchors.horizontalCenter: previaCrea.horizontalCenter
            y: 524
            MouseArea{
                anchors.fill: selectCrea
                onPressed: {
                    selectCrea.scale = 1.1
                }
                onReleased: {
                    selectCrea.scale = 1
                  //  selectMode("")
                    fase_previa.visible = false
                    enumeracionCrea.visible = true
                  //  atras.visible = true
                }
            }
            transitions: Transition {
                NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
            }
        }
    }
}







/*
    Item{
        id: menu
        visible: true

        Rectangle{
            id: atras
            visible: false
            color: "#f0546a"
            radius: 5
            width: 160
            height: 75
            anchors.verticalCenter: menuLeft.verticalCenter
            x: 260
            opacity: 1
            Text {
                text: "ATRÁS"
                font.family: "Chalkboard"
                font.pixelSize: 28
                anchors.horizontalCenter: atras.horizontalCenter
                anchors.verticalCenter: atras.verticalCenter
                color: "#ffffff"
            }
            MouseArea{
                anchors.fill: atras

                onPressed: {
                    atras.color = "#c04354"
                    atras.scale = 1.1
                }
                onReleased: {
                    atras.color = "#f0546a"
                    atras.scale = 1
                    atras.visible = false
                    fase_previa.visible = true
                    examplesButtons.visible = false
                    partitura.visible = false
                }
            }
            transitions: Transition {
                NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
            }


        }

    }    */



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





    Item {
        id: examplesButtons
        visible: false
     /*   signal selectMode(var type)

        Menu{
            id: menu
            type: "init"
        }
    */

        Item{
        id: examplesMenu
        Image {
            id: examplesBackMenu
            source: "qrc:/images/practice/ejer_vs_ejem/Menu.png"
            x: 0
            y: 0
        }
        Image {
            id: examplesIniMenu
            source: "qrc:/images/practice/ejer_vs_ejem/BotonInit.png"
            anchors.verticalCenter: examplesBackMenu.verticalCenter
            x: 305
            MouseArea{

                anchors.fill: examplesIniMenu
                onPressed: {
                    examplesIniMenu.scale = 1.1
                }
                onReleased: {
                    examplesIniMenu.scale = 1
                    examplesButtons.visible= false
                    //partitura.visible = false
                    goInit()
                }
            }
            //Transición que hace que el cambio de escala no se vea brusco
            transitions: Transition {
                NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
            }
        }
    }
        Item{
            id: lvl0
            Image{
                id: lvl0Image
                source: "qrc:/images/practice/examples/BgLvl0.png"
                x: 75
                y: 147
            }
            Text{
                id: title0
                text: "NIVEL 0"
                font.family: gothamBook.name
                font.pixelSize: 28                //font.bold: true
                // anchors.horizontalCenter: previaExam.horizontalCenter
                y: 187
                x: 307
                color: "#0a465b"
            }
            Text{
                id: text0
                text: "Breve info sobre\nel nivel 0"
                font.family: gothamLight.name
                font.pixelSize: 22
                color: "#666666"
                //font.bold: true
              //  anchors.horizontalCenter: previaExam.horizontalCenter
                y: 256
                x: 277

            }
            Image{
                id: select0
                source: "qrc:/images/practice/examples/SelectLvl.png"
              //  anchors.horizontalCenter: previaExam.horizontalCenter
                y: 357
                x: 191
                MouseArea{
                    anchors.fill: select0
                    onClicked: {
                        examplesButtons.visible = false
                     //   start.visible = true
                     //   stop.visible = true
                      //  atras.visible = false
                     //   ejem_menu.visible = true
                        partitura.visible = true
                    }
                }
                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                }
            }
        }


        Item{
            id: lvl1
            Image{
                id: lvl1Image
                source: "qrc:/images/practice/examples/BgLvl1.png"
                x: 535
                y: 147
            }
            Text{
                id: title1
                text: "NIVEL 1"
                font.family: gothamBook.name
                font.pixelSize:28                //font.bold: true
                // anchors.horizontalCenter: previaExam.horizontalCenter
                y: 187
                x: 772
                color: "#0a465b"
            }
            Text{
                id: text1
                text: "Breve info sobre\nel nivel 1"
                font.family: gothamLight.name
                font.pixelSize: 22
                color: "#666666"
                //font.bold: true
              //  anchors.horizontalCenter: previaExam.horizontalCenter
                y: 256
                x: 738

            }
            Image{
                id: select1
                source: "qrc:/images/practice/examples/SelectLvl.png"
              //  anchors.horizontalCenter: previaExam.horizontalCenter
                y: 357
                x: 651
                MouseArea{
                    anchors.fill: select1
                    onClicked: {
                        examplesButtons.visible = false
                     //   start.visible = true
                     //   stop.visible = true
                      //  atras.visible = false
                     //   ejem_menu.visible = true
                        partitura.visible = true
                    }
                }
                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                }
            }
        }



        Item{
            id: lvl2
            Image{
                id: lvl2Image
                source: "qrc:/images/practice/examples/BgLvl2.png"
                x: 75
                y:442
            }
            Text{
                id: title2
                text: "NIVEL 2"
                font.family: gothamBook.name
                font.pixelSize: 28                //font.bold: true
                // anchors.horizontalCenter: previaExam.horizontalCenter
                y: 488
                x: 307
                color: "#0a465b"
            }
            Text{
                id: text2
                text: "Breve info sobre\nel nivel 2"
                font.family: gothamLight.name
                font.pixelSize:22
                color: "#666666"
                //font.bold: true
              //  anchors.horizontalCenter: previaExam.horizontalCenter
                y: 557
                x: 277

            }
            Image{
                id: select2
                source: "qrc:/images/practice/examples/SelectLvl.png"
              //  anchors.horizontalCenter: previaExam.horizontalCenter
                y: 654
                x: 191
                MouseArea{
                    anchors.fill: select2
                    onClicked: {
                        examplesButtons.visible = false
                     //   start.visible = true
                     //   stop.visible = true
                      //  atras.visible = false
                     //   ejem_menu.visible = true
                        partitura.visible = true
                    }
                }
                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                }
            }
        }



        Item{
            id: lvl3
            Image{
                id: lvl3Image
                source: "qrc:/images/practice/examples/BgLvl3.png"
                x: 535
                y: 442
            }
            Text{
                id: title3
                text: "NIVEL 3"
                font.family: gothamBook.name
                font.pixelSize: 28                //font.bold: true
                // anchors.horizontalCenter: previaExam.horizontalCenter
                y: 485
                x: 772
                color: "#0a465b"
            }
            Text{
                id: text3
                text: "Breve info sobre\nel nivel 3"
                font.family: gothamLight.name
                font.pixelSize: 22
                color: "#666666"
                //font.bold: true
              //  anchors.horizontalCenter: previaExam.horizontalCenter
                y: 557
                x: 738

            }
            Image{
                id: select3
                source: "qrc:/images/practice/examples/SelectLvl.png"
              //  anchors.horizontalCenter: previaExam.horizontalCenter
                y: 652
                x: 651
                MouseArea{
                    anchors.fill: select3
                    onClicked: {
                        examplesButtons.visible = false
                     //   start.visible = true
                     //   stop.visible = true
                      //  atras.visible = false
                     //   ejem_menu.visible = true
                        partitura.visible = true
                    }
                }
                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                }
            }
        }




    }




    Item {
        id: enumeracionCrea
        visible: false
     /*   signal selectMode(var type)

        Menu{
            id: menu
            type: "init"
        }
    */

        Item{
        id: menuCrea
        visible: true
        Image {
            id: fondoMenuCrea
            source: "qrc:/images/practice/ejer_vs_ejem/Menu.png"
            x: 0
            y: 0
        }
        Image {
            id: creaIni
            source: "qrc:/images/practice/ejer_vs_ejem/BotonInit.png"
            anchors.verticalCenter: fondoMenuCrea.verticalCenter
            x: 305
            MouseArea{

                anchors.fill: creaIni
                onPressed: {
                    creaIni.scale = 1.1
                }
                onReleased: {
                    creaIni.scale = 1
                   // partitura.visible = false
                    enumeracionCrea.visible = false
                    goInit()
                }
            }
            //Transición que hace que el cambio de escala no se vea brusco
            transitions: Transition {
                NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
            }
        }
    }
        Item{
            id: listadoEjercicios
            Image{
                id: primeraLista
                source: "qrc:/images/practice/creations/Primer Elemento Lista Ejercicios.png"
                x: 0
                y: 138
            }
            Image{
                id: primeraListaElem
                source: "qrc:/images/practice/creations/Barra de la Lista.png"
                x: 0

                y: 238
            }
            Image{
                id: deleteListaUno
                source: "qrc:/images/practice/creations/Delete.png"
                x: 1000
                y: 285
            }

        }

        Item{
            id: listadoCreaciones
            Image{
                id: segundaLista
                source: "qrc:/images/practice/creations/Primer Elemento Lsit Creaciones y Ejercicios.png"
                x: 0
                y: 358
            }
            Image{
                id: segundaListaElem
                source: "qrc:/images/practice/creations/Barra de la Lista.png"
                x: 0
                y: 488
            }

            Image{
                id: deleteListaDos
                source: "qrc:/images/practice/creations/Delete.png"
                x: 1000
                y: 525
            }

        }
    }





    Item{
        id: partitura
        visible: false


        Menu{
            id: menu
            type: "practice"
            onPressButton: {
                switch(type){
                    case "init":
                        partitura.visible = false
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
                        stopRecording()
                        break
                    case "infoMusvi":
                        break
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

        //Lista de arriba
        ListView{
            id: listUp
            width: 800
            height: 50
            x: 150
            y: 260
//            onCacheBufferChanged: console.log("cache buffer changed : " + cacheBuffer)
           // onContentWidthChanged: console.log("width changed: " + contentWidth)

            onContentWidthChanged: {
                //En el caso de la lista de abajo, si resulta que aun no se ha llenado la linea de arriba y que se ha llegado al máximo de espacio en la partitura:
                if(contentWidth>800){
                    //Advertimos de que ya tenemos ambas partituras
                   // bothPartitures = true
                    //A la lista de arriba le añadimos el ultimo elemento de la de abajo
                    //Se hace con insert así todo lo nuevo se va añadiendo al inicio de la lista, si se quisiera añadir al final de la lista -> usar lista.append(elemento)
                 //   figuresModelUp.insert(0,figuresModelDown.get(1))
                    //A la lista de abajo se le quita ese ultimo elemento
                    figuresModelDown.remove(listDown.count - 1)
                }
            }


            //En el modelo añadimos el listado de las figuras que se van a mostrar
           // model: figuresModelUp
            model: figuresModelDown
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
                if(contentWidth>800){
                    //Advertimos de que ya tenemos ambas partituras
                   // bothPartitures = true
                    //A la lista de arriba le añadimos el ultimo elemento de la de abajo
                    //Se hace con insert así todo lo nuevo se va añadiendo al inicio de la lista, si se quisiera añadir al final de la lista -> usar lista.append(elemento)
                  //  figuresModelUp.insert(0,figuresModelDown.get(1))
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
