import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Github App")

    header: Rectangle {
        height: 50
        width: parent.width
        color: "#24292F"

        Image {
            anchors.left: parent.left
            anchors.verticalCenter: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:/assets/github-logo.svg"
            anchors.leftMargin: 16
            height: parent.height*0.9
        }

        Text {
            anchors.centerIn: parent
            text: "Github App Idea"
            color: "white"
            font.pixelSize: 32
            font.bold: true
        }
    }

    SwipeView {
        id: view

        currentIndex: 0
        anchors.fill: parent

        Item {
            id: statusPage
            Rectangle {
                anchors.fill: parent
                color: "white"

                Text {
                    anchors.centerIn: parent
                    text: "Página de status"
                }
            }
        }

        Item {
            id: profilePage
            Rectangle {
                anchors.fill: parent

                Text {
                    anchors.centerIn: parent
                    text: "Página de profile"
                }
            }
        }

        Item {
            id: timelinePage
            Rectangle {
                anchors.fill: parent

                Text {
                    anchors.centerIn: parent
                    text: "Página de timeline"
                }
            }
        }
    }

    footer: Item {
        height: 50

        RowLayout{
            anchors.fill: parent
            spacing: 3

            Rectangle{
                Layout.fillWidth: true
                Layout.minimumHeight: 50
                color: "#24292F"

                Text{
                    anchors.centerIn: parent
                    color: "white"
                    text: "STATUS"
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                         switch(view.currentIndex){
                         case 1:
                            view.currentIndex = 0;
                            break;

                         case 2:
                            view.currentIndex = 0;
                            break;
                         }
                    }
                }
            }

            Rectangle{
                Layout.fillWidth: true
                Layout.minimumHeight: 50
                color: "#24292F"

                Text{
                    anchors.centerIn: parent
                    color: "white"
                    text: "PROFILE"
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        switch(view.currentIndex){
                        case 0:
                           view.currentIndex = 1;
                           break;

                        case 2:
                           view.currentIndex = 1;
                           break;
                        }
                   }
                }
            }

            Rectangle{
                Layout.fillWidth: true
                Layout.minimumHeight: 50
                color: "#24292F"

                Text{
                    anchors.centerIn: parent
                    color: "white"
                    text: "TIMELINE"
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        switch(view.currentIndex){
                        case 0:
                           view.currentIndex = 2;
                           break;

                        case 1:
                           view.currentIndex = 2;
                           break;
                        }
                   }
                }
            }
        }


    }
}
