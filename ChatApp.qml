import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    id:root
    visible: true
    property int base: 100
    width: base*16
    height: base*9
    title: qsTr("Chat App")
    LeftMenu{
        id:leftMenu
    }
    MiddleContainer{
        id:middleContainer
        anchors.left: leftMenu.right
    }
}
