import QtQuick 2.0

Rectangle{
    id:root
    property alias text: icon.text
    width: 100
    height: 100
    MaterialIcon {
        id:icon
//        width: Math.min(parent.width,width)
//        height: Math.min(parent.height,height)
        anchors.centerIn: parent
        font.pixelSize: 36
        color: "grey"
        text: "\uE0C9"
    }
    MouseArea{
        anchors.fill: parent
        onClicked: console.log('click')
    }
}
