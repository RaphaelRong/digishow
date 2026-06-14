import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import DigiShow

import "components"

GridView {
    id: gridView
    height: 2*cellHeight
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    cellWidth: 300
    cellHeight: 210
    clip: true
    snapMode: ListView.SnapToItem
    focus: true

    ScrollBar.vertical: ScrollBar {
        width: 8
        policy: ScrollBar.AsNeeded
    }
}


