import QtQuick 2.0
import Ubuntu.Components 1.1
import DKShell 1.0
/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "dkshell.dragonkeeper"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(100)
    height: units.gu(75)
    backgroundColor: "#333333"
    headerColor: "#333333"
    footerColor: "#333332"
    Page {
        title: i18n.tr("DKShell")

        MyType {
            id: myType

            Component.onCompleted: {
                myType.helloWorld = i18n.tr("ssh")
            }
        }

        Column {
            spacing: units.gu(1)
            anchors {
                margins: units.gu(2)
                fill: parent
            }

            Label {
                id: label
                objectName: "label"

                text: myType.helloWorld
            }

            TextField {
                id: ipinputfield
                placeholderText: qstr("IpAddress")
            }
            TextField {
                id: userinputfield
                placeholderText: qstr("User")
            }

            Button {
                objectName: "button"
                width: parent.width

                text: i18n.tr("Connect")

                onClicked: {
                    myType.helloWorld = i18n.tr("ssh (cpp)")
                }
            }
        }
    }
}

