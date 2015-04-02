import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtCPlusPlus.Network 1.0      //自定义 C++ 类，实现网络通信

ApplicationWindow {
    id: root

    property alias id_network: id_network

    width: 500
    height: 300
    visible: true
    flags: Qt.Window + Qt.FramelessWindowHint + Qt.WindowMinMaxButtonsHint

    MouseArea {
        anchors.fill: parent
        property point clickedPos: "0, 0"
        onPressed: {
            clickedPos = Qt.point(mouse.x, mouse.y)
        }
        onPositionChanged: {
            root.setX(root.x + (mouse.x-clickedPos.x))
            root.setY(root.y + (mouse.y-clickedPos.y))
        }
    }

    //Network
    Network {
        id: id_network
    }

    //登录界面
    Login {
        id: login

        //切换到登录后界面
        onLoginSuccess: {
            root.width = 750
            root.height = 480
            login.destroy()
            var compenent = Qt.createComponent("LoginSuccess.qml").createObject(root)
            id_network.setUserName(userName)                                //调用 C++ 的槽函数，设置用户名并发送上线通知
            id_network.receivedMessage.connect(compenent.processMessage)    //绑定 network 的信号到新创建的组件的信号上
            compenent.onlineNotifyP2P.connect(id_network.sendUdp)           //绑定 新创建组件的“端对端通知上线”到 network 的槽函数上
            compenent.sendBroadcastMessage.connect(id_network.sendUdp)      //发送广播消息（群聊）
            compenent.sendP2PMessage.connect(id_network.sendUdp)            //发送端到端消息（私聊）
        }
    }
}
