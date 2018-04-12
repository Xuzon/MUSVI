import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: practice

    property var json0 : {}
    property var json1 : {}
    property var json2 : {}
    property var json3 : {}

    property string typeScreen: ""
    onTypeScreenChanged: console.log("ha cambiado screen a : " + typeScreen)

    property variant scoreList : []
    //property var examples

    /* SIGNALS */
    signal goInit()
    signal startRecording()
    signal stopRecording()
    signal sendInformationToPopup(var scoreData)
    signal showPopUp(var typePopup)
    signal metronome()
    signal setPractice(var id)
    signal deleteById(var id)



    Connections{
        target: controller
        onDetectPulsePractice:{
            screenScore.printFigure(figure, error)
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
                screenScore.start321()
                menu.playState = "stop"
                metronome()
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
        onSetPracticeId: {
            console.log("set practice " + id)
            setPractice(id)
        }
        onPopupInfo: {
            sendInformationToPopup(json)
            showPopUp("info")
        }
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
        onSignalStartRecording: startRecording()
    }


    function loadData(json){
        screenScore.scoreData = json
        screenScore.dataArray = json.data
        screenScore.speedValue = json.BPM
        screenScore.compasValue = json.compas
        switch(json.compas){
            case "3/8":
                screenScore.pulsesNumber = 1
                break
            case "6/8":
                screenScore.pulsesNumber = 2
                break
            case "9/8":
                screenScore.pulsesNumber = 3
                break
            case "12/8":
                screenScore.pulsesNumber = 4
                break
            default:
                screenScore.pulsesNumber = json.compas.split("/")[0]
                break
        }
        screenScore.loadData()
    }

}
