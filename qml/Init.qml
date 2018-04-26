import QtQuick 2.0

Item {
    id: init
    property bool onInfo : false

    signal selectMode(var type)
    signal showInfoPopup()
    signal showInfoMusvi(var infoShow)

    Menu{
        id: menu
        type: "init"
        onPressButton: {
            if(type === "infoMusvi"){
                if(onInfo){
                    onInfo = false
                    showInfoMusvi(false)
                }else{
                    onInfo = true
                    showInfoMusvi(true)
                }
            }
        }
    }


    Item{
        id: artist
        Image{
            id: artistModeBg
            source: "qrc:/images/init/bgModeArtist.png"
            x: 77
            y: 175
        }

        Image{
            id: selectArtistMode
            source: "qrc:/images/init/selectMode.png"
            anchors.horizontalCenter: artistModeBg.horizontalCenter
            y: 524
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
    }

    Item{
        id: pratice
        Image{
            id: practiceModeBg
            source: "qrc:/images/init/bgModePractice.png"
            x: 541
            y: 175
        }

        Image{
            id: selectPracticeMode
            source: "qrc:/images/init/selectMode.png"
            anchors.horizontalCenter: practiceModeBg.horizontalCenter
            y: 524
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
}
