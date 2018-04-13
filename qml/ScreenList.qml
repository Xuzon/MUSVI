import QtQuick 2.0

Item {
    id: screenList

    property variant exercises : []
    property variant creations : []

    signal changeScreen(var typeScreenSelected)
    signal showPopup(var typePopup)
    signal deleteById(var id)
    signal setPracticeId(var id)
    signal sendInformationToPopup(var json)

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
                        bgItem.scale = 1
                        var jsonToSend = {
                            "id" : id,
                            "name" : name,
                            "BPM" : BPM,
                            "errors" : errors,
                            "comments" : comments,
                            "compas" : compas,
                            "data" : data
                        }
                        setPracticeId(id)
                        sendInformationToPopup(jsonToSend)
                        showPopup("info")
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
                        showPopup("deleteScore")
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
