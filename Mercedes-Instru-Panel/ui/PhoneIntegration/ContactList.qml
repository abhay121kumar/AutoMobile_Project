
import QtQuick 2.15
import App.Backend 1.0

Rectangle {
    id: contactList
    width: parent ? parent.width * 0.4 : 400
    height: parent ? parent.height * 0.6 : 300
    color: "white"
    border.color: "gray"
    border.width: 1
    radius: 10

    property alias searchText: searchField.text

    Column {
        anchors.fill: parent
        spacing: 5
        padding: 10

        // Custom Search Bar
        Rectangle {
            id: searchBar
            width: parent.width
            height: 40
            color: "#eeeeee"
            radius: 5
            border.color: "#cccccc"
            border.width: 1

            // Instead of placeholderText, use an overlaid Text element.
            TextInput {
                id: searchField
                anchors.fill: parent
                anchors.margins: 5
                font.pixelSize: 16
                // Remove placeholderText property.
                // onTextChanged will automatically update the filtered model.
                onTextChanged: listView.model = filteredContacts
            }
            // Overlay text visible when searchField is empty.
            Text {
                id: placeholder
                text: "Search Contacts"
                color: "#888888"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                visible: searchField.text === ""
            }
        }

        // ListView for displaying contacts
        ListView {
            id: listView
            width: parent.width
            height: parent.height - searchBar.height - 20
            clip: true

            // Use the original contacts from the backend
            property var originalContacts: ContactManager.getContactList()

            // Filtering function
            function filterContacts() {
                var result = [];
                for (var i = 0; i < originalContacts.length; i++) {
                    var contact = originalContacts[i];
                    if (searchField.text === "" ||
                        contact.toLowerCase().indexOf(searchField.text.toLowerCase()) !== -1) {
                        // Wrap the string in an object with displayName and a dummy phone number.
                        result.push({ "displayName": contact, "phoneNumber": "+1234567890" });
                    }
                }
                return result;
            }
            property var filteredContacts: filterContacts()

            delegate: Rectangle {
                width: parent.width
                height: 50
                color: ListView.isCurrentItem ? "#d0eaff" : "white"
                border.color: "#cccccc"
                border.width: 1

                Row {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10
                    Image {
                        id: avatar
                        width: 40
                        height: 40
                        source: "qrc:/ui/assets/default_avatar.png"
                        fillMode: Image.PreserveAspectFit
                    }
                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 2
                        Text {
                            text: displayName
                            font.pixelSize: 16
                            color: "black"
                        }
                        Text {
                            text: phoneNumber
                            font.pixelSize: 14
                            color: "gray"
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (typeof CallManager !== "undefined" && CallManager.startCall) {
                            CallManager.startCall(displayName);
                        }
                        contactList.visible = false;
                    }
                }
            }
        }
    }

    // Timer to refresh the contact list based on search changes
    Timer {
        interval: 200
        running: true
        repeat: true
        onTriggered: {
            listView.filteredContacts = listView.filterContacts();
        }
    }
}

