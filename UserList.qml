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
}

