import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Drift

Item {
    id: root

    property alias assetsPanel: assets
    property alias propertiesPanel: properties
    property alias preview: preview
    property alias timeline: timeline

    signal backRequested()
    signal exportRequested()

    Rectangle {
        anchors.fill: parent
        color: "#000000"
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 44
            color: "#050505"
            border.color: "#181818"
            border.width: 1

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                spacing: 8

                ToolButton {
                    text: "‹"
                    Layout.preferredWidth: 30
                    Layout.preferredHeight: 30
                    font.pixelSize: 24
                    onClicked: root.backRequested()
                }

                Label {
                    text: "FORCE EFFECTS"
                    color: "#FFFFFF"
                    font.pixelSize: 13
                    font.bold: true
                }

                Rectangle {
                    Layout.preferredWidth: 1
                    Layout.preferredHeight: 22
                    color: "#181818"
                }

                Repeater {
                    model: ["Arquivo", "Editar", "Clipe", "Áudio", "Efeitos", "Composição", "Exibir"]

                    delegate: ToolButton {
                        text: modelData
                        Layout.preferredHeight: 30
                        font.pixelSize: 11
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                ToolButton {
                    text: "Exportar"
                    Layout.preferredHeight: 30
                    font.pixelSize: 11
                    onClicked: root.exportRequested()
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 1

            Rectangle {
                Layout.preferredWidth: 220
                Layout.fillHeight: true
                color: "#050505"
                border.color: "#181818"

                AssetsPanel {
                    id: assets
                    anchors.fill: parent
                    sheetMode: false
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 1

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#000000"

                    AndroidPreview {
                        id: preview
                        anchors.fill: parent
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: Math.max(230, parent.height * 0.34)
                    color: "#050505"
                    border.color: "#181818"

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0

                        AndroidClipToolbar {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 58
                            panel: "timeline"
                            onMoreRequested: {}
                        }

                        AndroidTimeline {
                            id: timeline
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                        }
                    }
                }
            }

            Rectangle {
                Layout.preferredWidth: 280
                Layout.fillHeight: true
                color: "#050505"
                border.color: "#181818"

                PropertiesPanel {
                    id: properties
                    anchors.fill: parent
                    sheetMode: false
                }
            }
        }
    }
}
