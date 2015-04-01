import QtQuick 2.0
import QtCPlusPlus.Network 1.0

Item {
    anchors.fill: parent
//    property string myName
    signal onlineNotifyP2P(string destinationIp)

    //处理接收的消息
    function processMessage(message) {
        var userIp = message[0]
        var userName = message[1]
        var chatContent = message[2]

        //检测到是在线用户，显示消息
        for (var index=0; index<id_userList.modelCount; ++index) {
            if (userIp === id_userList.model.get(index).name) {
                console.log("对方发来消息", chatContent)
                return
            }
        }

        //发现新用户，添加到在线列表，并给新用户一个回馈
        id_userList.addUserToOnlineList(message[1], message[0])
        onlineNotifyP2P(userIp)
    }

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
            anchors { verticalCenter: parent.verticalCenter }
            Component.onCompleted: {
                windowState.x = id_containerLeft.x + (windowState.width - id_containerLeft.width)
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
}

