import QtQuick 2.5
import QtGraphicalEffects 1.0

Item {
    property int base: 100
    width: base
    height: base
    Image {
        id: imageView
        source: "./images/此图装逼用.jpg"
        sourceSize: Qt.size(parent.width, parent.height)
        visible: false
    }
    Rectangle{
        id: mask
        anchors.fill: parent
        radius: parent.base/2
        visible: true
    }
    OpacityMask {
        anchors.fill: parent
        source: imageView
        maskSource: mask
    }
}
