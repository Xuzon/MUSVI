import QtQuick 2.0

Item {
    id: screenList

    property variant exercises : []
    property variant creations : []

    signal changeScreen(var typeScreenSelected)
    signal signalDeleteById(var id)
    signal setPracticeId(var id)
    signal popupInfo(var json)

    ListModel {
        id: creationsModel
    }
    ListModel {
        id: exercisesModel
    }

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
            Timer{
                id: simulatePress
                interval: 150
                onTriggered: {
                    bgItem.scale = 1
                    setPracticeId(id)
                    takeInfo(folder, id)
                }
            }
            Image{
                id: bgItem
                source: "qrc:/images/practice/creations/bgItem.png"
                x: -8
                y: 0
                MouseArea{
                    anchors.fill: bgItem
                    onClicked: {
                        bgItem.scale = 1.1
                        simulatePress.start()
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
                        //showPopup("deleteScore")
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


    function loadData(){
        creationsModel.clear()
        exercisesModel.clear()
        exercises.forEach(function(item){
            exercisesModel.append(item)
        })
        creations.forEach(function(item){
            creationsModel.append(item)
        })
    }

    function takeInfo(type, id){
        console.log("TAKE INFO " + id)
        if(type === "creations"){
            creations.forEach(function(item){
                if(item.id === id){
                    console.log("es " + item.name)
                    popupInfo(item)
                }
            })
        }else{
            exercises.forEach(function(item){
                console.log(item.id + " " + id)
                if(item.id === id){
                    console.log("es " + item.name)
                    popupInfo(item)
                }
            })
        }
    }

    function deleteItemList(id){
        for(var i = 0; i < creationsModel.count; ++i){
            if(creationsModel.get(i).id === id){
                console.log("es " + creationsModel.get(i).name)
                creationsModel.remove(creationsModel.get(i))
            }
        }
        for(var j = 0; j < exercisesModel.count; ++j){
            if(exercisesModel.get(j).id === id){
                console.log("es " + exercisesModel.get(j).name)
                exercisesModel.remove(exercisesModel.get(j))
            }
        }

    }
}
