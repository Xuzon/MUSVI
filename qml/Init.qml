import QtQuick 2.0

Item {
    id: init

    signal selectMode(var type)

    Menu{
        id: menu
        type: "init"
    }

    Image{
        id: artistModeBg
        source: "qrc:/images/init/bgModeArtist.png"
        x: 75
        y: 200
    }
    Text{
        id: titleArtistMode
        text: "MODO ARTISTA"
        font.family: gothamBook.name
        font.pixelSize: 28
        //font.bold: true
        anchors.horizontalCenter: artistModeBg.horizontalCenter
        y: 428
        color: "#0a465b"
    }
    Text{
        id: textArtistMode
        text: "Aqui se añadira todo el texto a mayores"
        font.family: gothamLight.name
        font.pixelSize: 20
        color: "#666666"
        //font.bold: true
        anchors.horizontalCenter: artistModeBg.horizontalCenter
        y: 484
    }
    Image{
        id: selectArtistMode
        source: "qrc:/images/init/selectMode.png"
        anchors.horizontalCenter: artistModeBg.horizontalCenter
        y: 549
        MouseArea{
            anchors.fill: selectArtistMode
            onPressed: {
                selectArtistMode.scale = 1.1
            }
            onReleased: {
                selectArtistMode.scale = 1
                selectMode("artist")
            }
        }
        transitions: Transition {
            NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
        }
    }


    Image{
        id: practiceModeBg
        source: "qrc:/images/init/bgModePractice.png"
        x: 542
        y: 200
    }
    Text{
        id: titlePracticeMode
        text: "MODO ARTISTA"
        font.family: gothamBook.name
        font.pixelSize: 28
        //font.bold: true
        anchors.horizontalCenter: practiceModeBg.horizontalCenter
        y: 428
        color: "#0a465b"
    }
    Text{
        id: textPracticeMode
        text: "Aqui se añadira todo el texto a mayores"
        font.family: gothamLight.name
        font.pixelSize: 20
        //font.bold: true
        anchors.horizontalCenter: practiceModeBg.horizontalCenter
        y: 484
        color: "#666666"
    }
    Image{
        id: selectPracticeMode
        source: "qrc:/images/init/selectMode.png"
        anchors.horizontalCenter: practiceModeBg.horizontalCenter
        y: 549
        MouseArea{
            anchors.fill: selectPracticeMode
            onPressed: {
                selectPracticeMode.scale = 1.1
            }
            onReleased: {
                selectPracticeMode.scale = 1
                selectMode("practice")
            }
        }
        transitions: Transition {
            NumberAnimation { properties: "scale"; duration: 600; easing.type: Easing.InOutQuad }
        }
    }

}
