import QtQuick 2.8
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
//import QtQuick.Controls.Universal 2.1
import Qt.labs.settings 1.0
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

ApplicationWindow {
    id: root
    property bool userInfoShow: false
    property int base: 100
    width: base * 16
    height: base * 9
    title: qsTr("Chat App")
//    color: "#f9f9f9"
//    flags:  Qt.Window|Qt.FramelessWindowHint
    Row {
        Pane {
            width: base * 1
            height: parent.height

            ColumnLayout {
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
                    height: base*0
                }
                TabItem{text: "\uE0C9"}
                TabItem{text: "\uE851"}
                TabItem{text: "\uE0E1"}
                TabItem{text: "\uE8B8"}
            }

            TabItem{anchors.bottom: parent.bottom;text: "\uE5D2"}

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
                MaterialIcon{
                    anchors.centerIn: parent
                    font.pixelSize: 26
                    text: "\uE145"
                }
            }

            ListView {
                id: listView
                y: root.base
                height: root.height - root.base
                width: root.base * 5
                JSONListModel{
                id:jsonModel1
                source: "./data/data.json"
                query: "$.recentContacts[*]"
            }
                model:jsonModel1.model

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
        property int padding: 50
        x:parent.width - width + 10
        y: !userInfoShow ? parent.height : 0 + padding
        height: parent.height - padding
        visible: userInfoShow
        opacity: userInfoShow ? 1 : 0
//        anchors.right: parent.right

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
