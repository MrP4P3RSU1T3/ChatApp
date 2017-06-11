import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    property int base: 100
    width: base * 4
    height: base * 9
    radius: 10
    DropShadow {
        anchors.fill: rect
        horizontalOffset: -5
        verticalOffset: -5
        radius: 8.0
        samples: 16
        color: "#80000000"
        source: rect
    }
    Rectangle {
        id: rect
        radius: 10
        anchors.fill: parent
    }

    ListView {
        id: listView
        property real contentYCopy: 0
        anchors.top: header.bottom
        width: root.width
        height: root.height - header.height
        JSONListModel {
            id: jsonModel1
            source: "./data.json"
            query: "$.timeline[*]"
        }
        model: jsonModel1.model

        delegate: TimelineDelegate {
        }

        ScrollBar.vertical: ScrollBar {
        }
        onDraggingChanged:  {
            if(contentYCopy > contentY){
                root.state = "you"
            }else{
                root.state = "other"
            }
            contentYCopy = contentY
        }
        onFlickingChanged: {
            if(contentYCopy > contentY){
                root.state = "you"
            }else{
                root.state = "other"
            }
            contentYCopy = contentY
        }
    }

    Rectangle {
        radius: 10
        anchors.fill: header
    }
    ColumnLayout {
        id: header
        width: parent.width

        Rectangle {
            id: headImage
            visible: true
            width: parent.width
            height: root.base * 1.5
            radius: 10
            RadiusImage {
                base: parent.height - 50
                anchors.centerIn: parent
            }
        }
        Label {
            id: nickname
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 24
            text: qsTr("Marie Evans")
        }
        Label {
            id: title
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 16
            text: qsTr("Product Manager")
        }
    }
    Rectangle {
        id: headImageCopy
        visible: false
        x: headImage.x
        y: headImage.y
        width: parent.width
        height: root.base * 1.5
        radius: 10
        RadiusImage {
            base: 50
            anchors.centerIn: parent
        }
    }

    states: [
        State {
            name: "you"
            PropertyChanges {
                target: headImageCopy
                visible: false
                x: headImage.x
                y: headImage.y
                width: parent.width
                height: root.base * 1.5
                radius: 10

            }
            PropertyChanges {
                target: headImage
                visible: true
            }
        },
        State {
            name: "other"
            PropertyChanges {
                target: headImageCopy
                visible: true
                x: 25
                y: 0
                width: header.height
                height: header.height
            }
            PropertyChanges {
                target: headImage
                visible: false
                width:0
                height:0
            }
        }
    ]
    transitions: [
        Transition {

            NumberAnimation {
                properties: "x,y,width,height"
            }
            SmoothedAnimation{
                duration: 1000
                properties: "visible"
            }
        }
    ]
}
