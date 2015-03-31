import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtCPlusPlus.Network 1.0

ApplicationWindow {
    id: root
//    signal switchLoginSuccess(string userName)

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
        id: network
//        onReceivedMessage: processMessage(message)          //C++ 接收到网络数据，调用 JavaScript 函数处理数据
//
//        Component.onCompleted: {
//            network.setUserName(loginUserName)              //登录用户名传送到C++，发送上线通知
//        }
    }

    //登录界面
    Login {
        id: login

        //切换到登录后界面
        onLoginSuccess: {
//            switchLoginSuccess(userName)
            root.width = 750
            root.height = 480
            login.destroy()
            var compenent = Qt.createComponent("LoginSuccess.qml").createObject(root)
            network.setUserName(userName)                                   //登录用户名传送到C++，发送上线通知
            network.receivedMessage.connect(compenent.processMessage)       //绑定network的信号到新创建的组件的信号上
//            compenent.processMessage.connect(network.setUserName())
        }
    }
/*
    //登录成功跳转-
    onSwitchLoginSuccess: {
        root.width = 750
        root.height = 480
        login.destroy()
        var compenent = Qt.createComponent("LoginSuccess.qml").createObject(root)
        compenent.test(userName)
    }*/
}
