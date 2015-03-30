import QtQuick 2.0

Rectangle {
    width: 100
    height: 18
    border {width: 1; color: "white";}
    color: Qt.rgba(0, 0, 0, 0)

    TextInput {
        anchors.fill: parent
        color: "white"
        focus: true
        selectByMouse: true
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.IBeamCursor
        }
    }
}

