import QtQuick 2.8
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
Item {
    id:root
    property alias text: icon.text
    property alias color: icon.color
    property alias font: icon.font
//    implicitWidth: 100
//    implicitHeight: 100
    FontLoader {
        id: webFont;
//        source: "./fontawesome-webfont.ttf"
        source: "./MaterialIcons.ttf"
        onStatusChanged:{
            console.log('FontLoader status changed ',status)
        }
    }
    Text {
        id: icon
        anchors.centerIn: parent
        font.family: webFont.name
        text: qsTr("icon")
    }
}
