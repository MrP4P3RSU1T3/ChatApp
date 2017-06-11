import QtQuick 2.8
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Page {
    id: root
    property int base: 100
    width: base * 4
    Column {
        width: parent.width
        Label {
            visible: index == 0
            font.pixelSize: 16
            text: qsTr("Timeline of Marie Evans")
        }
        Rectangle {
            id: rectangle
            width: parent.width
            height: Math.min(text.height, base)
            Text {
                id: text
                wrapMode: Text.Wrap
                text: content
            }
        }
        GridView {
            id: gridView
            width: parent.width
            height: model.count % 4 == 0 ? base * model.count / 4 : base
                                           * (model.count / 4 + 1) - 50
            model: pics

            delegate: gridViewDelegate
            Component {
                id: gridViewDelegate
                Image {
                    width: 100
                    height: 100
                    source: imageUrl
                }
            }
        }

        Item {
            id: bottom
            width: 400
            height: 25
            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: time
            }
            RowLayout {
                anchors.right: parent.right
                spacing: 20
                MaterialIcon {
                    width: 25
                    height: 25
                    font.pixelSize: 25
                    text: "\uE87E"
                }
                MaterialIcon {
                    width: 25
                    height: 25
                    font.pixelSize: 25
                    text: "\uE0CB"
                }
            }
        }
    }
}
