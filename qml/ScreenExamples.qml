import QtQuick 2.0

Item {
    id: screenExamples

    property var json0
    property var json1
    property var json2
    property var json3

    signal changeScreen(var typeScreenSelected)
    signal setPracticeId(var id)
    signal popupInfo(var json)

    Item{
        id: lvl0

        Image{
            id: lvl0Image
            source: "qrc:/images/practice/examples/BgLvl0.png"
            x: 75
            y: 147
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
                    select0.scale = 1
                    setPracticeId(0)
                    popupInfo(json0)
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
                    select1.scale = 1
                    setPracticeId(1)
                    popupInfo(json1)

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
                    select2.scale = 1
                    setPracticeId(2)
                    popupInfo(json2)
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

        Image{
            id: select3
            source: "qrc:/images/practice/examples/SelectLvl.png"
            y: 652
            x: 651
            MouseArea{
                anchors.fill: select3
                onPressed: {
                    select3.scale = 1.1
                }
                onReleased: {
                    select3.scale = 1
                    setPracticeId(3)
                    popupInfo(json3)
                }
            }
            transitions: Transition {
                NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
            }
        }
    }
}
