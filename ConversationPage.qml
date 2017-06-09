import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
Item {
    id: root
    property int base: 100
    height: base * 9
    width: base * 10

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: header.height
        anchors.bottomMargin: bottom.height

        //        width: parent.width
        //        width: 500
        ListView {
            id: listView
            Layout.fillWidth: true
            Layout.fillHeight: true
            displayMarginBeginning: 40
            displayMarginEnd: 40
            verticalLayoutDirection: ListView.BottomToTop
            spacing: 12
            model: ConversationModel {
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
                            id:rect
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
        id:header
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
                    id: name
                    font.pixelSize: 24
                    text: qsTr("Marie Evans")

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
            spacing: 30
            Image {
                source: "./images/ic_folder_open_black_24dp_2x.png"
            }
            Image {
                source: "./images/ic_phone_black_24dp_2x.png"
            }
            Image {
                source: "./images/ic_videocam_black_24dp_2x.png"
            }
        }
    }

    Pane {
        id:bottom
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
            RadiusImage {
                base: root.base / 2
                iconSource: "./images/ic_sentiment_very_satisfied_black_24dp_2x.png"
            }
            RadiusImage {
                base: root.base / 2
                iconSource: "./images/ic_attach_file_black_24dp_2x.png"
                rotation: 45
            }
            RadiusImage {
                base: root.base / 2
                iconSource: "./images/ic_send_black_24dp_2x.png"
            }
        }
    }



}
