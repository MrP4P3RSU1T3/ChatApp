import QtQuick 2.0
Rectangle{
    id: item1
    property int base: 100
    width: base
    height: base*9
    Item{
        id:headerImage
        width: parent.base
        height: parent.base
        RadiusImage{
            base: parent.width-50
            anchors.centerIn: parent
        }
    }

    Rectangle{
        anchors.top: headerImage.bottom
        Column{
            TabItem{
                iconFile: "./images/ic_message_black_24dp_2x.png"
            }
            TabItem{
                iconFile: "./images/ic_account_box_black_24dp_2x.png"
            }
            TabItem{
                iconFile: "./images/ic_email_black_24dp_2x.png"
            }
            TabItem{
                iconFile: "./images/ic_settings_black_24dp_2x.png"
            }
        }


    }

    TabItem{
        anchors.bottom: parent.bottom
        iconFile: "./images/ic_menu_black_24dp_2x.png"
    }

}
