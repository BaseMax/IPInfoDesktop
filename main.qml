// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Window
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

ApplicationWindow {
    id: appRoot
    width: 800
    height: 800
    maximumWidth: 800
    maximumHeight: 800
    visible: true
    title: qsTr("IPInfo")
    color: "#f2f2f2"

    QtObject {
        id: appObject
        readonly property string apiUrl : "https://ipinfo.io/json?"
        readonly property string apiKey : "";
        readonly property string method : "GET";

        property string ip: "0.0.0.0"
        property string hostname: "localhost"
        property string city: "Unknown"
        property string region: "Unknown"
        property string country: "Unknown"
        property string loc: "Unknown"
        property string postal: "Unknown"
        property string timezone: "Unknown"

    }
    FontSystem { id: fontSystem; }

    //! Remove extra double quote for some json outputs.
    function stringFixer(variable)
    {
        return variable.replace(/['"]+/g, '\n');
    }

    function dataRequest(type)
    {
        var req = new XMLHttpRequest();
        req.open(appObject.method, appObject.apiUrl + "token=c5107a1eff4fe1");
        req.onreadystatechange = function() {
            if (req.readyState === XMLHttpRequest.DONE) {
                let result = JSON.parse(req.responseText);
                //Data
                appObject.ip = result.ip
                appObject.hostname = result.hostname
                appObject.city = result.city
                appObject.region = result.region
                appObject.country = result.country
                appObject.loc = result.loc
                appObject.postal = result.postal
                appObject.timezone = result.timezone
            }
            busyIndicator.running = false;
        }
        req.onerror = function(){
            console.log("Error!")
        }
        req.send()
    }

    Pane {
        anchors.fill: parent
        background: appRoot.background

        ColumnLayout {
            width: parent.width
            Layout.fillWidth: true
            anchors.centerIn: parent

            spacing: 16

            Text {
                font.family: fontSystem.getContentFontBold.name
                font.pixelSize: fontSystem.h1
                font.bold: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: qsTr("The trusted source for IP address data")
                color: "#171c26"
            }
            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: fontSystem.h4
                font.bold: false
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: qsTr("Accurate IP address data that keeps pace with secure, specific, and forward-looking use cases.")
                color: "#171c26"
            }
            Item {
                id: mainItem
                width: 430
                implicitHeight: 470
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Behavior on implicitHeight {
                    NumberAnimation { duration: 200; }
                }

                RectangularGlow {
                    id: effect
                    anchors.fill: mainBorder
                    glowRadius: 32
                    spread: 0.1
                    color: "#dfdfdf"
                    cornerRadius: mainBorder.radius + glowRadius
                }

                Rectangle {
                    id: mainBorder
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    anchors.fill: parent
                    color: "#ffffff"
                    border.width: 1
                    border.color: "#dfdfdf"
                    radius: 15
                }

                ColumnLayout {
                    width: parent.width
                    Layout.fillWidth: true
                    spacing: 10

                    Item { height: 20; }

                    RowLayout {
                        width: parent.width
                        Layout.fillWidth: true

                        Item { width: 30; }

                        Image {
                            width: 96
                            sourceSize.width: 96
                            source: "qrc:/resources/logo.svg"
                        }

                        Item { }

                        Rectangle {
                            width: parent.width - 162
                            height: 64
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            color: "#f1f1f1"
                            radius: 10
                            ColumnLayout {
                                anchors.fill: parent
                                Item { width: 10; }
                                RowLayout {
                                    width: parent.width
                                    Layout.fillWidth: true
                                    spacing: 0
                                    Item { width: 15; }
                                    Text {
                                        font.family: fontSystem.getContentFont.name
                                        font.pixelSize: 18
                                        color: "#999"
                                        text: qsTr("Current IP")
                                    }
                                    Item { width: 10; }

                                    Text {
                                        font.family: fontSystem.getContentFont.name
                                        font.pixelSize: 20
                                        color: "#777"
                                        text: qsTr(appObject.ip)
                                    }

                                    Item { Layout.fillWidth: true; }
                                }
                                Item { width: 10; }

                            }
                        }


                    }

                    RowLayout {
                        width: parent.width
                        Layout.fillWidth: true
                        spacing: 5
                        Item { width: 30; }

                        CircleIcon {}

                        Item { width: 2; }

                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 14
                            text: qsTr("Hostname:")
                        }
                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 14
                            color: "#007aff"
                            text: qsTr(appObject.hostname)
                        }

                        Item { Layout.fillWidth: true; }
                    }

                    RowLayout {
                        width: parent.width
                        Layout.fillWidth: true
                        spacing: 5
                        Item { width: 30; }

                        CircleIcon {}

                        Item { width: 2; }

                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 14
                            text: qsTr("City:")
                        }
                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 14
                            color: "#007aff"
                            text: qsTr(appObject.city)
                        }

                        Item { Layout.fillWidth: true; }
                    }

                    RowLayout {
                        width: parent.width
                        Layout.fillWidth: true
                        spacing: 5
                        Item { width: 30; }

                        CircleIcon {}

                        Item { width: 2; }

                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 14
                            text: qsTr("Region:")
                        }
                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 14
                            color: "#007aff"
                            text: qsTr(appObject.region)
                        }

                        Item { Layout.fillWidth: true; }
                    }

                    RowLayout {
                        width: parent.width
                        Layout.fillWidth: true
                        spacing: 5
                        Item { width: 30; }

                        CircleIcon {}

                        Item { width: 2; }

                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 14
                            text: qsTr("Country:")
                        }
                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 14
                            color: "#007aff"
                            text: qsTr(appObject.country)
                        }

                        Item { Layout.fillWidth: true; }
                    }

                    RowLayout {
                        width: parent.width
                        Layout.fillWidth: true
                        spacing: 5
                        Item { width: 30; }

                        CircleIcon {}

                        Item { width: 2; }

                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 14
                            text: qsTr("Loc:")
                        }
                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 14
                            color: "#007aff"
                            text: qsTr(appObject.loc)
                        }

                        Item { Layout.fillWidth: true; }
                    }

                    RowLayout {
                        width: parent.width
                        Layout.fillWidth: true
                        spacing: 5
                        Item { width: 30; }

                        CircleIcon {}

                        Item { width: 2; }

                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 14
                            text: qsTr("Postal:")
                        }
                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 14
                            color: "#007aff"
                            text: qsTr(appObject.postal)
                        }

                        Item { Layout.fillWidth: true; }
                    }


                    RowLayout {
                        width: parent.width
                        Layout.fillWidth: true
                        spacing: 5
                        Item { width: 30; }

                        CircleIcon {}

                        Item { width: 2; }

                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 14
                            text: qsTr("Timezone:")
                        }
                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: 14
                            color: "#007aff"
                            text: qsTr(appObject.timezone)
                        }

                        Item { Layout.fillWidth: true; }
                    }

                    Item {}

                    Button {
                        id: shortButton
                        implicitWidth: parent.width / 1.2
                        implicitHeight: 38
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.family: fontSystem.getContentFont.name
                        font.pixelSize: fontSystem.h5
                        text: "Detect"

                        layer.enabled: true
                        layer.effect: DropShadow {
                            transparentBorder: true
                            horizontalOffset: 0
                            verticalOffset: 3
                            color: "#ccc"
                            radius: 16
                            samples: 32
                            spread: 0.0

                        }

                        background: Rectangle {
                            id: shortButtonBack
                            anchors.fill: parent
                            color: "#171c26"
                            radius: 6
                            z: 2
                        }
                        contentItem: Text {
                            text: shortButton.text
                            font.bold: false
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            opacity: enabled ? 1.0 : 0.3
                            color: "#fff"
                            anchors.fill: parent
                            elide: Text.ElideRight
                            scale: shortButton.down ? 0.9 : 1.0
                            z: 3
                            Behavior on scale {
                                NumberAnimation {duration: 70;}
                            }
                        }

                        onClicked: {
                            busyIndicator.running = true;
                            dataRequest();
                        }

                    }


                }


                Item {}
            }
            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: 15
                font.bold: false
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                onLinkActivated: Qt.openUrlExternally(link)
                text: "Made by <strong>Iranian</strong> with love for freedom world."
                color: "#85878d"
            }
        }

        BusyIndicator {
            id: busyIndicator
            width: 48
            height: 48
            running: false
            anchors.bottom: parent.bottom
            contentItem: Item {
                implicitWidth: 16
                implicitHeight: 16

                Item {
                    id: itemProgress
                    x: parent.width / 2 - 16
                    y: parent.height / 2 - 16
                    width: 32
                    height: 32
                    opacity: busyIndicator.running ? 1 : 0

                    Behavior on opacity {
                        OpacityAnimator {
                            duration: 250
                        }
                    }

                    RotationAnimator {
                        target: itemProgress
                        running: busyIndicator.visible && busyIndicator.running
                        from: 0
                        to: 360
                        loops: Animation.Infinite
                        duration: 1250
                    }

                    Repeater {
                        id: repeater
                        model: 3

                        Rectangle {
                            x: itemProgress.width / 2 - width / 2
                            y: itemProgress.height / 2 - height / 2
                            implicitWidth: 5
                            implicitHeight: 5
                            radius: 2.5
                            color: "#171c26"
                            transform: [
                                Translate {
                                    y: -Math.min(itemProgress.width, itemProgress.height) * 0.5 + 7
                                },
                                Rotation {
                                    angle: index / repeater.count * 360
                                    origin.x: 2.5
                                    origin.y: 2.5
                                }
                            ]
                        }
                    }
                }
            }
        }
    }
}
