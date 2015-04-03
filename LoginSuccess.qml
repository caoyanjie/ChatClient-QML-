import QtQuick 2.0
import QtCPlusPlus.Network 1.0

Item {
    id: id_root

    signal onlineNotifyP2P(string noticeContent, string destinationIp)
    signal sendBroadcastMessage(int type, string msgContent)
    signal sendP2PMessage(int type, string msgContent, string destinationIp)
    signal showMessageToScreen(string chatContent)

    anchors.fill: parent

    //处理接收的消息[类型 + ip + userName + chatContent]
    function processMessage(message) {
        var type = message[0]
        var userIp = message[1]
        var userName = message[2]
        var chatContent = message[3]
        var time = message[4]

        //检测到是在线用户，显示消息
        for (var index=0; index<id_userList.modelCount; ++index) {
            if (userIp === id_userList.getUserListIp(index)) {
                if (chatContent == null || chatContent == "") {
                    return
                }
                else {
                    id_containerLeft.showMessage(userName, chatContent, time)
                    return
                }
            }
        }

        //发现新用户，添加到在线列表，并给新用户一个回馈
        id_userList.addUserToOnlineList(userName, userIp)       //将新上线用户添加到 ListView 列表
        onlineNotifyP2P(1, "", userIp)
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
        anchors { left: parent.left; right: parent.right; top: id_windowTitle.bottom; bottom: parent.bottom }

        Chat {
            id: id_containerLeft
            width: parent.width - 220
            height: parent.height
            anchors {left: parent.left; top: parent.top; bottom: parent.bottom; leftMargin: 5; topMargin: 5; bottomMargin: 5; rightMargin: 15}
            onSendBroadcastMessage: {
                id_root.sendBroadcastMessage(0, msg)
            }
//            onSendP2PMessage: {
//                console.log("我已经发出去了端对端的消息呀")
//                id_root.sendP2PMessage(0, msg, ip)
//            }
        }

        UserList {
            id: id_userList
            anchors { left: id_containerLeft.right; top: parent.top; bottom: parent.bottom; right: parent.right; leftMargin: 15; topMargin: 5; bottomMargin: 5; rightMargin: 5 }
            onSendP2PMessage: {
                id_root.sendP2PMessage(0, chatContent, destinationIp)
            }
        }
    }
}
