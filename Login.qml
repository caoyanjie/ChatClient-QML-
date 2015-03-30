import QtQuick 2.0
import QtQuick.Controls 1.2

Item {
    width: parent.width
    height: parent.height

    signal loginSuccess

    function checkLogin(userName, password){
        if (true) {
            loginSuccess()
        }
    }

    AnimatedImage {
        anchors.fill: parent
        source: "Img/Images/waterfall.gif"
    }

    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0.4)
    }

    WindowTitle {
        Text {
            anchors.centerIn: parent
            text: qsTr("登 录")
            color: "white"
            font {pointSize: 12}
        }
    }

    Column {
        id: columnLayout

        property int rowSpacing: 20

        spacing: 30
        anchors {centerIn: parent}

        Row {
            spacing: columnLayout.rowSpacing
            Text {
                text: "用户名："
                color: "white"
            }
            CustomTextInput {
                id: user
            }
        }
        Row {
            spacing: columnLayout.rowSpacing
            Text {
                text: "密  码："
                color: "white"
            }
            CustomTextInput {
                id: password
            }
        }
        Row {
            spacing: columnLayout.rowSpacing
            Button {
                text: "登录"
                onClicked: {
                    checkLogin(user.text, password.text)
                }
            }
            Button {
                text: "注册"
            }
        }
    }
}

