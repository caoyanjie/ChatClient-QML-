import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    id: root
//    border {width: 1; color: "lightblue"}
    color: Qt.rgba(0, 0, 0, 0.4)

    //
    TextBrower {
        id: textBrower
        width: parent.width
        anchors {bottom: chatTools.top; top: parent.top; bottomMargin: 5}
        color: Qt.rgba(0, 0, 0, 0.4)
    }

    //工具条
    ChatTools {
        id: chatTools
        width: parent.width
        anchors {left: parent.left; right: parent.right; bottom: textArea.top; topMargin: 5; bottomMargin: 5}
    }

    //文字输入框
    TextArea {
        id: textArea
        width: parent.width
        height: 80
        anchors {left: parent.left; right: parent.right; bottom: btnSendMsg.top; leftMargin: -1; rightMargin: -1; topMargin: 5; bottomMargin: 5}
        backgroundVisible: false
        textColor: "white"
        font {pointSize: 12}
    }

    //发送按钮
    Button {
        id: btnSendMsg
        text: qsTr("发送")
        anchors {right: parent.right; bottom: parent.bottom; topMargin: 5; bottomMargin: 5; rightMargin: 5}
    }
}
