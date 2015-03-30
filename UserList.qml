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
        anchors {left: parent.left; top: userListTitle.bottom; right: userList.right; margins: 5}

        delegate: Item {
            id: user
//            width: userList.width
            height: 20
//            color: Qt.rgba(0, 0, 0, 0)
            /*
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    user.color = Qt.rgba(0, 0, 0, 0.4)
                }
                onExited: {
                    user.color = Qt.rgba(0, 0, 0, 0)
                }
            }*/
            Image {
                id: userHead
                width: 20
                height: 20
                anchors {left: parnet.left; }
                source: "Img/Images/manLogo.png"
            }

            Text {
                anchors {left: userHead.right; verticalCenter: parent.verticalCenter}
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

