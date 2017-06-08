import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1

Pane {
    id:root
    property int base: 100
    width: base*10
    height: base*1
    Column{
        anchors.left: parent.left
        anchors.top:parent.top
        anchors.leftMargin: 20
        anchors.topMargin: 20
            Row{
                spacing: 20
                    Text {
                        id: name
                        font.pixelSize: 24
                        text: qsTr("Marie Evans")
                    }
                    // 小圆点●用Canvas画
                    Rectangle{

                    }
                    Text {
                        id: status
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("Typing...")
                    }
                }


            Text {
                font.pixelSize: 16
                text: qsTr("Great to hear that Congrats!")
            }
        }
    Row{
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20
        spacing: 30
        Image {
            source: "./images/ic_folder_open_black_24dp_2x.png"
        }
        Image {
            source: "./images/ic_phone_black_24dp_2x.png"
        }
        Image {
            source: "./images/ic_videocam_black_24dp_2x.png"
        }
    }

}
