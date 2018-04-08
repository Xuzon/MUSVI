import QtQuick 2.0

Item {
    id: practice

    property int number : 3
    property int pulsesNumber: 2
    property int pulseCount: 1
    property int speedValue: 120
    property string compasValue: "2/4"
    property var json0 : {}
    property var json1 : {}
    property var json2 : {}
    property var json3 : {}


    property string typeScreen: ""//screenSelection, screenExamples, screenList, screenScore

    property variant dataToShow: []

//    property var scoreList : [
//        {
//            "id" : 0,
//            "name" : "Ejemplo 1",
//            "BPM" : "65",
//            "compas" : "2/4",
//            "comments" : "Este es un ejemplo a 2/4",
//            "errors" : 1,
//            "folder" : "examples",
//            "data" : ["0000", "0011" , "1111", "1011"]
//        },
//        {
//            "id" : 1,
//            "name" : "Ejemplo 2",
//            "BPM" : "80",
//            "compas" : "4/4",
//            "comments" : "Este es un ejemplo a 4/4",
//            "errors" : 2,
//            "folder" : "examples",
//            "data" : ["0000", "0011" , "1111", "1011"]
//        },
//        {
//            "id" : 2,
//            "name" : "Ejemplo 3",
//            "BPM" : "100",
//            "compas" : "3/4",
//            "comments" : "Este es un ejemplo a 2/4",
//            "errors" : 3,
//            "folder" : "examples",
//            "data" : ["0000", "0011" , "1111", "1011"]
//        },
//        {
//            "id" : 3,
//            "name" : "Ejemplo 4",
//            "BPM" : "130",
//            "compas" : "3/8",
//            "comments" : "Este es un ejemplo a 8/8",
//            "errors" : 4,
//            "folder" : "examples",
//            "data" : ["0000", "0011" , "1111", "1011"]
//        },
//        {
//            "id" : 4,
//            "name" : "Ejercicio 1",
//            "BPM" : "65",
//            "compas" : "2/4",
//            "comments" : "Este es un ejemplo a 2/4",
//            "errors" : 2,
//            "folder" : "exercises",
//            "data" : ["0000", "0011" , "1111", "1011"]
//        },
//        {
//            "id" : 5,
//            "name" : "Ejercicio 2",
//            "BPM" : "80",
//            "compas" : "4/4",
//            "comments" : "Este es un ejemplo a 4/4",
//            "errors" : 20,
//            "folder" : "exercises",
//            "data" : ["0000", "0011" , "1111", "1011"]
//        },
//        {
//            "id" : 6,
//            "name" : "Ejercicio 3",
//            "BPM" : "100",
//            "compas" : "3/4",
//            "comments" : "Este es un ejemplo a 2/4",
//            "errors" : 15,
//            "folder" : "exercises",
//            "data" : ["0000", "0011" , "1111", "1011"]
//        },
//        {
//            "id" : 7,
//            "name" : "Creación 1",
//            "BPM" : "65",
//            "compas" : "2/4",
//            "comments" : "Este es un ejemplo a 2/4",
//            "errors" : 17,
//            "folder" : "creations",
//            "data" : ["0000", "0011" , "1111", "1011"]
//        },
//        {
//            "id" : 8,
//            "name" : "Creación 2",
//            "BPM" : "80",
//            "compas" : "4/4",
//            "comments" : "Este es un ejemplo a 4/4",
//            "errors" : 9,
//            "folder" : "creations",
//            "data" : ["0000", "0011" , "1111", "1011"]
//        },
//        {
//            "id" : 9,
//            "name" : "Creación 3",
//            "BPM" : "100",
//            "compas" : "3/4",
//            "comments" : "Este es un ejemplo a 2/4",
//            "errors" : 3,
//            "folder" : "creations",
//            "data" : ["0000", "0011" , "1111", "1011"]
//        }
//    ]
    property var scoreList
    property var examples
    property variant exercises : []
    property variant creations : []

    signal goInit()
    signal startRecording()
    signal stopRecording()
    signal sendInformationToPopup(var scoreData)
    signal showPopUp(var type)
    signal metronome()
    signal setPractice(var id)
    signal deleteById(var id)

    ListModel {
        id: creationsModel
    }
    ListModel {
        id: exercisesModel
    }

    Connections{
        target: controller
        onDetectPulse:{
            practice.printFigure(figure)
        }
        onScoreList: {
            console.log("onScoreList: " + list)
            scoreList = list
            var listExamples = new Array (0)
            var listExercises = new Array (0)
            var listCreations = new Array (0)
            //scoreList.forEach(function(item){
            console.log(scoreList.length)
            for(var i = 0; i<scoreList.length; i++){
                var item = scoreList[i]
                console.log("item id: " + item.id)
                switch(item.folder){
                    case "examples":
                        console.log("examples")
                        if(item.id === 0) json0 = item
                        if(item.id === 1) json1 = item
                        if(item.id === 2) json2 = item
                        if(item.id === 3) json3 = item
                        listExamples.push(item)
                        break
                    case "creations":
                        listCreations.push(item)
                        creationsModel.append({
                           "id" : item.id,
                           "name" : item.name,
                           "BPM" : item.BPM,
                           "errors" : item.errors,
                           "comments" : item.comments,
                           "compas" : item.compas,
                           "data" : item.data
                        })
                        break
                    case "exercises":
                        listExercises.push(item)
                        exercisesModel.append({
                           "id" : item.id,
                           "name" : item.name,
                           "BPM" : item.BPM,
                           "errors" : item.errors,
                           "comments" : item.comments,
                           "compas" : item.compas,
                           "data" : item.data
                        })
                        break
                    default:
                        break
                }
            };
            examples = listExamples
            exercises = listExercises
            creations = listCreations
        }
    }

    Menu{
        id: menu
        type: "practice"
        screenPractice: typeScreen
        onPressButton: {
            switch(type){
            case "init":
                goInit()
                break
                //Info score
            case "infoScore":
                showPopUp("infoScore")
                break
            case "backScreen":
                switch(typeScreen){
                    case "screenSelection":
                        goInit()
                        break
                    case "screenExamples":
                        typeScreen = "screenSelection"
                        break
                    case "screenList":
                        typeScreen = "screenSelection"
                        break
                }

                typeScreen = "screenSelection"
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
                //Info MusviApp
            case "infoMusvi":
                stopRecording()
                showPopUp("infoMusvi")
                break
            }
        }
    }

    Item{
        id: screenSelection
        visible: typeScreen === "screenSelection"
        Item{
            id: examples
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
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: previaExam.horizontalCenter
                y: 383
                color: "#666666"
            }
            Text{
                id: textExam
                text: "Aprende a usar MUSVI con varios\nejemplos. ¡Comencemos!"
                font.family: gothamLight.name
                font.pixelSize: 18
                color: "#666666"
                horizontalAlignment: Text.AlignHCenter
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
                        typeScreen = "screenExamples"
                    }
                }
                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                }
            }
        }

        Item{
            id: creations
            Image{
                id: previaCrea
                source: "qrc:/images/practice/ejer_vs_ejem/BgExCreate.png"
                x: 541
                y: 175
            }
            Text{
                id: titleCrea
                text: "EJERCICIOS\nTUS CREACIONES"
                font.family: gothamBook.name
                font.pixelSize:28
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: previaCrea.horizontalCenter
                y: 383
                color: "#666666"
            }
            Text{
                id: textCreaciones
                text: "Accede a tus creaciones o a los\nejercicios de tu profesor"
                font.family: gothamLight.name
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
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
                        typeScreen = "screenList"
                    }
                }
                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                }
            }
        }

    }

    Item{
        id: screenExamples
        visible: typeScreen === "screenExamples"
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
                font.pixelSize: 28
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
                y: 256
                x: 307

            }
            Image{

                id: select0
                source: "qrc:/images/practice/examples/SelectLvl.png"
                y: 357
                x: 191
                MouseArea{
                    anchors.fill: select0

                    onPressed: {
                        select0.scale = 1.1
                    }
                    onReleased: {
                        setPractice(0)
                        select0.scale = 1
                        dataToShow = json0.data
                        sendInformationToPopup(json0)
                        showPopUp("info")
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
                    onPressed: {
                        select1.scale = 1.1
                    }
                    onReleased: {
                        setPractice(1)
                        select1.scale = 1
                        dataToShow = json1.data
                        sendInformationToPopup(json1)
                        showPopUp("info")
                       // typeScreen = "screenScore"
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
                    onPressed: {
                        select2.scale = 1.1
                    }
                    onReleased: {
                        setPractice(2)
                        select2.scale = 1
                        dataToShow = json2.data
                        sendInformationToPopup(json2)
                        showPopUp("info")
                      //  typeScreen = "screenScore"
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
                    onPressed: {
                        select3.scale = 1.1
                    }
                    onReleased: {
                        setPractice(3)
                        select3.scale = 1
                        dataToShow = json3.data
                        sendInformationToPopup(json3)
                        showPopUp("info")
                      //  typeScreen = "screenScore"
                    }
                }
                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                }
            }
        }


    }

    Item{
        id: screenList
        visible: typeScreen === "screenList"

        Image{
            id: bgListExercisesMenu
            source: "qrc:/images/practice/creations/menuExercises.png"
            x: -10
            y: 120
        }

        Component {
            id: itemList
            Item {
                width: 1024
                height: 63
                Image{
                    id: bgItem
                    source: "qrc:/images/practice/creations/bgItem.png"
                    x: -8
                    y: 0
                    MouseArea{
                        anchors.fill: bgItem
                        onPressed: {
                            bgItem.scale = 1.1
                        }
                        onReleased: {
                           // console.log("info")
                            bgItem.scale = 1
                            var jsonToSend = {
                                "id" : id,
                                "name" : name,
                                "speed" : BPM,
                                "compas" : compas,
                                "comments" : comments
                            }
                            dataToShow = data
                            setPractice(id)
                            sendInformationToPopup(jsonToSend)
                            showPopUp("info")
                        }
                    }
                    transitions: Transition {
                        NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                    }
                }
                Text{
                    id: nameItem
                    text: name
                    font.family: gothamLight.name
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    y: 50
                    x: 200
                    color: "#666666"
                }
                Text{
                    id: speedItem
                    text: BPM
                    font.family: gothamLight.name
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    y: 50
                    x: 544
                    color: "#666666"
                }
                Text{
                    id: compasItem
                    text: compas
                    font.family: gothamLight.name
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    y: 50
                    x: 703
                    color: "#666666"
                }
                Text{
                    id: errorsItem
                    text: errors
                    font.family: gothamLight.name
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    y: 50
                    x: 849
                    color: "#666666"
                }
                Image{
                    id: deleteButton
                    source: "qrc:/images/practice/creations/delete.png"
                    anchors.verticalCenter: bgItem.verticalCenter
                    x: 948
                    MouseArea{
                        anchors.fill: deleteButton
                        onPressed: {
                            deleteButton.scale = 1.1
                        }
                        onReleased: {
                            deleteButton.scale = 1
                            showPopUp("deleteScore")
                            deleteById(id)
                        }
                    }
                    transitions: Transition {
                        NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
                    }
                }
            }
        }

        Rectangle{
            x: 0
            y: 215
            width: 1024
            height: 200
            color: "transparent"
            ListView{
                id: listExercises
                anchors { fill: parent; margins: 2 }
                model: exercisesModel
                delegate: itemList
                orientation: ListView.Vertical
                interactive: true
                focus: true
                clip: true
            }
        }

        Image{
            id: bgListCreationsMenu
            source: "qrc:/images/practice/creations/menuCreations.png"
            x: -10
            y: 429
        }

        Rectangle{
            x: 0
            y: 523
            width: 1024
            height: 200
            color: "transparent"
            ListView{
                id: listCreations
                anchors { fill: parent; margins: 2 }
                model: creationsModel
                delegate: itemList
                orientation: ListView.Vertical
                interactive: true
                focus: true
                clip: true
            }
        }
    }

    Item{
        id: screenScore
        visible: typeScreen === "screenScore"


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
            id: figuresDelegate
            Image{
                source: path
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
            source: "qrc:/images/practice/partiture/partitura-practice.png"
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

   /* function printFigure(figure){
        //A la lista de abajo se le añade la nueva figura
        figuresModelDown.insert(0, {
           "path" : "qrc:/images/figures/" + figure + ".png"
        })
        //Si ya ha cargado el ultimo pulso del compás
        if(pulseCount === pulsesNumber){
            //Se reinicia el valor y se añade la figura de la separación
            pulseCount = 1;
            figuresModelDown.insert(0, {
              "path" : "qrc:/images/figures/bar.png"
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
    }   */



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
    }

    function clear(){
        figuresModelDown.clear()
        pulseCount = 1
    }

}
