// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
pragma Singleton

import QtQuick


/**
  Singleton holding palette info.
  */
Item {
    id: root

    property alias light: light

    CloverAccent {
        id: red
        name: "Red"
        light: "Crimson"
    }

    CloverAccent {
        id: blue
        name: "Blue"
        light: "Blue"
        midnight: this.dark
    }

    CloverAccent {
        id: orange
        name: "Orange"
        light: "#da8e00"
    }

    CloverAccent {
        id: gold
        name: "Gold"
        // light: "#FFD700"
        light: "#ccac00"
    }

    CloverAccent {
        id: forest
        name: "Forest"
        light: "#00c500"
    }

    CloverAccent {
        id: violet
        name: "Violet"
        light: "#9663b5"
    }

    CloverAccent {
        id: pink
        name: "Pink"
        light: "#FF00B0"
    }

    CloverAccent {
        id: cyan
        name: "Cyan"
        light: "#00b4b4"
    }

    CloverAccent {
        id: steel
        name: "Steel"
        light: "#788585"
    }

    readonly property list<CloverAccent> accents: [red, blue, orange, gold, forest, violet, pink, cyan, steel]
    readonly property list<CloverPalette> themes: [systemPalette, light, dark, midnight]

    property CloverAccent accent: blue
    property CloverPalette theme: systemPalette
    property bool isDarkMode: (theme === systemPalette
                               && CarboxylApplication.systemDarkMode)
                              && theme !== light

    Component.onCompleted: {
        let palette = CarboxylApplication.systemDarkMode ? dark : light
        systemPalette.active = palette.active
        systemPalette.inactive = palette.inactive
        systemPalette.disabled = palette.disabled
    }

    CloverPalette {
        id: systemPalette

        name: "System"
        currentAccent: (CarboxylApplication.systemDarkMode ? dark : light).currentAccent
    }

    // TODO: autogen inactive, disabled?
    CloverPalette {
        id: light

        name: "Light"
        currentAccent: root.accent.light

        active {
            // used for alternating rows
            alternateBase: "#e4e4e4"
            base: "#ffffff"
            button: "#dadada"

            text: "#171717"
            highlightedText: "#171717"
            buttonText: "#1A1A1A"

            // high-contrast text e.g. for highlighted buttons
            brightText: "#ffffff"

            // used for contrast in switches and some buttons
            dark: "#707070"

            // slightly lighter than button
            light: "#e7e7e7"

            // between button and dark
            mid: "#ababab"

            // between button and light
            midlight: "#dfdfdf"

            // these are virtually standard
            link: "#1d99f3"
            linkVisited: "#9b59b6"

            // VERY DARK color
            // rarely used
            shadow: "#202020"

            // tooltips, self explanatory...
            toolTipBase: "#fcfcfc"
            toolTipText: "#292c30"

            // the general window fg/bg stuff
            window: "#efefef"
            windowText: "#1b1b1b"

            // 6.2+: color for placeholder TextField text
            placeholderText: "#707070"
        }

        // inactive is between active and disabled
        inactive {
            // used for alternating rows
            alternateBase: "#d9d9d9"
            base: "#ffffff"
            button: "#dddddd"

            text: "#707070"
            highlightedText: "#707070"
            buttonText: "#707070"

            // high-contrast text e.g. for highlighted buttons
            brightText: "#ffffff"

            // used for contrast in switches and some buttons
            dark: "#707070"

            // slightly lighter than button
            light: "#f0f0f0"

            // between button and dark
            mid: "#ababab"

            // between button and light
            midlight: "#e2e2e2"

            // these are virtually standard
            link: "#4abbf3"
            linkVisited: "#a983c2"

            // VERY DARK color
            // rarely used
            shadow: "#202020"

            // tooltips, self explanatory...
            toolTipBase: "#fcfcfc"
            toolTipText: "#292c30"

            // the general window fg/bg stuff
            window: "#ededed"
            windowText: "#707070"

            // 6.2+: color for placeholder TextField text
            placeholderText: "#989898"
        }

        disabled {
            // used for alternating rows
            alternateBase: "#d5d5d5"
            base: "#f0f0f0"
            button: "#dfdfdf"

            text: "#a8a8a8"
            highlightedText: "#a8a8a8"
            buttonText: "#aaaaaa"

            // high-contrast text e.g. for highlighted buttons
            brightText: "#ffffff"

            // used for contrast in switches and some buttons
            dark: "#707070"

            // slightly lighter than button
            light: "#efefef"

            // between button and dark
            mid: "#ababab"

            // between button and light
            midlight: "#e8e8e8"

            // these are virtually standard
            link: "#a3cae2"
            linkVisited: "#d6bae1"

            // VERY DARK color
            // rarely used
            shadow: "#202020"

            // tooltips, self explanatory...
            toolTipBase: "#fcfcfc"
            toolTipText: "#292c30"

            // the general window fg/bg stuff
            window: "#ececec"
            windowText: "#a0a0a0"

            // 6.2+: color for placeholder TextField text
            placeholderText: "#c0c0c0"
        }
    }

    CloverPalette {
        id: dark

        name: "Dark"
        currentAccent: root.accent.dark

        active {
            // used for alternating rows
            alternateBase: "#303030"
            base: "#1e1e1e"
            button: "#303030"

            text: "#fcfcfc"
            highlightedText: "#fcfcfc"
            buttonText: "#e9e9e9"

            // high-contrast text e.g. for highlighted buttons
            brightText: "#ffffff"

            // used for contrast in switches and some buttons
            dark: "#101010"

            // slightly lighter than button
            light: "#484848"

            // between button and dark
            mid: "#282828"

            // between button and light
            midlight: "#323232"

            // these are virtually standard
            link: "#1d99f3"
            linkVisited: "#9b59b6"

            // VERY DARK color
            // rarely used
            shadow: "#0b0c0d"

            // tooltips, self explanatory...
            toolTipBase: "#292c30"
            toolTipText: "#fcfcfc"

            // the general window fg/bg stuff
            window: "#202326"
            windowText: "#fcfcfc"

            // 6.2+: color for placeholder TextField text
            placeholderText: "#a1a9b1"
        }

        // inactive is between active and disabled
        inactive {
            // used for alternating rows
            alternateBase: "#303030"
            base: "#1f1f1f"
            button: "#393939"

            text: "#b0b0b0"
            highlightedText: "#b0b0b0"
            buttonText: "#b0b0b0"

            // high-contrast text e.g. for highlighted buttons
            brightText: "#ffffff"

            // used for contrast in switches and some buttons
            dark: "#101010"

            // slightly lighter than button
            light: "#484848"

            // between button and dark
            mid: "#272727"

            // between button and light
            midlight: "#383838"

            // these are virtually standard
            link: "#4abbf3"
            linkVisited: "#a983c2"

            // VERY DARK color
            // rarely used
            shadow: "#0b0c0d"

            // tooltips, self explanatory...
            toolTipBase: "#292c30"
            toolTipText: "#fcfcfc"

            // the general window fg/bg stuff
            window: "#242424"
            windowText: "#b0b0b0"

            // 6.2+: color for placeholder TextField text
            placeholderText: "#b2b2b2"
        }

        disabled {
            // used for alternating rows
            alternateBase: "#303030"
            base: "#202020"
            button: "#464646"

            text: "#727272"
            highlightedText: "#727272"
            buttonText: "#727272"

            // high-contrast text e.g. for highlighted buttons
            brightText: "#ffffff"

            // used for contrast in switches and some buttons
            dark: "#101010"

            // slightly lighter than button
            light: "#484848"

            // between button and dark
            mid: "#1b1b1b"

            // between button and light
            midlight: "#3d3d3d"

            // these are virtually standard
            link: "#a3cae2"
            linkVisited: "#d6bae1"

            // VERY DARK color
            // rarely used
            shadow: "#0b0c0d"

            // tooltips, self explanatory...
            toolTipBase: "#292c30"
            toolTipText: "#fcfcfc"

            // the general window fg/bg stuff
            window: "#282828"
            windowText: "#727272"

            // 6.2+: color for placeholder TextField text
            placeholderText: "#424242"
        }
    }

    // NB: Midnight has to break a few rules due to it being way too dark otherwise
    CloverPalette {
        id: midnight

        name: "Midnight"
        currentAccent: root.accent.midnight

        active {
            // used for alternating rows
            alternateBase: "#1e1e1e"
            base: "#000000"
            button: "#202020"

            text: "#ffffff"
            highlightedText: "#ffffff"
            buttonText: "#ffffff"

            // high-contrast text e.g. for highlighted buttons
            brightText: "#ffffff"

            // used for contrast in switches and some buttons
            dark: "#404040"

            // slightly lighter than button
            light: "#343434"

            // between button and dark
            mid: "#484848"

            // between button and light
            midlight: "#505050"

            // these are virtually standard
            link: "#1d99f3"
            linkVisited: "#9b59b6"

            // VERY DARK color
            // rarely used
            shadow: "#0b0c0d"

            // tooltips, self explanatory...
            toolTipBase: "#292c30"
            toolTipText: "#fcfcfc"

            // the general window fg/bg stuff
            window: "#000000"
            windowText: "#ffffff"

            // 6.2+: color for placeholder TextField text
            placeholderText: "#a1a9b1"
        }

        // inactive is between active and disabled
        inactive {
            // used for alternating rows
            alternateBase: "#202020"
            base: "#040404"
            button: "#242424"

            text: "#dddddd"
            highlightedText: "#dddddd"
            buttonText: "#dddddd"

            // high-contrast text e.g. for highlighted buttons
            brightText: "#ffffff"

            // used for contrast in switches and some buttons
            dark: "#202020"

            // slightly lighter than button
            light: "#343434"

            // between button and dark
            mid: "#222222"

            // between button and light
            midlight: "#303030"

            // these are virtually standard
            link: "#4abbf3"
            linkVisited: "#a983c2"

            // VERY DARK color
            // rarely used
            shadow: "#0b0c0d"

            // tooltips, self explanatory...
            toolTipBase: "#292c30"
            toolTipText: "#fcfcfc"

            // the general window fg/bg stuff
            window: "#040404"
            windowText: "#dddddd"

            // 6.2+: color for placeholder TextField text
            placeholderText: "#b2b2b2"
        }

        disabled {
            // used for alternating rows
            alternateBase: "#242424"
            base: "#080808"
            button: "#282828"

            text: "#bbbbbb"
            highlightedText: "#bbbbbb"
            buttonText: "#bbbbbb"

            // high-contrast text e.g. for highlighted buttons
            brightText: "#ffffff"

            // used for contrast in switches and some buttons
            dark: "#202020"

            // slightly lighter than button
            light: "#343434"

            // between button and dark
            mid: "#222222"

            // between button and light
            midlight: "#303030"

            // these are virtually standard
            link: "#a3cae2"
            linkVisited: "#d6bae1"

            // VERY DARK color
            // rarely used
            shadow: "#0b0c0d"

            // tooltips, self explanatory...
            toolTipBase: "#292c30"
            toolTipText: "#fcfcfc"

            // the general window fg/bg stuff
            window: "#282828"
            windowText: "#bbbbbb"

            // 6.2+: color for placeholder TextField text
            placeholderText: "#424242"
        }
    }
}
