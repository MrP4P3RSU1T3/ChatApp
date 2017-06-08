import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQml 2.2
import QtQml.Models 2.2
import QtQuick.Controls 2.1

Item {
    id:root
    property int base: 100
    width: base*10
    height: base*1
    Row{
        anchors.right: parent.right
        Message{
            id:msg
            width: 300
        }
        RadiusImage{
            id:headerImage
            base: 50
        }


    }

}
