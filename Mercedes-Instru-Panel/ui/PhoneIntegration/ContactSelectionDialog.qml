

import QtQuick 2.15
import App.Backend 1.0

Rectangle {
    id: contactSelectionDialog
    anchors.fill: parent
    color: "#00000088"  // Semi-transparent overlay
    visible: false
    z: 1000

    // Fade-in animation states
    states: [
        State {
            name: "visibleState"
            when: contactSelectionDialog.visible
            PropertyChanges { target: dialogContainer; opacity: 1.0 }
        }
    ]
    transitions: [
        Transition {
            from: ""; to: "visibleState"
            NumberAnimation { target: dialogContainer; property: "opacity"; duration: 300 }
        },
        Transition {
            from: "visibleState"; to: ""
            NumberAnimation { target: dialogContainer; property: "opacity"; duration: 300 }
        }
    ]

    // Simulated drop shadow behind the dialog container
    Rectangle {
        id: shadowRect
        width: parent.width * 0.6
        height: parent.height * 0.7
        radius: 10
        color: "#40000000"  // semi-transparent black
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        x: dialogContainer.x + 4
        y: dialogContainer.y + 4
    }

    // Actual dialog container
    Rectangle {
        id: dialogContainer
        width: parent.width * 0.6
        height: parent.height * 0.7
        radius: 10
        color: "#f4f4f8"
        border.color: "#cccccc"
        border.width: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        opacity: 0.0  // will fade in via animation

        Column {
            id: dialogColumn
            width: parent.width - 20
            spacing: 10
            anchors.top: parent.top
            anchors.topMargin: 10

            // Header with title and close button
            Rectangle {
                id: headerRow
                width: dialogColumn.width
                height: 40
                color: "transparent"

                Text {
                    id: headerTitle
                    text: "Select Contact"
                    font.pixelSize: 22
                    font.bold: true
                    color: "#333333"
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
                Rectangle {
                    id: closeButton
                    width: 40
                    height: 40
                    color: "#ff4d4d"
                    radius: 20
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        text: "×"
                        font.pixelSize: 22
                        color: "white"
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: contactSelectionDialog.visible = false
                    }
                }
            }

            // Contact list
            ListView {
                id: contactsListView
                width: dialogColumn.width
                height: dialogContainer.height - headerRow.height - 20
                spacing: 5
                clip: true

                model: {
                    var list = ContactManager.getContactList();
                    if (list
                        && list.length === 3
                        && list[0] === "John Doe"
                        && list[1] === "Alice Smith"
                        && list[2] === "Bob Johnson") {
                        list = ["Abhay Kumar", "poo", "papa", "maa"];
                    }
                    return list;
                }

                delegate: Rectangle {
                    width: contactsListView.width
                    height: 60
                    radius: 5
                    color: ListView.isCurrentItem ? "#e8f0ff" : "white"
                    border.color: "#dddddd"
                    border.width: 1

                    Row {
                        spacing: 10
                        anchors.fill: parent
                        anchors.margins: 10

                        Image {
                            id: avatar
                            width: 40
                            height: 40
                            source: "qrc:/ui/assets/default_avatar.png"
                            fillMode: Image.PreserveAspectFit
                        }
                        Column {
                            spacing: 2
                            width: parent.width - avatar.width - 30
                            Text {
                                text: modelData
                                font.pixelSize: 16
                                color: "#333333"
                            }
                            Text {
                                text: (modelData === "Abhay Kumar" ? "939947465" :
                                       modelData === "poo" ? "9827743432" :
                                       modelData === "papa" ? "3923953029" :
                                       modelData === "maa" ? "18409328023" : "+0000000000")
                                font.pixelSize: 14
                                color: "#777777"
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            contactSelectionDialog.visible = false;
                            var phoneNumber = (modelData === "Abhay Kumar" ? "939947465" :
                                               modelData === "poo" ? "9827743432" :
                                               modelData === "papa" ? "3923953029" :
                                               modelData === "maa" ? "18409328023" : "+0000000000");
                            if (typeof callPopup !== "undefined" && callPopup.openPopup)
                                callPopup.openPopup(modelData, phoneNumber, "");
                            else
                                console.log("callPopup not available");
                        }
                    }
                }
            }
        }
    }
}
