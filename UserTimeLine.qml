import QtQuick 2.8
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
Rectangle {
    id:root
    property int base: 100
    width: base*4
    height: base*9
    Column{
        width: parent.width
        Rectangle{
            width: parent.width
            height: root.base*3
            RadiusImage{
                anchors.centerIn: parent
            }
        }
        Text {
            id: nickname
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 24
            text: qsTr("Marie Evans")
        }
        Text {
            id: title
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 16
            text: qsTr("Product Manager")
        }
        Text {
            font.pixelSize: 16
            text: qsTr("Timeline of Marie Evans")
        }
        Rectangle{
            width: parent.width
            height: root.base*2
            Column{
                Text {
                    wrapMode: Text.Wrap
                    text: qsTr("This is my first shot, not perfect but just get started")
                }
                Row{
                    RadiusImage{}
                    RadiusImage{}
                    RadiusImage{}
                    RadiusImage{}
                }
                Pane{
                    width: parent.width
                    Text {
                        id: time
                        anchors.verticalCenter:  parent.verticalCenter
                        anchors.fill: parent
                        text: qsTr("Yesterday")
                    }
                    Row{
                        anchors.right: parent.right
                        spacing: 20
                        RadiusImage{
                            base:25
                            iconSource: "./images/ic_favorite_border_black_24dp_2x.png"
                        }
                        RadiusImage{
                            id: radiusImage
                            base:25
                            iconSource: "./images/ic_chat_bubble_outline_black_24dp_2x.png"
                        }
                    }
                }

            }
        }

    }


}
