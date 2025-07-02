import QtQuick


/**
  The basics needed for a palette.

  "sub" colors are alternate colors that depict less important/pronounced subjects.
  */
QtObject {
    required property string name

    // Accent -- used for things like highlights and indicators
    // required property Accent accent

    // Background -- self explanatory
    required property color background
    required property color subBackground

    // Text and placeholder/help text
    required property color text
    required property color subText

    // Buttons and highlighted
    required property color button
    required property color buttonLight
    required property color buttonText
    required property color buttonHighlighted

    // Dialog background
    required property color dialog
}
