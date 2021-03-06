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

        MyCommand {
             id: myCommand
             onNewLine: console.log(line)
             Component.onCompleted: run("ls", "-al")
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
                placeholderText: i18n.tr("IpAddress")
            }

            TextField {
                id: userinputfield
                placeholderText: i18n.tr("User")
            }

           Row {
               spacing: 5
               Button {
                   objectName: "sshbutton"
                   width: 100

                   text: i18n.tr("SSH")

                   onClicked: {
                       myType.helloWorld = i18n.tr("ssh (cpp)")
                   }
                }

               Button {
                   objectName: "sshfsbutton"
                  width: 100

                   text: i18n.tr("SSHFS")

                   onClicked: {
                       myType.helloWorld = i18n.tr("sshfs (cpp)")
                   }
                }
            }
           Button {
              objectName: "dmesgbutton"
              width: 200

               text: i18n.tr("DMESG")

               onClicked: {
                   myType.helloWorld = i18n.tr("dmesg(cpp)")
                   myCommand.run("dmesg", "")
                   console.trace()
               }
           }
           Rectangle {
               id: page
               width: 200; height: 200
               color: "#333333"

               Text {
                   id: recText
                   text: "1"
                   y: 30

               }
           }
    }
}
}
