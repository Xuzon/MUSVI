import QtQuick 2.0

Item {
    id: practice

    property int number : 3
    property int pulsesNumber: 2
    property int pulseCount: 1
    property int speedValue: 120
    property string compasValue: "2/4"

    property string typeScreen: ""

    signal goInit()
    signal startRecording()
    signal stopRecording()
    signal showPopUp(var type)
    signal metronome()

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
    }

    Item{
        id: screenExamples
        visible: typeScreen === "screenExamples"

    }

    Item{
        id: screenList
        visible: typeScreen === "screenList"
    }

    Item{
        id: screenScore
        visible: typeScreen === "screenScore"
    }

}
