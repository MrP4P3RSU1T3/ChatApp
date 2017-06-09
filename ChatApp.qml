import QtQuick 2.8
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
//import QtQuick.Controls.Universal 2.1
import Qt.labs.settings 1.0
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
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
            width: base*10
            height: base*9
            MouseArea{
                anchors.fill: parent
                onClicked: {
//                    parent.x+=100
                    if(!userInfoShow){
                        parent.width=base*6
                    }else{
                        parent.width=base*10
                    }

                    userInfoShow=!userInfoShow
                }
            }
            Behavior on width {

                NumberAnimation {
                    //This specifies how long the animation takes
                    duration: 600
                    //This selects an easing curve to interpolate with, the default is Easing.Linear
                    easing.type: Easing.InOutCubic
//                    easing.type: Easing.Linear
                }
            }

    }

    }
    UserTimeLine{
        visible: userInfoShow
//        visible: false
        opacity: userInfoShow?1:0
        anchors.right: parent.right
//        anchors.right: userInfoShow?parent.right : undefined
//        anchors.left: !userInfoShow? parent.right : undefined
//        x:userInfoShow?parent.width - this.width:parent.width
        y:!userInfoShow?parent.height:0
//        y:-parent.height
        Behavior on opacity {
            NumberAnimation {
                //This specifies how long the animation takes
                duration: 1000
                //This selects an easing curve to interpolate with, the default is Easing.Linear
//                easing.type: Easing.OutBounce
                easing.type: Easing.Linear
            }
        }
        Behavior on x {

            NumberAnimation {
                //This specifies how long the animation takes
                duration: 600
                //This selects an easing curve to interpolate with, the default is Easing.Linear
                easing.type: Easing.OutElastic
//                    easing.type: Easing.Linear
            }
        }
        Behavior on y {

            SmoothedAnimation {
                //This specifies how long the animation takes
                duration: 800
                //This selects an easing curve to interpolate with, the default is Easing.Linear
                easing.type: Easing.OutBounce
//                    easing.type: Easing.Linear
            }
        }
    }

}
