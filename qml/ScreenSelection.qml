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
