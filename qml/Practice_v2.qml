import QtQuick 2.0

Item {
    id: practice

    property int number : 3
    property int pulsesNumber: 2
    property int pulseCount: 1
    property int pulseCountArriba: 1
    property int speedValue: 120
    property string compasValue: "2/4"
    property var json0 : {}
    property var json1 : {}
    property var json2 : {}
    property var json3 : {}

    property string typeScreen: ""

    property variant dataToShow: []
    property string figuraActual: ""
    property int m: 0
    property int longitud: 0
    property int posicionActual: 0
    property int nuevoCont: 0
    property int existeError: 0

    property variant scoreList : []
    //property var examples

    /* SIGNALS */
    signal goInit()
    signal startRecording()
    signal stopRecording()
    signal sendInformationToPopup(var scoreData)
    signal showPopUp(var type)
    signal metronome()
    signal setPractice(var id)
    signal deleteById(var id)



    Connections{
        target: controller
        onSendPulsePractice:{
            screenScore.printFigure(figure)
        }
        onErrores:{
            screenScore.existeError = hasError
        }
        onScoreList: {
            console.log("onScoreList")
            scoreList = list
            //var listExamples = new Array (0)
            var listExercises = new Array (0)
            var listCreations = new Array (0)
            scoreList.forEach(function(item){
                switch(item.folder){
                    case "examples":
                        console.log("examples")
                        if(item.id === 0) screenExamples.json0 = item
                        if(item.id === 1) screenExamples.json1 = item
                        if(item.id === 2) screenExamples.json2 = item
                        if(item.id === 3) screenExamples.json3 = item
                        //listExamples.push(item)
                        break
                    case "creations":
                        console.log("creations")
                        listCreations.push(item)
                        screenList.creationsModel.append({
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
                        console.log("exercises")
                        listExercises.push(item)
                        screenList.exercisesModel.append({
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
            });
            //examples = listExamples
            screenList.exercises = listExercises
            screenList.creations = listCreations

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

    ScreenSelection{
        id: screenSelection
        visible: typeScreen === "screenSelection"
        onChangeScreen: typeScreen = typeScreenSelected
    }

    ScreenExamples{
        id: screenExamples
        visible: typeScreen === "screenExamples"
        onChangeScreen: typeScreen = typeScreenSelected
        onSetPracticeId: setPractice(id)
        onSendInformationToPopup: sendInformationToPopup(json)
        onShowPopup: showPopUp(typePopup)
    }

    ScreenList{
        id: screenList
        visible: typeScreen === "screenList"
        onChangeScreen: typeScreen = typeScreenSelected
        onShowPopup: showPopUp(typePopup)
        onDeleteById: deleteById(id)
    }

    ScreenScorePractice{
        id: screenScore
        visible: typeScreen === "screenScore"
        onChangeScreen: typeScreen = typeScreenSelected

    }

}
