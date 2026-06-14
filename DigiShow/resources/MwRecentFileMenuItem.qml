import QtQuick
import QtQuick.Controls

MenuItem {
    property string filepath: ""

    onTriggered: {
        window.fileOpen(filepath)
    }
}
