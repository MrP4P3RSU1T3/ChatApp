import QtQuick 2.0

Rectangle{
    property string iconFile: "./images/ic_sentiment_very_satisfied_black_24dp_2x.png"
    width: 100
    height: 100
    Image {
        id: icon
        anchors.centerIn: parent
        source: parent.iconFile
    }
    MouseArea{
        anchors.fill: parent
        onClicked: console.log('click')
    }
}
