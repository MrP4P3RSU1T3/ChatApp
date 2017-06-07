import QtQuick 2.0

Rectangle {
    property int base: 100
    width: base*4
    height: base*1
    Rectangle{
        property int margin: parent.base/10*3
        id: searchInput
        anchors.topMargin: margin
        anchors.leftMargin: margin
        anchors.rightMargin: margin
        anchors.bottomMargin: margin
        anchors.fill: parent
        radius: 5
        border.color: "black"
        border.width: 1
        TextInput {
            text: qsTr("Text Input")
            anchors.centerIn: parent
        }
    }

}
