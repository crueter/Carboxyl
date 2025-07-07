import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Shapes

import Carboxyl.Base

Button {
    palette {
        buttonText: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
    }

    id: control
    hoverEnabled: true
    
    property bool needsHighlight: !enabled ? false : (highlighted || hovered)
    property bool cave: !enabled ? false : (down || pressed)
    property int radius: 5
    
    background: Rectangle {
        anchors.fill: parent
        color: Palettes.theme.button
        radius: control.radius
        
        gradient: LinearGradient {
            y2: height
            x2: width
            GradientStop {
                position: 0.0
                color: Palettes.theme.button
            }
            GradientStop {
                position: 1.0
                color: Palettes.theme.buttonLight
            }
        }
        
        border {
            color: control.needsHighlight ? (control.cave ? "transparent" : Palettes.accent.subAccent) : palette.buttonText
            Behavior on color {
                ColorAnimation {
                    duration: 150
                }
            }
            
            width: 1
        }
    }
    
}
