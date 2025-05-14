
import QtQuick 2.15
import QtPositioning 5.15

Rectangle {
    id: navSearchBox
    radius: 5
    color: "#f0f0f0"

    property var mapRef

    Image {
        id: searchIcon
        anchors {
            left: parent.left
            leftMargin: 25
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.45
        fillMode: Image.PreserveAspectFit
        source: "qrc:/ui/assets/search.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                searchLocation()
            }
        }
    }

    Text {
        id: navigationPlaceHolderText
        visible: navigationTextInput.text === ""
        color: "#373737"
        text: "Navigate"
        anchors {
            verticalCenter: parent.verticalCenter
            left: searchIcon.right
            leftMargin: 20
        }
    }

    TextInput {
        id: navigationTextInput
        clip: true
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: searchIcon.right
            leftMargin: 20
        }
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 16

        Keys.onReturnPressed: searchLocation()
    }

    function searchLocation() {
        if (navigationTextInput.text.trim() === "" || !mapRef) {
            console.log("No search term or map reference available");
            return;
        }

        var url = "https://nominatim.openstreetmap.org/search?q=" +
                  encodeURIComponent(navigationTextInput.text.trim()) +
                  "&format=json&addressdetails=1";

        console.log("Searching location: " + url);

        var xhr = new XMLHttpRequest();
        xhr.open("GET", url);
        xhr.setRequestHeader("User-Agent", "MercedesInstruPanelDemo/1.0");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    try {
                        var results = JSON.parse(xhr.responseText);
                        if (results.length > 0) {
                            var result = results[0];
                            var lat = parseFloat(result.lat);
                            var lon = parseFloat(result.lon);

                            console.log("Found location: lat=" + lat + " lon=" + lon);

                            mapRef.centerLat = lat;
                            mapRef.centerLon = lon;
                        } else {
                            console.log("No results found for: " + navigationTextInput.text);
                        }
                    } catch(e) {
                        console.log("Error parsing response: " + e);
                    }
                } else {
                    console.log("Network error: " + xhr.status);
                }
            }
        }
        xhr.send();
    }
}


