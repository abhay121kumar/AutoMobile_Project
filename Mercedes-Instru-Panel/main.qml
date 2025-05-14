

import QtQuick 2.15

import "ui/BottomBar"
import "ui/RightScreen"
import "ui/LeftScreen"
import "ui/TopBar"
import "qrc:/ui/PhoneIntegration"

Window {
    id: mainWindow
    width: 1280; height: 720; visible: true
    title: qsTr("Mercedes-Benz Instrument Panel")
    color: "#1f1f2e"

    // Gradient overlay
    Rectangle {
        anchors.fill: parent; z:-1
        gradient: Gradient {
            GradientStop { position:0; color:"#1f1f2e" }
            GradientStop { position:1; color:"#3a3a4e" }
        }
    }

    TopBar { id: topBar; anchors.top:parent.top }
    BottomBar { id: bottomBar; anchors.bottom:parent.bottom }
    LeftScreen { id: leftScreen
        width:parent.width/2
        height:parent.height - topBar.height - bottomBar.height
        anchors.top:topBar.bottom; anchors.left:parent.left
    }
    RightScreen { id: rightScreen
        width:parent.width/2
        height:parent.height - topBar.height - bottomBar.height
        anchors.top:topBar.bottom; anchors.right:parent.right
    }

    CallPopup { id: callPopup; anchors.centerIn:parent }
    ContactSelectionDialog { id: contactSelectionDialog; visible:false }
    MusicPlayer { id: musicDialog; visible:false }
}
