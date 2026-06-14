import QtQuick
import QtQuick.Dialogs
import QtCore

FileDialog {

    id: dialog

    property url folder
    property bool selectExisting: true
    readonly property url fileUrl: selectedFile

    fileMode: selectExisting ? FileDialog.OpenFile : FileDialog.SaveFile
    currentFolder: folder !== undefined && folder.toString() !== "" ? folder
                    : StandardPaths.standardLocations(StandardPaths.HomeLocation)[0]

    function setDefaultFilePath(path) {
        var filepath = (path === undefined || !utilities.fileExists(path) ? app.filepath : path)
        var dirpath = utilities.getFileDir(filepath)
        if (dirpath !== "" && utilities.dirExists(dirpath)) {
            dialog.folder = utilities.filePathUrl(dirpath)
        }
    }

    function setDefaultFileUrl(url) {
        var path = utilities.fileUrlPath(url)
        setDefaultFilePath(path)
    }
}
