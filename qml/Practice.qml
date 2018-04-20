import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: practice

    property var json0 : {}
    property var json1 : {}
    property var json2 : {}
    property var json3 : {}

    property string typeScreen: ""

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

    ListModel {
        id: creationsModel
    }
    ListModel {
        id: exercisesModel
    }

    Connections{
        target: controller
        onDetectPulsePractice:{
            screenScore.printFigure(figure, error)
        }
        onScoreList: {
            scoreList = list
            var listExercises = new Array (0)
            var listCreations = new Array (0)
            scoreList.forEach(function(item){
                switch(item.folder){
                    case "examples":
                        if(item.id === 0) screenExamples.json0 = item
                        if(item.id === 1) screenExamples.json1 = item
                        if(item.id === 2) screenExamples.json2 = item
                        if(item.id === 3) screenExamples.json3 = item
                        break
                    case "creations":
                        listCreations.push(item)
                        break
                    case "exercises":
                        listExercises.push(item)
                        break
                    default:
                        break
                }
            });
            screenList.exercises = listExercises
            screenList.creations = listCreations
            screenList.loadData()
        }
    }

    Menu{
        id: menu
        type: "practice"
        screenPractice: typeScreen
        onPressButton: {
            switch(type){
            case "init":
                screenScore.clear()
                goInit()
                break
                //Info score
            case "infoScore":
                showPopUp("infoScorePractice")
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
                console.log("menu stop")
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
            setPractice(id)
        }
        onPopupInfo: {
            sendInformationToPopup(json)
        }
    }

    ScreenList{
        id: screenList
        visible: typeScreen === "screenList"
        onChangeScreen: typeScreen = typeScreenSelected
        //onShowPopup: showPopUp(typePopup)
        onSignalDeleteById: {
            deleteById(id)
        }
        onSetPracticeId: {
            setPractice(id)
        }
        onPopupInfo: {
            console.log("PRACTICE - SEND TO MAIN INFOPOPUP: " + json.name)
            sendInformationToPopup(json)
        }
    }

    ScreenScorePractice{
        id: screenScore
        visible: typeScreen === "screenScore"
        onSignalStartRecording: startRecording()
        onSignalStopRecording: {
            console.log("STOP!!!")
            menu.playState = "start"
            stopRecording()
        }
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
    function deleteScoreFromList(id){
        screenList.deleteItemList(id);
    }

}
