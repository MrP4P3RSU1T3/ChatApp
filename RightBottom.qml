import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1

Item {
    id:root
    property int base: 100
    width: base*10
    height: base*1

    Row{
        Pane {
            id: pane
            width: 350
            Layout.fillWidth: true

            RowLayout {
                width: parent.width

                TextArea {
                    id: messageField
                    Layout.fillWidth: true
                    placeholderText: qsTr("Type something to send...")
                    wrapMode: TextArea.Wrap
                }
            }
        }
        RadiusImage{
            base:50
        }
        RadiusImage{
            base:50
        }
        RadiusImage{
            base:50
        }
    }
}
