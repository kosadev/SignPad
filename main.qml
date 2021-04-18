import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import SignPad 1.0

Window {
  id: root

  width: 640
  height: 480
  visible: true
  title: qsTr("Hello World")

  Column {
    width: parent.width
    height: parent.height

    spacing: 20

    SignPad {
      id: signPad

      anchors.horizontalCenter: parent.horizontalCenter

      property bool isFlipped: false

      width: 620// isFlipped ? root.height * 0.6 : root.width
      height: 480//isFlipped ? root.width : root.height * 0.6

      rotation: isFlipped ? 90 : 0

      fillColor: "#ebebeb"
      penWidth: penWidthSlider.value
    }

    Row {
      spacing: 5

      Button {
        id: clearButton
        text: "Clear"

        onClicked: {
          signPad.clear()
        }
      }

      Button {
        id: flipButton
        text: "Flip"

        onClicked: {
          signPad.isFlipped = !signPad.isFlipped
        }
      }

      Button {
        id: saveButton
        text: "Save"

        onClicked: {
          var ret = signPad.saveImage("/Users/lukasz/signature.png")
          console.log("Image saved? " + ret)
        }
      }

      Button {
        id: saveWithBackgroundButton
        text: "Save w. background"

        onClicked: {
          var ret = signPad.saveImage("/Users/lukasz/signature.png", true)
          console.log("Image saved? " + ret)
        }
      }

      Button {
        id: showHideButton
        text: "Show/Hide base line"

        onClicked: {
          signPad.showBaseLine = !signPad.showBaseLine
        }
      }

      Button {
        id: changeRedrawButton
        text: "On/Off redraw on pen change"

        onClicked: {
          signPad.redrawOnPenChange = !signPad.redrawOnPenChange
        }
      }
    }

    Slider {
      id: penWidthSlider

      from: 1
      to: 20

      value: 2
    }

    Row {
      spacing: 8

      Rectangle {
        height: 20
        width: height
        radius: height / 2
        color: "green"
        MouseArea {
          anchors.fill: parent
          onClicked: {
            signPad.penColor = parent.color
          }
        }
      }

      Rectangle {
        height: 20
        width: height
        radius: height / 2
        color: "black"
        MouseArea {
          anchors.fill: parent
          onClicked: {
            signPad.penColor = parent.color
          }
        }
      }

      Rectangle {
        height: 20
        width: height
        radius: height / 2
        color: "red"
        MouseArea {
          anchors.fill: parent
          onClicked: {
            signPad.penColor = parent.color
          }
        }
      }

      Rectangle {
        height: 20
        width: height
        radius: height / 2
        color: "blue"
        MouseArea {
          anchors.fill: parent
          onClicked: {
            signPad.penColor = parent.color
          }
        }
      }

      Rectangle {
        height: 20
        width: height
        radius: height / 2
        color: "orange"
        MouseArea {
          anchors.fill: parent
          onClicked: {
            signPad.penColor = parent.color
          }
        }
      }
    }
  }
}
