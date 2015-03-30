import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    id: userList
    color: Qt.rgba(0, 0, 0, 0.4)
    border {width: 1; color: "lightblue"}

    //
    Text {
        id: userListTitle
        text: qsTr("在线用户：（双击私聊）")
        anchors {left: parent.left; top: parent.top;  margins: 5}
        font {pointSize: 11}
        color: "white"
    }

    ListView {
        id: userName
        anchors {left: parent.left; right: userList.right; top: userListTitle.bottom; margins: 5}

        delegate: Item {
            id: userItem
            anchors {left: parent.left; right: parent.right; top: parent.top; margins: 5}
            height: 30

            Image {
                id: userHead
                width: 25
                height: 25
                anchors {left: parent.left}
                source: "Img/Images/manLogo4.png"
            }

            Text {
                anchors {left: userHead.right; verticalCenter: parent.verticalCenter; margins: 5}
                text: name
                color: "white"
            }

            ToolButton {
                anchors.fill: parent
            }
        }

        model: ListModel {
            ListElement {
                name : "曹延杰"
                ip : "192.168.1.100"
            }
        }
    }
}

