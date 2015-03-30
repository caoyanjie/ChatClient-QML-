import QtQuick 2.0
import QtCPlusPlus.Network 1.0

Item {
    anchors.fill: parent

    //backgroundImage
    Image {
        source: "Img/Images/background.png"
        anchors.fill: parent
    }

    //WindowTitle
    WindowTitle {
        id: id_windowTitle
        Text {
            id: windowState
            text: "当前无对话"
            color: "white"
            anchors {verticalCenter: parent.verticalCenter}
            Component.onCompleted: {
                windowState.x = id_containerLeft.x + (windowState.width - id_containerLeft.width)
                console.log()
            }
        }
    }

    //WindowContent
    Item {
        id: id_chatCount
        anchors {left: parent.left; right: parent.right; top: id_windowTitle.bottom; bottom: parent.bottom}

        Chat {
            id: id_containerLeft
            width: parent.width - 220
            height: parent.height
            anchors {left: parent.left; top: parent.top; bottom: parent.bottom; leftMargin: 5; topMargin: 5; bottomMargin: 5; rightMargin: 15}
        }

        UserList {
            id: id_userList
            anchors {left: id_containerLeft.right; top: parent.top; bottom: parent.bottom; right: parent.right; leftMargin: 15; topMargin: 5; bottomMargin: 5; rightMargin: 5}
        }
    }

    //Network
    Network {
        id: network
        Component.onCompleted: {
            console.log(network.udpBroadcast())
        }
    }
}

