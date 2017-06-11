import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Item {
    id: root
    property int base: 100
    height: base * 9
    width: base * 10
    signal nicknameClicked
    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: header.height
        anchors.bottomMargin: bottom.height
        ListView {
            id: listView
            Layout.fillWidth: true
            Layout.fillHeight: true
            displayMarginBeginning: 40
            displayMarginEnd: 40
            verticalLayoutDirection: ListView.BottomToTop
            spacing: 12
//            model: ConversationModel {
//            }
            model:jsonListModel.model
            JSONListModel{
                id:jsonListModel
                source: "./data.json"
                query: "$.conversations[*]"
            }

            delegate: Column {
                id: delegate
                anchors.right: sentByMe ? parent.right : undefined
                spacing: 6

                readonly property bool sentByMe: model.recipient !== "Me"

                Row {
                    id: messageRow
                    spacing: 6
                    anchors.right: sentByMe ? parent.right : undefined
                    rightPadding: 24

                    RadiusImage {
                        id: avatar
                        base: 50
                        iconSource: model.headImageUrl
                        visible: !sentByMe
                    }
                    ColumnLayout {
                        Rectangle {
                            id: rect
                            width: Math.min(
                                       messageText.implicitWidth + 24,
                                       listView.width
                                       - (!sentByMe ? avatar.width + messageRow.spacing : 0))
                            height: messageText.implicitHeight + 24
                            color: sentByMe ? "lightgrey" : "#63B8FF"
                            radius: 10

                            Label {
                                id: messageText
                                text: model.msg
                                color: sentByMe ? "black" : "white"
                                anchors.fill: parent
                                anchors.margins: 12
                                wrapMode: Label.Wrap
                            }
                        }
                        Label {
                            id: timestampText
                            text: model.time
                            color: "lightgrey"
                            anchors.right: sentByMe ? parent.right : undefined
                        }
                        DropShadow {
                            anchors.fill: rect
                            horizontalOffset: 5
                            verticalOffset: 5
                            radius: 8.0
                            samples: 16
                            color: "#80000000"
                            source: rect
                        }
                    }

                    RadiusImage {
                        base: 50
                        iconSource: model.headImageUrl
                        visible: sentByMe
                    }
                }
            }

            ScrollBar.vertical: ScrollBar {
            }
        }
    }

    Pane {
        id: header
        width: parent.width
        height: base * 1
        ColumnLayout {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 20
            Row {
                spacing: 20
                Text {
                    id: nickname
                    font.pixelSize: 24
                    text: qsTr("Marie Evans")
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            emit: nicknameClicked();
                        }
                    }
                }
                // 小圆点●用Canvas画
                Rectangle {
                }
                Text {
                    id: status
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Typing...")
                }
            }

            Text {
                font.pixelSize: 16
                text: qsTr("Great to hear that Congrats!")
            }
        }
        Row {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
            TabItem{width:70;text: "\uE2C8"}
            TabItem{width:70;text: "\uE0CD"}
            TabItem{width:70;text: "\uE04B"}
        }
    }

    Pane {
        width: parent.width
        height: root.base * 1
        anchors.bottom: parent.bottom

        Pane {
            id: pane
            TextArea {
                id: messageField
                placeholderText: qsTr("Type something to send...")
                wrapMode: TextArea.Wrap
                anchors.fill: parent
            }
        }
        Row {
            anchors.right: parent.right
            TabItem{width:50;height:50;text: "\uE815"}
            TabItem{width:50;height:50;text: "\uE226";rotation: 45}
            TabItem{width:50;height:50;text: "\uE163"}
        }
    }
}
