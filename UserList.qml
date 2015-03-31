import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    id: userList
    property ListModel model: userList.model
    property int modelCount: userList.model.count
    signal clickUser(string userName, string ip)
    color: Qt.rgba(0, 0, 0, 0.4)
    border {width: 1; color: "lightblue"}

    //添加在线用户
    function addUserToOnlineList(userName, userIp) {
        userListModel.append({"name": userName, "ip": userIp})
    }

    //
    Rectangle {
        id: userListTitle
        anchors {left: parent.left; top: parent.top;  margins: 5}
        height: text.height
        color: Qt.rgba(255, 255, 255, 0.3)
        Text {
            id: text
            text: qsTr("在线用户：（双击私聊）")
            font {pointSize: 11}
            color: "white"
        }
    }

    ListView {
        id: userNameList
        anchors {left: parent.left; right: parent.right; top: userListTitle.bottom; margins: 5}
//        spacing: 10
        height: 400
        delegate: Rectangle {
            id: userItem
            width: parent.width
            height: userHead.height
            color: mouseArea.containsMouse ? (mouseArea.pressed ? "black" : "purple") : Qt.rgba(255, 255, 255, 0)
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
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true

                //双击用户，进入私聊
                onDoubleClicked: {
                    console.log("私聊模式已开启！")
                }
            }
        }

        model: ListModel {
            id: userListModel
            ListElement {
                name : "曹延杰"
                ip : "192.168.1.100"
            }
            ListElement {
                name : "da"
                ip : "192.168.1.100"
            }
        }

//        highlight: Rectangle {
//            width: 180
//            height: 4
//            color: Qt.rgba(255, 255, 255, 0.3)
//            radius: 5
//            y: userNameList.currentItem.y
//            Behavior on y {
//                SpringAnimation {
//                    spring: 3
//                    damping: 0.2
//                }
//            }
//        }
        highlightFollowsCurrentItem: true
    }
}

