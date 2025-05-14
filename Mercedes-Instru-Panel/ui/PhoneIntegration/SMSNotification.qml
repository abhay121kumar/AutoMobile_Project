import QtQuick 2.15

Item {
    id: smsNotification
    width: parent ? parent.width * 0.3 : 300
    height: 100
    visible: false
    z: 1000

    Rectangle {
        id: container
        anchors.fill: parent
        radius: 10
        color: "#f9f9f9"
        border.color: "#cccccc"
        border.width: 1

        Row {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10
            // SMS icon – you can change this to an SMS-related asset if available
            Image {
                id: smsIcon
                source: "qrc:/ui/assets/default_avatar.png"
                width: 40
                height: 40
                fillMode: Image.PreserveAspectFit
            }
            Column {
                anchors.verticalCenter: parent.verticalCenter
                spacing: 5
                // SMS sender name
                Text {
                    id: smsSender
                    text: "Sender Name"
                    font.pixelSize: 16
                    color: "black"
                }
                // SMS preview text
                Text {
                    id: smsPreview
                    text: "SMS preview message goes here..."
                    font.pixelSize: 14
                    color: "gray"
                    wrapMode: Text.WordWrap
                    maximumLineCount: 2
                }
            }
        }
    }

    // Timer to auto-dismiss the SMS notification after 3 seconds
    Timer {
        id: dismissTimer
        interval: 3000
        repeat: false
        onTriggered: {
            smsNotification.visible = false;
        }
    }

    // Function to show SMS notifications with dynamic data
    function showSMS(sender, message, iconSource) {
        smsSender.text = sender;
        smsPreview.text = message;
        if (iconSource && iconSource !== "")
            smsIcon.source = iconSource;
        smsNotification.visible = true;
        dismissTimer.restart();
    }
}
