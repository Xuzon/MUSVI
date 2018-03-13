import QtQuick 2.0

Item {
    id: init

    signal selectMode(var type)


    Text {
        id: title
        x: 400
        y: 25
        text: "MUSVI"
        font.family: "Helvetica"
        font.pixelSize: 72
        color: "#e2587b"
    }


    Rectangle{
        id: logo
        color: "#e2587b"
        radius: 5
        width: 250
        height: 550
        x: 25
        y: 100

        Text {
            text: "LOGO"
            font.family: "Helvetica"
            font.pixelSize: 50
            anchors.horizontalCenter: logo.horizontalCenter
            anchors.verticalCenter: logo.verticalCenter
            color: "#ffffff"
        }
    }
    Rectangle{
        id: logo2
        color: "#e2587b"
        radius: 5
        width: 500
        height: 150
        x: 200
        y: 500
    }


    Rectangle{
        id: artistMode
        visible: true
        color: "#7FFFD4"
        radius: 5
        width: 300
        height: 200
        x: 350
        y: 200
        Text {
            text: "MODO ARTISTA"
            font.family: "Chalkboard"
            font.pixelSize: 28
            anchors.horizontalCenter: artistMode.horizontalCenter
            anchors.verticalCenter: artistMode.verticalCenter
            color: "#000000"
        }
        MouseArea{
            anchors.fill: artistMode
            onPressed: {
                artistMode.color = "#40e0d0"
            }
            onReleased: {
                artistMode.color = "#7FFFD4"
                selectMode("artist")
            }
        }
    }

    Rectangle{
        id: practice
        color: "#7FFFD4"
        radius: 5
        width: 300
        height: 200
        x: 700
        y: 200
        Text {
            text: "MODO PRACTICAR"
            font.family: "Chalkboard"
            font.pixelSize: 28
            anchors.horizontalCenter: practice.horizontalCenter
            anchors.verticalCenter: practice.verticalCenter
            color: "#000000"
        }
        MouseArea{
            anchors.fill: practice
            onPressed: {
                practice.color = "#40e0d0"
            }
            onReleased: {
                practice.color = "#7FFFD4"
                selectMode("practice")
            }
        }
    }

    Rectangle{
        id: info
        color: "#e9a4fb"
        radius: 5
        width: 250
        height: 150
        x: 750
        y: 500
        Text {
            text: "INFO"
            font.family: "Chalkboard"
            font.pixelSize: 28
            anchors.horizontalCenter: info.horizontalCenter
            anchors.verticalCenter: info.verticalCenter
            color: "#000000"
        }
        MouseArea{
            anchors.fill: info
            onPressed: {
                info.color = "#ba83c8"
            }
            onReleased: {
                info.color = "#e9a4fb"
                selectMode("info")
            }
        }

    }



}
