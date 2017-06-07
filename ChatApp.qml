import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    visible: true
    property int base: 100
    width: base*16
    height: base*9
    title: qsTr("Chat App")
    Row{
        LeftMenu{

        }
    }
}
