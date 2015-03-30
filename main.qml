import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtCPlusPlus.Network 1.0

ApplicationWindow {
    id: root
    signal switchLoginSuccess

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

    //登录界面
    Login {
        id: login
        onLoginSuccess: switchLoginSuccess()
    }

    //登录成功跳转
    onSwitchLoginSuccess: {
        root.width = 750
        root.height = 480
        login.destroy()
        Qt.createComponent("LoginSuccess.qml").createObject(root)
    }
}
