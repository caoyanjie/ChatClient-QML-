import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    id: textBrower
    property string text
    border {width: 1; color: "lightblue"}

    TextArea {
        id: textArea
        anchors.fill: parent
        backgroundVisible: false
        textColor: "white"
        readOnly: true
        text: textBrower.text
    }
}

