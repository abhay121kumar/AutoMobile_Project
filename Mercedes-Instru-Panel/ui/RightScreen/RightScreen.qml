
import QtQuick 2.15
import QtLocation
import QtPositioning

Rectangle {
    id: rightScreen
    width: parent.width * 2/3
    anchors {
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }

    Plugin {
        id: mapPlugin
        name: "osm" // OpenStreetMap
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin

        property real centerLat: 48.77
        property real centerLon: 9.18
        center: QtPositioning.coordinate(centerLat, centerLon)
        zoomLevel: 14
        property geoCoordinate startCentroid

        // Animate center updates
        Behavior on centerLat { NumberAnimation { duration: 1000; easing.type: Easing.InOutQuad } }
        Behavior on centerLon { NumberAnimation { duration: 1000; easing.type: Easing.InOutQuad } }

        PinchHandler {
            id: pinch
            target: null
            onActiveChanged: if (active) {
                map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
            }
            onScaleChanged: (delta) => {
                map.zoomLevel += Math.log2(delta)
                map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
            }
            onRotationChanged: (delta) => {
                map.bearing -= delta
                map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
            }
            grabPermissions: PointerHandler.TakeOverForbidden
        }

        WheelHandler {
            id: wheel
            acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                ? PointerDevice.Mouse | PointerDevice.TouchPad
                : PointerDevice.Mouse
            rotationScale: 1/120
            property: "zoomLevel"
        }

        DragHandler {
            id: drag
            target: null
            onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
        }

        Shortcut {
            sequence: StandardKey.ZoomIn
            enabled: map.zoomLevel < map.maximumZoomLevel
            onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
        }
        Shortcut {
            sequence: StandardKey.ZoomOut
            enabled: map.zoomLevel > map.minimumZoomLevel
            onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
        }
    }

    Image {
        id: lockIcon
        anchors {
            left: parent.left
            top: parent.top
            margins: 20
        }
        width: parent.width / 40
        fillMode: Image.PreserveAspectFit
        source: systemHandler.carLocked ? "qrc:/ui/assets/lock.png" : "qrc:/ui/assets/unlock.png"

        MouseArea {
            anchors.fill: parent
            onClicked: systemHandler.setCarLocked(!systemHandler.carLocked)
        }
    }

    Text {
        id: dateTimeDisplay
        anchors {
            left: lockIcon.right
            leftMargin: 40
            bottom: lockIcon.bottom
        }
        font.pixelSize: 14
        font.bold: true
        color: "black"
        text: systemHandler.currentTime
    }

    Text {
        id: outdoorTemperatureDisplay
        anchors {
            left: dateTimeDisplay.right
            leftMargin: 40
            bottom: lockIcon.bottom
        }
        font.pixelSize: 14
        font.bold: true
        color: "black"
        text: systemHandler.outdoorTemp + "°F"
    }

    Text {
        id: userName
        anchors {
            left: outdoorTemperatureDisplay.right
            leftMargin: 40
            bottom: lockIcon.bottom
        }
        font.pixelSize: 14
        font.bold: true
        color: "black"
        text: systemHandler.userName
    }

    NavigationSearchBox {
        id: navSearchBox
        width: parent.width * 1/3
        height: parent.height * 1/12
        anchors {
            left: lockIcon.left
            top: lockIcon.bottom
            topMargin: 15
        }
        mapRef: map
    }
}

