import QtQuick 2.0

Item {
    id: practice_bottom
    visible: false
    onVisibleChanged: {
        menu.visible = visible
        menuLeft.visible = visible
        initMenu.visible = visible
        config.visible = visible
        start.visible = visible
        stop.visible = visible
        examplesButtons.visible= visible

    }

    Item{
        id: menu
        visible: true
        Rectangle{
            visible: false
            id: menuLeft
            color: "#30d5c8"
            width: 200
            height: 960
            x: -1
            y: -1
        }
        Rectangle{
            id: initMenu
            visible: false
            color: "#FA8072"
            radius: 5
            width: 160
            height: 100
            x: 20
            y: 30
            Text {
                text: "INICIO"
                font.family: "Chalkboard"
                font.pixelSize: 28
                anchors.horizontalCenter: initMenu.horizontalCenter
                anchors.verticalCenter: initMenu.verticalCenter
                color: "#ffffff"
            }
            MouseArea{
                anchors.fill: initMenu
                onClicked: {
                    menu.visible = false
                    centralZoneInit.visible = true
                    practice_bottom.visible = false

                }
            }
        }
        Rectangle{
            id: config
            visible: false
            color: "#FA8072"
            radius: 5
            width: 160
            height: 100
            x: 20
            y: 160
            Text {
                text: ""
                font.family: "Chalkboard"
                font.pixelSize: 28
                anchors.horizontalCenter: config.horizontalCenter
                anchors.verticalCenter: config.verticalCenter
                color: "#ffffff"
            }

        }


        Rectangle{
            id: start
            visible: false
            //color: "#f8414c"
            color: "#FA8072"
            radius: 5
            width: 160
            height: 100
            x: 20
            y: 290
            Text {
                text: "START"
                font.family: "Chalkboard"
                font.pixelSize: 28
                anchors.horizontalCenter: start.horizontalCenter
                anchors.verticalCenter: start.verticalCenter
                color: "#ffffff"
            }
            MouseArea{

                anchors.fill: start

                onClicked: {
                    stop.color = "#FA8072"
                    start.color = "#f8414c"
                }
            }
        }
        Rectangle{
            id: stop
            visible: false
            color: "#f8414c"
            radius: 5
            width: 160
            height: 100
            x: 20
            y: 420
            Text {
                text: "STOP"
                font.family: "Chalkboard"
                font.pixelSize: 28
                anchors.horizontalCenter: stop.horizontalCenter
                anchors.verticalCenter: stop.verticalCenter
                color: "#ffffff"
            }

            MouseArea{
                anchors.fill: stop;
                onClicked: {
                    stop.color = "#f8414c";
                    start.color = "#FA8072";

                }


            }
        }
    }
    Item{
        id: examplesButtons
        visible: false
        Rectangle{
            id: lvl0
            color: "#f4f9a7"
            radius: 5
            width: 300
            height: 200
            x: 250
            y: 45
            Text {
                text: "NIVEL 0"
                font.family: "Chalkboard"
                font.pixelSize: 28
                anchors.horizontalCenter: lvl0.horizontalCenter
                anchors.verticalCenter: lvl0.verticalCenter
                color: "#134b98"
            }
        }

        Rectangle{
            id: lvl1
            color: "#aef6ba"
            radius: 5
            width: 300
            height: 200
            x: 600
            y: 45
            Text {
                text: "NIVEL 1"
                font.family: "Chalkboard"
                font.pixelSize: 28
                anchors.horizontalCenter: lvl1.horizontalCenter
                anchors.verticalCenter: lvl1.verticalCenter
                color: "#134b98"
            }
        }

        Rectangle{
            id: lvl2
            color: "#9bf0e5"
            radius: 5
            width: 300
            height: 200
            x: 250
            y: 300
            Text {
                text: "NIVEL 2"
                font.family: "Chalkboard"
                font.pixelSize: 28
                anchors.horizontalCenter: lvl2.horizontalCenter
                anchors.verticalCenter: lvl2.verticalCenter
                color: "#134b98"
            }
        }

        Rectangle{
            id: lvl3
            color: "#92dcec"
            radius: 5
            width: 300
            height: 200
            x: 600
            y: 300
            Text {
                text: "NIVEL 3"
                font.family: "Chalkboard"
                font.pixelSize: 28
                anchors.horizontalCenter: lvl3.horizontalCenter
                anchors.verticalCenter: lvl3.verticalCenter
                color: "#134b98"
            }
        }
    }
    Item{
        id:centralZoneExample
        visible: false
        Rectangle{
            id: partituraEx
            color: "#F8ECC2"
            clip: true
            radius: 3
            x: 240
            y: 30
            height: 180
            width: 720
            Image{
                id:partituraExImage
                source: ""
                smooth: true
                x: 10
                y: 60
            }
        }
        Rectangle{
            id: partituraDo
            color: "#F8ECC2"
            radius: 3
            x: 240
            y: 240
            height: 180
            width: 720
            Image{
                id:partituraDoImage
                source: ""
                smooth: true
                x: 10
                y: 60
            }
        }

        Item{
            id: dataBottom
            Text{
                id:compasText
                text: "COMPÁS"
                font.family: "Chalkboard"
                anchors.horizontalCenter: compas.horizontalCenter
                y: 470
                font.pixelSize:18
                color: "#000000"
            }
            Rectangle{
                id: compas
                x: 240
                y: 500
                height: 40
                width: 100
                radius: 3
                border.color: "#000000"
                Text{
                    id:compasValue
                    text: "2 / 4"
                    font.family: "Chalkboard"
                    anchors.horizontalCenter: compas.horizontalCenter
                    anchors.verticalCenter: compas.verticalCenter
                    font.pixelSize: 18
                    color: "#000000"
                }
            }

            Text{
                id:velText
                text: "VELOCIDAD"
                font.family: "Chalkboard"
                anchors.horizontalCenter: vel.horizontalCenter
                y: 470
                font.pixelSize:18
                color: "#000000"
            }
            Rectangle{
                id: vel
                x: 380
                y: 500
                height: 40
                width: 100
                radius: 3
                border.color: "#000000"
                Text{
                    id:velValue
                    text: "70"
                    font.family: "Chalkboard"
                    anchors.horizontalCenter: vel.horizontalCenter
                    anchors.verticalCenter: vel.verticalCenter
                    font.pixelSize: 18
                    color: "#000000"
                }
            }
        }
    }

}
