import QtQuick 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.2
import QtCPlusPlus.P2P 1.0
/*
//Item {
P2P {
    Image {
        id: background
        anchors.fill: parent
        source: "Img/Images/background.png"
    }

    Chat {
        anchors.fill: parent
    }
//}
}*/

Dialog {
    id: filledDialog
    property string destinationIp: chat.destinationIp
    signal sendP2PMessage(string destinationIp, string chatContent)

    visible: true
    modality: Qt.WindowModal
 //   flag: Qt.FramelessWindowHint
    width: 600
    height: 500
    contentItem: Item {
        Image {
            id: background
            anchors.fill: parent
            source: "Img/Images/background.png"
        }

        Chat {
            id: chat
            anchors.fill: parent
            destinationIp: filledDialog.destinationIp

            onSendP2PMessage: {
                filledDialog.sendP2PMessage(ip, msg)
            }
        }
    }
}

