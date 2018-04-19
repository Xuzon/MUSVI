import QtQuick 2.0

Item {
    property string type: "init"
    property string screenPractice: "screenSelection"
    property string playState: "start"
    signal pressButton(var type)

    Image{
        id:backgoundMenu
        source: "qrc:/images/menu/bgMenu.png"
        x: 0
        y: 0
    }

    //Init -> type!=init
    Image{
        id: init
        visible: (type !== "init")
        source: "qrc:/images/menu/init.png"
        anchors.verticalCenter: backgoundMenu.verticalCenter
        x: 305
        MouseArea{
            anchors.fill: parent
            onPressed: {
                init.scale = 1.1
            }
            onReleased: {
                init.scale = 1
                pressButton("init")
            }
        }
        transitions: Transition {
            NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
        }
    }

    //Config -> type=artist
    Image{
        id: config
        visible: (type === "artist")
        source: "qrc:/images/menu/botonConfig.png"
        x: 517
        anchors.verticalCenter: backgoundMenu.verticalCenter
        MouseArea{
            anchors.fill: parent
            onPressed: {
                config.scale = 1.1
            }
            onReleased: {
                config.scale = 1
                pressButton("config")
            }
        }
        transitions: Transition {
            NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
        }
    }

    //Information -> type=practice
    Image{
        id: infoScore
        visible: (type === "practice" && screenPractice === "screenScore")
        source: "qrc:/images/menu/botonInfo.png"
        x: 517
        anchors.verticalCenter: backgoundMenu.verticalCenter
        MouseArea{
            anchors.fill: parent
            onPressed: {
                infoScore.scale = 1.1
            }
            onReleased: {
                infoScore.scale = 1
                pressButton("infoScore")
            }
        }
        transitions: Transition {
            NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
        }
    }

    //Back to  -> type=practice
    Image{
        id: backScreen
        visible: (type === "practice" && screenPractice !== "screenScore" && screenPractice !== "screenSelection")
        source: "qrc:/images/menu/backMenu.png"
        x: 517
        anchors.verticalCenter: backgoundMenu.verticalCenter
        MouseArea{
            anchors.fill: parent
            onPressed: {
                backScreen.scale = 1.1
            }
            onReleased: {
                backScreen.scale = 1
                pressButton("backScreen")
            }
        }
        transitions: Transition {
            NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
        }
    }

    //Start -> type=practice or artist
    Image{
        id: start
        visible: (type === "artist" || (type === "practice" && screenPractice === "screenScore")) && playState === "start"
        source: "qrc:/images/menu/start.png"
        x: 720
        anchors.verticalCenter: backgoundMenu.verticalCenter
        MouseArea{
            anchors.fill: parent
            onPressed: {
                start.scale = 1.1
            }
            onReleased: {
                start.scale = 1
                pressButton("start")
            }
        }
        transitions: Transition {
            NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
        }
    }

    //Stop -> type=practice or artist
    Image{
        id: stop
        visible: (type === "artist" || (type === "practice" && screenPractice === "screenScore")) && playState === "stop"
        source: "qrc:/images/menu/stop.png"
        x: 720
        anchors.verticalCenter: backgoundMenu.verticalCenter
        MouseArea{
            anchors.fill: parent
            onPressed: {
                stop.scale = 1.1
            }
            onReleased: {
                stop.scale = 1
                pressButton("stop")
            }
        }
        transitions: Transition {
            NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
        }
    }

    //Config -> siempre
    Image{
        id: info
        source: "qrc:/images/menu/info.png"
        x: 922
        anchors.verticalCenter: backgoundMenu.verticalCenter
        MouseArea{
            anchors.fill: info
            onPressed: {
                info.scale = 1.1
            }
            onReleased: {
                info.scale = 1
                pressButton("infoMusvi")
            }
        }
        transitions: Transition {
            NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
        }
    }

}
