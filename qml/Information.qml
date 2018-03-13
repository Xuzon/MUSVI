import QtQuick 2.0

Item {
    id: information
//    Connections{
//        target: musvi_controller
//        onInfo:{
//            //jasbciuasbdui
//           // data...
//        }
//    }

    Item{
        id: configuration
        visible: false
        Item{
            Text{
                id:configCompasText
                text: "COMPÁS"
                font.family: "Chalkboard"
                anchors.horizontalCenter: configCompas.horizontalCenter
                y: 40
                font.pixelSize: 28
                color: "#000000"
            }
            Rectangle{
                id: configCompas
                x: 340
                y: 80
                height: 100
                width: 250
                radius: 3
                border.color: "#000000"
                Text{
                    id:configCompasValue
                    text: "2 / 4"
                    font.family: "Chalkboard"
                    anchors.horizontalCenter: configCompas.horizontalCenter
                    anchors.verticalCenter: configCompas.verticalCenter
                    font.pixelSize: 28
                    color: "#000000"
                }
            }
        }

        Item{
            Text{
                id:configVelText
                text: "VELOCIDAD"
                font.family: "Chalkboard"
                anchors.horizontalCenter: configVel.horizontalCenter
                y: 310
                font.pixelSize: 28
                color: "#000000"
            }
            Rectangle{
                id: configVel
                x: 340
                y: 350
                height: 100
                width: 250
                radius: 3
                border.color: "#000000"
                Text{
                    id:configVelValue
                    text: "70"
                    font.family: "Chalkboard"
                    anchors.horizontalCenter: configVel.horizontalCenter
                    anchors.verticalCenter: configVel.verticalCenter
                    font.pixelSize: 28
                    color: "#000000"
                }
            }
        }


        Item{
            id: desplegables
            Image{
                id:desplegable21
                source: "qrc:/images/desplegable.png"
                rotation: 180
                height: 30
                width: 30
                x: 600
                y: 80
            }
            Image{
                id:desplegable2
                source: "qrc:/images/desplegable.png"
                rotation: 180
                height: 30
                width: 30
                x: 600
                y: 350
            }
        }
    }
}
