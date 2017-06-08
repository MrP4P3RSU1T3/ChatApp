import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQml 2.2
import QtQml.Models 2.2
import QtQuick.Controls 2.1

Item {
    property int base: 100
    width: base*10
    height: base*1
   RadiusImage{
       id:headerImage
       anchors.top:parent.top
       anchors.left: parent.left
       base: 50
   }
   Message{
       id:msg
       anchors.top:parent.top
       anchors.left: headerImage.right
   }

}
