
import QtQuick 2.15
import App.Backend 1.0

Rectangle {
    id: musicDialog
    anchors.fill: parent
    color: "#00000088"
    visible: false; z: 1000

    // Fake shadow
    Rectangle {
        width: parent.width * 0.6; height: parent.height * 0.6; radius: 10
        color: "#40000000"
        anchors.centerIn: parent
        x: container.x + 4; y: container.y + 4
    }

    // Main card
    Rectangle {
        id: container
        width: parent.width * 0.6; height: parent.height * 0.6; radius: 10
        color: "#f4f4f8"; border.color: "#cccccc"; border.width: 1
        anchors.centerIn: parent

        Column {
            anchors.fill: parent; anchors.margins: 10; spacing: 10

            // Header
            Row {
                id: headerRow
                width: parent.width; height: 40; spacing: 10

                Text {
                    id: headerTitle
                    text: "Music Player"
                    font.pixelSize: 20; font.bold: true; color: "#333333"
                    verticalAlignment: Text.AlignVCenter
                }

                // Spacer: explicitly reference headerRow.spacing
                Item {
                    width: headerRow.width
                         - headerTitle.implicitWidth
                         - closeBtn.width
                         - headerRow.spacing
                    height: 1
                }

                // Close button
                Rectangle {
                    id: closeBtn
                    width: 40; height: 40; radius: 20; color: "#ff4d4d"
                    Text {
                        text: "×"; font.pixelSize: 22; color: "white"
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: musicDialog.visible = false
                    }
                }
            }

            // Track list
            ListView {
                id: listView
                width: parent.width
                height: parent.height * 0.5
                spacing: 5; clip: true

                model: MusicController.trackList
                delegate: Rectangle {
                    width: listView.width; height: 40
                    color: ListView.isCurrentItem ? "#e8f0ff" : "white"
                    border.color: "#dddddd"; border.width: 1

                    Text {
                        text: modelData
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left; anchors.leftMargin: 10
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: MusicController.playTrack(index)
                    }
                }
            }

            // Controls
            Row {
                width: parent.width; height: 60; spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle {
                    width: 60; height: 40; radius: 5; color: "#dddddd"
                    Text { text: "Prev"; anchors.centerIn: parent }
                    MouseArea { anchors.fill: parent; onClicked: MusicController.prev() }
                }
                Rectangle {
                    width: 60; height: 40; radius: 5; color: "#dddddd"
                    Text {
                        anchors.centerIn: parent
                        text: MusicController.isPlaying ? "Pause" : "Play"
                    }
                    MouseArea { anchors.fill: parent; onClicked: MusicController.togglePlay() }
                }
                Rectangle {
                    width: 60; height: 40; radius: 5; color: "#dddddd"
                    Text { text: "Stop"; anchors.centerIn: parent }
                    MouseArea { anchors.fill: parent; onClicked: MusicController.stop() }
                }
                Rectangle {
                    width: 60; height: 40; radius: 5; color: "#dddddd"
                    Text { text: "Next"; anchors.centerIn: parent }
                    MouseArea { anchors.fill: parent; onClicked: MusicController.next() }
                }
            }

            // Now playing label
            Text {
                text: MusicController.currentTitle
                anchors.horizontalCenter: parent.horizontalCenter
                font.italic: true; color: "#555555"
            }
        }
    }
}


