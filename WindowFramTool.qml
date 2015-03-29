import QtQuick 2.0
import QtQuick.Controls 1.2

ToolButton {
    id:　id_root
    property string toolName
    signal buttonClicked

    width: 15
    height: 15

    Image {
        width: 11
        height: 11
        anchors.centerIn: parent
        source: "Img/Images/" + id_root.toolName + ".png"
    }

    onClicked: {
        buttonClicked()
    }
}
