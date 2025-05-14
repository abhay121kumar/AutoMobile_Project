
import QtQuick 2.15

Item {
    id: callPopup
    property alias callerNameText: callerName.text
    property alias callerNumberText: callerNumber.text
    property alias callerPhotoSource: callerPhoto.source

    anchors.centerIn: parent
    width: parent ? Math.min(parent.width * 0.5, 320) : 320
    height: parent ? Math.min(parent.height * 0.4, 240) : 240
    visible: false
    z: 1000

    Component.onCompleted: {
        console.log("CallPopup size:", width, height)
    }

    Rectangle {
        id: container
        anchors.fill: parent
        radius: 20
        color: "white"
        border.color: "#cccccc"
        border.width: 1

        Column {
            anchors.centerIn: parent
            spacing: 10

            Image {
                id: callerPhoto
                width: 80
                height: 80
                fillMode: Image.PreserveAspectFit
                source: "qrc:/ui/assets/default_avatar.png"
            }
            Text {
                id: callerName
                text: "Caller Name"
                font.pixelSize: 20
                color: "#333333"
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
            }
            Text {
                id: callerNumber
                text: "Caller Number"
                font.pixelSize: 16
                color: "#666666"
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
            }
            Text {
                id: callDuration
                text: "00:00"
                font.pixelSize: 16
                color: "green"
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
            }
            Rectangle {
                id: endCallButton
                width: parent.width * 0.8
                height: 40
                radius: 20
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#ff4d4d" }
                    GradientStop { position: 1.0; color: "#e63946" }
                }
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    anchors.centerIn: parent
                    text: "End Call"
                    color: "white"
                    font.pixelSize: 16
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        callPopup.visible = false;
                        durationTimer.running = false;
                    }
                }
            }
        }
    }

    Timer {
        id: durationTimer
        interval: 1000
        running: callPopup.visible
        repeat: true
        property int seconds: 0
        onTriggered: {
            seconds++;
            var mins = Math.floor(seconds / 60);
            var secs = seconds % 60;
            callDuration.text = (mins < 10 ? "0" + mins : mins) + ":" + (secs < 10 ? "0" + secs : secs);
        }
        onRunningChanged: {
            if (!running) {
                seconds = 0;
                callDuration.text = "00:00";
            }
        }
    }

    function openPopup(name, number, photoSource) {
        callerName.text = name;
        callerNumber.text = number;
        if (photoSource && photoSource !== "")
            callerPhoto.source = photoSource;
        else
            callerPhoto.source = "qrc:/ui/assets/default_avatar.png";
        visible = true;
        durationTimer.running = true;
    }
}
