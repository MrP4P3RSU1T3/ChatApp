import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Controls.Universal 2.1
import Qt.labs.settings 1.0
import QtQuick.Window 2.2

Window {
    id:root
    visible: true
    property int base: 100
    width: base*16
    height: base*9
    title: qsTr("Chat App")
    Row{
        LeftMenu{}

        Column{
            Search{}
            MiddleItem{}
            MiddleItem{}
            MiddleItem{}
            MiddleItem{}
            MiddleItem{}
            MiddleItem{}
            MiddleItem{}

        }

        Column{
            RightHeader{}
            OtherMessage{}
            MyMessage{}
            OtherMessage{}
            OtherMessage{}
            OtherMessage{}
            RightBottom{}
        }
    }

}
