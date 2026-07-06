import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    width: 640
    height: 480
    color: "#141414"

    property var nState 

    // Stores the active generated command string visually
    property string activeCommand: ""

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 16

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 4
            
            Text {
                text: "Login Screen"
                color: "#ffffff"
                font.pixelSize: 24
                font.bold: true
            }
            Text {
                text: "Select a theme to view its terminal execution command below."
                color: "#8a8a8a"
                font.pixelSize: 13
            }
        }

        GridView {
            id: themeGrid
            Layout.fillWidth: true
            Layout.fillHeight: true
            cellWidth: 190
            cellHeight: 140
            clip: true

            // Mapped exactly to your /usr/share/sddm/themes directory paths
            model: ListModel {
                ListElement { themeName: "Caelestia Lock"; themeId: "caelestia"; iconName: "🔒" }
                ListElement { themeName: "Silent Theme"; themeId: "silent"; iconName: "🌙" }
                ListElement { themeName: "Sugar Candy"; themeId: "sugar-candy"; iconName: "🍬" }
            }

            delegate: Rectangle {
                width: 170
                height: 120
                color: mouseArea.containsMouse ? "#222222" : "#1a1a1a"
                radius: 12
                border.color: root.activeCommand.includes(model.themeId) ? "#c0de40" : (mouseArea.containsMouse ? "#444444" : "#2a2a2a")
                border.width: 1.5

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 12
                    
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#252525"
                        radius: 8
                        
                        Text {
                            anchors.centerIn: parent
                            text: model.iconName
                            font.pixelSize: 28
                        }
                    }

                    Text {
                        text: model.themeName
                        color: "#ffffff"
                        font.pixelSize: 13
                        font.bold: mouseArea.containsMouse
                        Layout.alignment: Qt.AlignHCenter
                    }
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        root.activeCommand = "sudo sed -i 's/^Current=.*/Current=" + model.themeId + "/' /etc/sddm.conf"
                    }
                }
            }
        }

        // Interactive Copy Terminal Panel Container
        Rectangle {
            Layout.fillWidth: true
            height: 90
            color: "#1a1a1a"
            radius: 10
            border.color: "#2a2a2a"
            border.width: 1
            visible: root.activeCommand !== ""

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 8

                Text {
                    text: "Triple-click code below to copy, paste into terminal, then hit Enter:"
                    color: "#8a8a8a"
                    font.pixelSize: 11
                    font.bold: true
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#0f0f0f"
                    radius: 6
                    border.color: "#222222"

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 8

                        TextEdit {
                            id: commandText
                            text: root.activeCommand
                            color: "#c0de40"
                            font.family: "monospace"
                            font.pixelSize: 12
                            readOnly: true
                            selectByMouse: true
                            Layout.fillWidth: true
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
        }
    }
}
