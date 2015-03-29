import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtCPlusPlus.Network 1.0

ApplicationWindow {
    id: root
    title: qsTr("聊天")
    width: 750
    height: 480
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

    }

    //backgroundImage
    Image {
        source: "/Img/Images/background.png"
        anchors.fill: parent
    }

    //WindowTitle
    WindowTitle {
        id: id_windowTitle
        anchors {left: parent.left; top: parent.top; right: parent.right}
        height: 25;
        onCloseWindow:  root.close()
        onMiniWindow: root.showMinimized()
//        onSetWindow:
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

    Text {
        id: windowState
        text: "当前无对话"
        color: "white"
        anchors {horizontalCenter: id_containerLeft.horizontalCenter; verticalCenter: id_windowTitle.verticalCenter}
    }

    //Network
    Network {

    }
}
