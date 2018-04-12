import QtQuick 2.0

Item {
    id: screenSelection
    signal changeScreen(var typeScreenSelected)

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
                    changeScreen("screenExamples")
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
                    changeScreen("screenList")
                }
            }
            transitions: Transition {
                NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
            }
        }
    }
}
