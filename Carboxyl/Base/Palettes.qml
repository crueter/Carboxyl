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

    SystemPalette {
        id: systemActive
        colorGroup: SystemPalette.Active
    }

    SystemPalette {
        id: systemInactive
        colorGroup: SystemPalette.Inactive
    }

    SystemPalette {
        id: systemDisabled
        colorGroup: SystemPalette.Disabled
    }

    Accent {
        id: systemAccent

        name: "System"
        active: systemActive.accent
        inactive: systemInactive.accent
        disabled: systemDisabled.accent
    }

    // TODO(crueter): Rework these to properly represent active, inactive, disabled
    Accent {
        id: red

        name: "Red"
        active: Qt.darker("Crimson", 1.1)
        inactive: "Firebrick"
        disabled: Qt.darker(inactive, 1.2)
    }

    Accent {
        id: blue

        name: "Blue"
        active: "Blue"
        inactive: "DodgerBlue"
        disabled: "DeepSkyBlue"
    }

    Accent {
        id: orange

        name: "Orange"
        active: "Orange"
        inactive: Qt.darker(active, 1.2)
        disabled: Qt.darker(inactive, 1.2)
    }

    Accent {
        id: gold

        name: "Gold"
        active: "#FFD700"
        inactive: "Goldenrod"
        disabled: Qt.darker(inactive, 1.2)
    }

    Accent {
        id: forest

        name: "Forest"
        active: "DarkGreen"
        inactive: "ForestGreen"
        disabled: Qt.lighter(inactive, 1.2)
    }

    Accent {
        id: violet

        name: "Violet"
        active: "DarkViolet"
        inactive: Qt.darker(disabled, 1.4)
        disabled: "Violet"
    }

    Accent {
        id: pink

        name: "Pink"
        active: "#FF0080"
        inactive: "#E6006B"
        disabled: Qt.darker(inactive, 1.2)
    }

    Accent {
        id: cyan

        name: "Cyan"
        active: "#60D1F6"
        inactive: "#00E6E6"
        disabled: Qt.darker(inactive, 1.2)
    }

    Accent {
        id: steel

        name: "Steel"
        active: "#99a3a3"
        inactive: "#a8b0b2"
        disabled: "#c0c6c7"
    }

    readonly property list<Accent> accents: [systemAccent, red, blue, orange, gold, forest, violet, pink, cyan, steel]
    readonly property list<BasePalette> themes: [systemPalette, light, dark, midnight]

    property Accent accent: systemAccent
    property BasePalette theme: systemPalette

    Component.onCompleted: {
        let palette = CarboxylApplication.systemDarkMode ? dark : light
        systemPalette.active = palette.active
        systemPalette.inactive = palette.inactive
        systemPalette.disabled = palette.disabled
    }

    // this is really annoying
    onAccentChanged: {
        systemPalette.active.highlight = accent.active
        systemPalette.active.accent = accent.active

        systemPalette.inactive.highlight = accent.inactive
        systemPalette.inactive.accent = accent.inactive

        systemPalette.disabled.highlight = accent.disabled
        systemPalette.disabled.accent = accent.disabled
    }

    BasePalette {
        id: systemPalette

        name: "System"
    }

    BasePalette {
        id: light

        name: "Light"

        active {
            accent: root.accent.active
            highlight: root.accent.active

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
            highlight: root.accent.inactive
            accent: root.accent.inactive

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
            accent: root.accent.disabled
            highlight: root.accent.disabled

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

    BasePalette {
        id: dark

        name: "Dark"

        active {
            accent: root.accent.active
            highlight: root.accent.active

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
            highlight: root.accent.inactive
            accent: root.accent.inactive

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
            accent: root.accent.disabled
            highlight: root.accent.disabled

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
    BasePalette {
        id: midnight

        name: "Midnight"

        active {
            accent: root.accent.active
            highlight: root.accent.active

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
            highlight: root.accent.inactive
            accent: root.accent.inactive

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
            accent: root.accent.disabled
            highlight: root.accent.disabled

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
