import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Drift

Rectangle {
    id: root

    signal backRequested()
    signal exportRequested()
    signal exportProgressRequested()
    signal projectMenuRequested()
    signal downloadsRequested()

    height: 42
    color: Theme.panelBackground
    border.color: Theme.panelBorder
    border.width: 1

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        spacing: 6

        ToolButton {
            text: "‹"
            Layout.preferredWidth: 28
            Layout.preferredHeight: 28
            onClicked: root.backRequested()
        }

        Label {
            text: "FORCE EFFECTS"
            color: Theme.primary
            font.pixelSize: 13
            font.bold: true
            Layout.preferredWidth: 120
        }

        Rectangle {
            Layout.preferredWidth: 1
            Layout.preferredHeight: 20
            color: Theme.panelBorder
        }

        Repeater {
            model: [
                "Arquivo",
                "Editar",
                "Clipe",
                "Áudio",
                "Efeitos",
                "Composição",
                "Exibir"
            ]

            delegate: ToolButton {
                text: modelData
                Layout.preferredHeight: 28
                font.pixelSize: 11
            }
        }

        Item {
            Layout.fillWidth: true
        }

        ToolButton {
            text: "↓"
            Layout.preferredWidth: 30
            Layout.preferredHeight: 28
            onClicked: root.downloadsRequested()
        }

        ToolButton {
            text: "Exportar"
            Layout.preferredHeight: 28
            font.pixelSize: 11
            onClicked: root.exportRequested()
        }
    }
}
