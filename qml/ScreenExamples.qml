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
            y: 557
            x: 738

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
