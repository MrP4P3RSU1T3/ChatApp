import QtQuick 2.0

Rectangle {
    property int base: 100
//    width: base*10
    height: base*1
    Rectangle{
        id: msg
        anchors.left: parent.left
        anchors.top:parent.top
        anchors.topMargin: 10
        anchors.leftMargin: 20
//        height: 100
        width: parent.width
        color: "red"
        radius: 5
        border.color: "black"
        border.width: 1
        Text {
            anchors.fill: parent
//            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 16
            text: qsTr("Hi Star.How is it going:D ")
            wrapMode: Text.WordWrap
        }
    }

    Text {
        id: time
        anchors.left: msg.left
        anchors.top:msg.bottom
        anchors.topMargin: 30
        text: qsTr("Yesterday 10:24 AM")
    }
}
