pragma Singleton

import QtQuick


/**
  Singleton holding palette info.
  */
Item {
    property alias light: light

    Accent {
        id: red

        name: "Red"
        accent: "FireBrick"
        subAccent: "Crimson"
    }

    Accent {
        id: blue

        name: "Blue"
        accent: "DodgerBlue"
        subAccent: "DeepSkyBlue"
    }

    Accent {
        id: orange

        name: "Orange"
        accent: "DarkGoldenRod"
        subAccent: "Coral"
    }

    Accent {
        id: gold

        name: "Gold"
        accent: "GoldenRod"
        subAccent: "Gold"
    }

    Accent {
        id: forest

        name: "Forest"
        accent: "DarkGreen"
        subAccent: "ForestGreen"
    }

    Accent {
        id: violet

        name: "Violet"
        accent: "DarkViolet"
        subAccent: "Violet"
    }

    Accent {
        id: pink

        name: "Pink"
        accent: "MediumOrchid"
        subAccent: "Magenta"
    }

    Accent {
        id: steel

        name: "Steel"
        accent: "LightSlateGray"
        subAccent: "LightSteelBlue"
    }

    readonly property list<Accent> accents: [red, blue, orange, gold, forest, violet, pink, steel]
    readonly property list<BasePalette> themes: [light, dark, oled]

    property Accent accent: red
    property BasePalette theme

    Component.onCompleted: {
        theme = CarboxylApplication.systemIsDarkMode() ? dark : light
    }

    onThemeChanged: {
        CarboxylApplication.setDarkMode(theme !== light)
    }

    BasePalette {
        id: light

        name: "Light"

        background: "FloralWhite"
        subBackground: "#E4E4E4"

        text: "#111111"
        subText: "#040404"

        disabledText: "gray"

        button: background
        buttonLight: Qt.darker(background, 1.2)
        buttonText: text
        buttonHighlighted: "Gray"

        dialog: "#EBEBEB"
    }

    BasePalette {
        id: dark

        name: "Dark"

        background: "#202020"
        subBackground: "#404040"

        text: "#E9E9E9"
        subText: "#D2D2D2"

        disabledText: "gray"

        button: background
        buttonLight: Qt.lighter(background, 1.6)
        buttonText: text
        buttonHighlighted: "#A8A8A8"

        dialog: "#272727"
    }

    BasePalette {
        id: oled

        name: "OLED"

        background: "Black"
        subBackground: "#121212"

        text: "#FFFFFF"
        subText: "#F0F0F0"

        disabledText: "gray"

        button: background
        buttonLight: "#191919"
        buttonText: text
        buttonHighlighted: "#A8A8A8"

        dialog: "#1A1A1A"
    }
}
