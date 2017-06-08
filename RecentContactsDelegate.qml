import QtQuick 2.0
import QtQuick.Controls 2.1

ItemDelegate {
    text: ""

    width: root.base * 5
    height: root.base * 1

    Item {
        id: headerImage
        width: root.base
        height: root.base
        RadiusImage {
            base: 50
            iconSource: model.headImageUrl
            anchors.centerIn: parent
        }
    }

    Text {
        id: timeText
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
        font.pixelSize: 20
        text: model.time
    }
    Rectangle {
        anchors.left: headerImage.right
        height: parent.height
        Text {
            id: nickname
            anchors.top: parent.top
            anchors.topMargin: 20
            font.pixelSize: 24

            text: model.nickname
        }
        Text {
            id: lastMsg
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            text: model.lastMsg
        }
    }
}
