import QtQuick 2.8
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
//import QtQuick.Controls.Universal 2.1
import Qt.labs.settings 1.0
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

Window {
    id: root
    property bool userInfoShow: false
    property int base: 100
    width: base * 16
    height: base * 9
    title: qsTr("Chat App")
    Row {
        Pane {
            width: base * 1
            height: parent.height

            Column {
                width: parent.width
                Item {
                    id: headerImage
                    width: base
                    height: base
                    RadiusImage {
                        base: root.base / 2
                        anchors.centerIn: parent
                    }
                }
                Item {
                    height: base
                }

                TabItem {
                    iconFile: "./images/ic_message_black_24dp_2x.png"
                }
                TabItem {
                    iconFile: "./images/ic_account_box_black_24dp_2x.png"
                }
                TabItem {
                    iconFile: "./images/ic_email_black_24dp_2x.png"
                }
                TabItem {
                    iconFile: "./images/ic_settings_black_24dp_2x.png"
                }
            }

            TabItem {
                anchors.bottom: parent.bottom
                iconFile: "./images/ic_menu_black_24dp_2x.png"
            }
        }
        Pane {
            width: base * 5
            height: root.height

            Rectangle {
                id: search
                width: base * 4
                height: base * 1
                Rectangle {
                    id: searchInput
                    width: parent.width - base
                    height: base / 2
                    anchors.centerIn: parent
                    radius: 5
                    border.color: "black"
                    border.width: 1
                }
                TextInput {
                    text: qsTr("Text Input")
                    anchors.centerIn: parent
                }
            }
            Pane {
                width: base
                height: base
                anchors.left: search.right
                Rectangle {
                    width: base / 2
                    height: base / 2
                    anchors.centerIn: parent
                    radius: 5
                    border.color: "black"
                    border.width: 1
                }
                Label {
                    text: "+"
                    font.pixelSize: 26
                    anchors.centerIn: parent
                }
            }

            ListView {
                id: listView
                y: root.base
                height: root.height - root.base
                width: root.base * 5
                model: RecentContactsModel {
                }
                delegate: RecentContactsDelegate {
                }
                ScrollBar.vertical: ScrollBar {
                }
            }
        }
        ConversationPage {
            id:conversationPage
            width: base * 10
            height: base * 9
            //            MouseArea {
            //                anchors.fill: parent
            //                onClicked: {
            //                    //                    parent.x+=100
            //                    if (!userInfoShow) {
            //                        parent.width = base * 6
            //                    } else {
            //                        parent.width = base * 10
            //                    }

            //                    userInfoShow = !userInfoShow
            //                }
            //            }
            onNicknameClicked: {
                if (!userInfoShow) {
                    conversationPage.width = base * 6
                } else {
                    conversationPage.width = base * 10
                }

                userInfoShow = !userInfoShow
            }

            Behavior on width {

                NumberAnimation {
                    duration: 600
                    easing.type: Easing.InOutCubic
                }
            }
        }
    }
    UserTimeLine {
        visible: userInfoShow
        opacity: userInfoShow ? 1 : 0
        anchors.right: parent.right
        y: !userInfoShow ? parent.height : 0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
                easing.type: Easing.Linear
            }
        }
        Behavior on x {

            NumberAnimation {
                duration: 600
                easing.type: Easing.OutElastic
            }
        }
        Behavior on y {

            SmoothedAnimation {
                duration: 800
                easing.type: Easing.OutBounce
            }
        }
    }
    Component.onCompleted: console.log("Completed Running!")
    Component.onDestruction: console.log("Destruction Beginning!")
}
