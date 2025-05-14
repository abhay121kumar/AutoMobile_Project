


import QtQuick 2.15

Item {
    id: topBar
    width: parent.width; height: 60

    // Background
    Rectangle { anchors.fill: parent; color: "#1F1F1F" }

    // Call button shadow
    Rectangle {
        id: callShadow; width:160; height:40; radius:20
        color:"#40000000"
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right; anchors.rightMargin:32
        x: callButton.x + 3; y: callButton.y + 3
    }
    // Call button
    Rectangle {
        id: callButton; width:160; height:40; radius:20
        gradient: Gradient {
            GradientStop { position:0; color:"#3A86FF" }
            GradientStop { position:1; color:"#265DF2" }
        }
        anchors.verticalCenter:parent.verticalCenter
        anchors.right:parent.right; anchors.rightMargin:30

        Text { anchors.centerIn:parent; text:"Simulate Call"; color:"white"; font.pixelSize:16 }
        MouseArea {
            anchors.fill: parent; hoverEnabled: true
            onEntered: callButton.scale=1.05; onExited:callButton.scale=1.0
            onClicked: contactSelectionDialog.visible = true
        }
    }

    // Music button shadow
    Rectangle {
        id: musicShadow; width:120; height:40; radius:20
        color:"#40000000"
        anchors.verticalCenter:parent.verticalCenter
        anchors.right: callButton.left; anchors.rightMargin:32
        x: musicButton.x + 3; y: musicButton.y + 3
    }
    // Music button
    Rectangle {
        id: musicButton; width:120; height:40; radius:20
        gradient: Gradient {
            GradientStop { position:0; color:"#4CAF50" }
            GradientStop { position:1; color:"#388E3C" }
        }
        anchors.verticalCenter:parent.verticalCenter
        anchors.right: callButton.left; anchors.rightMargin:30

        Text { anchors.centerIn:parent; text:"Music"; color:"white"; font.pixelSize:16 }
        MouseArea {
            anchors.fill: parent; hoverEnabled: true
            onEntered: musicButton.scale=1.05; onExited:musicButton.scale=1.0
            onClicked: musicDialog.visible = true
        }
    }
}
