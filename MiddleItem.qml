import QtQuick 2.7

Item {
    id:root
    property int base: 100
    width: base*4
    height: base*1
    Rectangle{
        id:headerImage
        width: parent.base
        height: parent.base
        RadiusImage{
            base: 50
            anchors.centerIn: parent
        }
    }

    Text {
        id:timeText
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
        font.pixelSize: 20
        text: qsTr("2 mins")
    }
    Rectangle{
        anchors.left: headerImage.right
        height: parent.height
        Text {
            id: nickname
            anchors.top: parent.top
            anchors.topMargin: 20
            font.pixelSize: 24

            text: qsTr("Peter Cole")
        }
        Text {
            id: lastMsg
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            text: qsTr("long time no see")
        }

    }
}
