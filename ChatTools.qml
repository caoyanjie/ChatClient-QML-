import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    id: root
    color: Qt.rgba(0, 0, 0, 0.7)
    height: comboBox.height + 8

    Row {
//        y: 4
        spacing: 15
        anchors.verticalCenter: parent.verticalCenter

        //字体
        ComboBox {
            id: comboBox
            model: ListModel{
                ListElement {text: "宋体"}
                ListElement {text: "楷体"}
                ListElement {text: "黑体"}
            }
        }

        //字号
        ComboBox {
            width: 47
            anchors {margins: 2}
            model: ListModel{
                ListElement {text: "7"}
                ListElement {text: "8"}
                ListElement {text: "9"}
                ListElement {text: "10"}
                ListElement {text: "11"}
                ListElement {text: "12"}
                ListElement {text: "13"}
                ListElement {text: "14"}
                ListElement {text: "15"}
                ListElement {text: "16"}
                ListElement {text: "17"}
                ListElement {text: "18"}
            }
        }

        //加租
        ToolButton {
            anchors {margins: 2}
            height: comboBox.height
            width: height
            Text{
                anchors.centerIn: parent
                text: qsTr("B")
                 color: "white"
                font {bold: true; pointSize: 10}
            }
        }

        //斜体
        ToolButton {
            anchors {margins: 2}
            height: comboBox.height
            width: height
            Text{
                anchors.centerIn: parent

                text: qsTr("I")
                 color: "white"
                font {italic: true; bold: true; pointSize: 10}
            }
        }

        //下划线
        ToolButton {
            anchors {margins: 2}
            height: comboBox.height
            width: height
            Text{
                anchors.centerIn: parent
                text: qsTr("U")
                 color: "white"
                font {bold: true; pointSize: 10; underline: true}
            }
        }

        //颜色
        ToolButton {
            anchors {margins: 2}
            height: comboBox.height
            width: height
            Image {
                anchors.centerIn: parent
                source: "Images/colorDialog.png"
            }
        }

        //文件
        Button {
            anchors {margins: 2}
            id: openFile
            height: comboBox.height
            width: 60
            Text {
                anchors.centerIn: parent
                text: qsTr("浏览...")
            }
        }
    }
}
