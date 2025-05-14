import QtQuick 2.15

Item {
    id: voiceCommand
    width: parent ? parent.width * 0.3 : 300
    height: 100

    Rectangle {
        id: voiceContainer
        anchors.fill: parent
        radius: 10
        color: "#e0e0e0"
        border.color: "#a0a0a0"
        border.width: 1

        Column {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            // Status text displays current recognition state
            Text {
                id: voiceStatus
                text: "Press mic to speak"
                font.pixelSize: 16
                color: "black"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // Microphone icon – uses your provided mic icon asset
            Image {
                id: micIcon
                width: 64
                height: 64
                anchors.horizontalCenter: parent.horizontalCenter
                source: "qrc:/ui/assets/call_icon.png"
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        voiceStatus.text = "Listening..."
                        recognitionTimer.start();
                    }
                }
            }
        }
    }

    // Timer simulating speech recognition delay
    Timer {
        id: recognitionTimer
        interval: 2000
        repeat: false
        onTriggered: {
            // For demonstration, simulate recognized text
            var recognizedText = "Call John Doe";
            voiceStatus.text = "Recognized: " + recognizedText;
            // Parse the recognized text for a call command
            if (recognizedText.indexOf("Call ") === 0) {
                var contactName = recognizedText.substring(5);
                if (typeof CallManager !== "undefined" && CallManager.startCall) {
                    CallManager.startCall(contactName);
                } else {
                    console.log("CallManager not available");
                }
            }
        }
    }
}


