import QtQuick 2.0
//import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.2
import QtQuick.Window 2.0

Window {
    id: p2pDialog
    property string destinationIp: chat.destinationIp
    signal sendP2PMessage(string destinationIp, string chatContent)

    visible: true
    flags: Qt.Window + Qt.FramelessWindowHint + Qt.WindowMinMaxButtonsHint
    width: 600
    height: 500

    MouseArea {
        id: dragWindow
        property point clickedPoint: "0, 0"
        anchors.fill: parent

        onPressed: {
            clickedPoint = Qt.point(mouse.x, mouse.y)
        }

        onPositionChanged: {
            p2pDialog.setX(p2pDialog.x + (mouse.x-clickedPoint.x))
            p2pDialog.setY(p2pDialog.y + (mouse.y-clickedPoint.y))
        }
    }

    Item {
        anchors.fill: parent

        Image {
            id: background
            anchors.fill: parent
            source: "Img/Images/background.png"
        }

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

        Chat {
            id: chat
            anchors {left: parent.left; right: parent.right; top: id_windowTitle.bottom; bottom: parent.bottom}
            destinationIp: p2pDialog.destinationIp

            onSendP2PMessage: {
                sendP2PMessage(ip, msg)
            }
        }
    }
}

