import QtQuick 2.8
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
Page {
    id:root
    property int base: 100
//    width: base*10
    height: base*1

    Pane {
        id: pane
//            width: root.width
//            Layout.fillWidth: true


        TextArea {
            id: messageField
//                Layout.fillWidth: true
            placeholderText: qsTr("Type something to send...")
            wrapMode: TextArea.Wrap

        }
    }
    Row{
        anchors.right: parent.right
        RadiusImage{
            base:root.base/2
            iconSource: "./images/ic_sentiment_very_satisfied_black_24dp_2x.png"
        }
        RadiusImage{
            base:root.base/2
            iconSource: "./images/ic_attach_file_black_24dp_2x.png"
            rotation: 45
        }
        RadiusImage{
            base:root.base/2
            iconSource: "./images/ic_send_black_24dp_2x.png"
        }
    }

}
