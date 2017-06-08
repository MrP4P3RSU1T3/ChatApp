import QtQuick 2.0

Rectangle {
    id:root
    property int base: 100
    width: base*5
    height: base*9
    border.color: "black"
    border.width: 1
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
                }
                Row{
                    Text {
                        id: time
                        text: qsTr("Yesterday")
                    }
                    RadiusImage{}
                    RadiusImage{}
                }

            }
        }

    }


}
