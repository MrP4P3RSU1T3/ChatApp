import QtQuick 2.5
import QtGraphicalEffects 1.0
// refer to http://blog.csdn.net/zjq456123/article/details/51536148
// another solution http://www.codes51.com/itwd/4104692.html
Item {
    id:root
    property int base: 100
    property string iconSource: "./images/avator.jpg"
    width: base
    height: base
    Image {
        id: imageView
        source: parent.iconSource
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
