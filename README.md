# ![Carboxyl](./dist/text.png)

Carboxyl is a set of utility libraries for QML/Qt Quick, designed through years of aggregated UI research from a multitude of professional firms and hobbyists. Carboxyl contains four major components:

- *Base*: Carboxyl's native code interface
- *Clover*: Carboxyl's theming engine, which extends Qt Quick's paletting system
- *Contour*: Carboxyl's custom components
- *Chroma*: Carboxyl's custom styles

Currently, Carboxyl is in a WIP state with no ETA for release.

## Base

> "*Base? There's nothing basic about this!*"

TODO: docs for this

**NOTE:** Carboxyl's Base library uses private Qt APIs, and is thus inherently tied to the specific Qt version it is built against. Do not attempt to rebuild Qt without also rebuilding Carboxyl.

## Clover

> "*The pink theme makes me as happy as a pig in clover.*"

Clover is Carboxyl's custom theming engine. Clover leverages the existing `QQuickPalette` engine, but extends upon it by:

- Defining *context switch* operations
- Providing opinionated default themes (Light, Dark, Midnight/OLED)
- Defining accents separate from the main themes
- Passing light/dark mode status to the styling engine

Clover is in a very WIP state, and is subject to significant breaking changes before an official release.

## Contour

> "*The contours of Graphide are quite pleasing.*"

Contour is Carboxyl's custom component library. It adds new components for a number of reasons, notably:

- Backporting new Qt Quick components to older versions (*e.g. native dialogs*)
- New components that provide useful functionality not provided in base Quick (*e.g. labeled input fields*)
- Extending existing component's functionality (*e.g. tab bars and buttons*)
- Reimplementing and improving inefficient or style-specific components (*e.g. Material Ripple*)

Specifically, Contour's custom components are:

- Labeled Fields (`CarboxylLabeledTextField`, etc)
  - These add floating labels to input fields, similar to the Material text field placeholder text.
- `DoubleSpinBox`
  - SpinBox, but with support for doubles.
- `Dialog`, `NativeDialog`
  - The default popup dialog has no styling, and many Qt versions completely lack support for native dialogs.
  - `Dialog` is a popup dialog with an opinionated default style.
  - `NativeDialog` is a workaround to provide version-agnostic support for a native dialog.
- `Ripple`
  - The default Material `Ripple` is extraordinarily inefficient, as it is not GPU-accelerated at all and does ridiculous amounts of subpixel and transparency calculations. This implementation exposes it to all styles, and optimizes it significantly.
- `CarboxylTabBar`
  - Like `TabBar`, but provides support for vertical tab bars.
- `CarboxylTabButton`
  - Like `TabButton`, but with better icon support, providing options to use an inline icon OR a vertically stacked icon, alongside optionally coloring the icon according to the current style and theme.

## Chroma

> "*Helios is very chromatic. I like seeing my accent everywhere :)*"

The bread and butter of Carboxyl. Chroma is the library containing all of Carboxyl's custom styles.

### Graphide

> "*It's like Windows 11 without all the spyware. Neat.*"

Graphide is a style based off of Qt's FluentWinUI3 platform. It is designed to create a bubbly, rounded feel with proper accenting, *without* taking up lots of space or creating unusable touch targets.

- Graphide is fully compatible with Qt versions prior to 6.7, unlike FluentWinUI3.
- While Fluent design was used as a reference, the implementations themselves are largely derived from Helios.

### Helios

> "*Today I learned that a Material-based theme can work on a desktop target.*"

Helios is a style based off of Google's Material Design guidelines. It is designed to create a bubbly, rounded feel with proper accenting, focusing on large touch targets and creating a universal UX flow between touch and desktop targets.

- Carboxyl reimplements many internal implementation details compared to Material (notably, many effects have been rewritten/simplified). As such, Helios will look and act dramatically different than the standard Material style.

### Hydrogen

> "*I was forced to upgrade to Windows 11 a couple years ago. It's nice to remember the beauty of Windows 10's design.*"

Hydrogen is a style based off of Microsoft's Universal Design guidelines, notably used within Windows 10. It is designed to create a sleek, flat, desktop-oriented feel, mimicking the typical look & feel of a traditional Windows desktop.

- Carboxyl's primary changes to Hydrogen are found within its paletting.

### Trioxide

> "*yeah it really just looks like a Linux desktop from 1990*"

Trioxide is a style based off of Qt's Fusion style and KDE's design guidelines. It is designed to create a sleek, flat, desktop-oriented feel, mimicking the typical look & feel of a traditional Linux desktop.

- Many controls within Fusion are inadequate, don't follow proper theming, or just look bad. Trioxide intentionally reimplements large parts of the Fusion library for the sake of flexibility.

### Basalt

> "*I don't know how to describe this theme, I just like it a lot.*"

Basalt is a minimalist design style, based off of Qt's Basic style. It is designed to create a sleek, flat, desktop-oriented feel, taking up as few resources as possible while maintaining a proper look & feel.

- Basalt takes some inspiration from Graphide and Hydrogen.

### Ace (WIP)

Ace is a style based off of Microsoft's Aero Design guidelines, as well as Apple's Liquid Glass design philosophy. It is designed to create a glassy, bubbly feel, akin to Windows Vista and 7, *without* sacrificing readability or UX.

### Camphor (WIP)

Camphor is a unique style created by crueter. It is designed to be compact and flat, while maintaining a mobile-oriented look & feel.

### Cysteine (WIP)

Cysteine is a unique style created by crueter, based off of the Helios style. It is designed to define the bare minimum boundaries and layouts necessary to maintain clarity of its components.

### Tropic (WIP)

Tropic is a style based off of Apple's Aqua Design guidelines. It is designed to create a colorful, rounded, and translucent look & feel.

TODO:

- {Scroll,Split,Stack,Swipe}View
- GroupBox?
- ApplicationWindow
- Frame
- Page
- HeaderViews
- ToolBar
- Delegate types
- Indicator types
- TextArea
- Tumbler
- Menus
- Drawer
- Popups
- ToolTip
- Separators
