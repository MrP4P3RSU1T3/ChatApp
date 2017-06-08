import QtQuick 2.8
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
//import QtQuick.Controls.Material 2.1
//import QtQuick.Controls.Universal 2.1
import Qt.labs.settings 1.0
import QtQuick.Window 2.2

Window {
    id:root
    property bool userInfoShow: false
    property int base: 100
    width: base*16
    height: base*9
    title: qsTr("Chat App")
    Row{
        LeftMenu{}

        Rectangle{
            width: root.base*5
            height: root.height
            Search{}
            ListView {
                id: listView
                y:root.base
                height: root.height-root.base
                width: root.base*5
                model: RecentContactsModel{}
                delegate: RecentContactsDelegate{}
                ScrollBar.vertical: ScrollBar {}
            }

        }
        ConversationPage{
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(!userInfoShow){
                        parent.width=base*6
                    }else{
                        parent.width=base*10
                    }

                    userInfoShow=!userInfoShow
                }
            }
        }

    }

    UserTimeLine{
        visible: userInfoShow
        anchors.right: parent.right
        anchors.top: parent.top
    }

}
