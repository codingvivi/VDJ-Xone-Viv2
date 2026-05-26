#import "templates/text.typ": *
#import "templates/cmds-ins.typ": *
#import "templates/layouts.typ": *
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               misc templates                               */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page commands                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let blankpage(letter) = command(
  command-name: text(fill: half-emptygray, "blank page"),
  command-description: "",
  target: unmapped-target,
  LED: none,
)

#let page-play = command(
  command-name: "play cntrl",
  command-description: "",
  target: decklocal,
)

#let page-slicer = command(
  command-name: "slicer",
  command-description: "",
  target: decklocal,
)

#let page-beatroll = command(
  command-name: "beat roll",
  command-description: "",
  target: decklocal,
)

#let page-keycue = command(
  command-name: "keycue",
  command-description: "",
  target: decklocal,
)

#let page-hotcue = command(
  command-name: "hotcues",
  command-description: "",
  target: decklocal,
)

#let page-cueloop = command(
  command-name: "cueloop",
  command-description: "",
  target: decklocal,
)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  buttons                                   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ normal mode ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
// left
#let buttonA-l-normal = button(
  command: page-play,
  target: deck13,
)

#let buttonB-l-normal = button(
  command: page-slicer,
  target: deck13,
)

#let buttonC-l-normal = button(
  command: page-beatroll,
  target: deck13,
)

#let buttonD-l-normal = button(
  command: page-keycue,
  target: deck13,
)

#let buttonE-l-normal = button(
  command: page-hotcue,
  target: deck13,
)

#let buttonF-l-normal = button(
  command: page-cueloop,
  target: deck13,
)

#let buttonG-l-normal = button(
  command: blankpage("G"),
  target: unmapped-target,
)

#let buttonH-l-normal = button(
  command: blankpage("H"),
  target: unmapped-target,
)

#let buttonI-l-normal = button(
  command: blankpage("I"),
  target: unmapped-target,
)

#let buttonJ-l-normal = button(
  command: blankpage("J"),
  target: unmapped-target,
)

#let buttonK-l-normal = button(
  command: blankpage("K"),
  target: unmapped-target,
)

#let buttonL-l-normal = button(
  command: blankpage("L"),
  target: unmapped-target,
)

#let buttonM-l-normal = button(
  command: blankpage("M"),
  target: unmapped-target,
)

#let buttonN-l-normal = button(
  command: blankpage("N"),
  target: unmapped-target,
)

#let buttonO-l-normal = button(
  command: blankpage("O"),
  target: unmapped-target,
)

#let buttonP-l-normal = button(
  command: blankpage("P"),
  target: unmapped-target,
)

//right
#let buttonA-r-normal = button(
  command: page-play,
  target: deck24,
)

#let buttonB-r-normal = button(
  command: page-slicer,
  target: deck24,
)

#let buttonC-r-normal = button(
  command: page-beatroll,
  target: deck24,
)

#let buttonD-r-normal = button(
  command: page-keycue,
  target: deck24,
)

#let buttonE-r-normal = button(
  command: page-hotcue,
  target: deck24,
)

#let buttonF-r-normal = button(
  command: page-cueloop,
  target: deck24,
)

#let buttonG-r-normal = button(
  command: blankpage("G"),
  target: unmapped-target,
)

#let buttonH-r-normal = button(
  command: blankpage("H"),
  target: unmapped-target,
)

#let buttonI-r-normal = button(
  command: blankpage("I"),
  target: unmapped-target,
)

#let buttonJ-r-normal = button(
  command: blankpage("J"),
  target: unmapped-target,
)

#let buttonK-r-normal = button(
  command: blankpage("K"),
  target: unmapped-target,
)

#let buttonL-r-normal = button(
  command: blankpage("L"),
  target: unmapped-target,
)

#let buttonM-r-normal = button(
  command: blankpage("M"),
  target: unmapped-target,
)

#let buttonN-r-normal = button(
  command: blankpage("N"),
  target: unmapped-target,
)

#let buttonO-r-normal = button(
  command: blankpage("O"),
  target: unmapped-target,
)

#let buttonP-r-normal = button(
  command: blankpage("P"),
  target: unmapped-target,
)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ shift mode ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
// left
#let buttonA-l-shift = sameInShift-button

#let buttonB-l-shift = sameInShift-button

#let buttonC-l-shift = sameInShift-button

#let buttonD-l-shift = sameInShift-button

#let buttonE-l-shift = sameInShift-button

#let buttonF-l-shift = sameInShift-button

#let buttonG-l-shift = sameInShift-button

#let buttonH-l-shift = sameInShift-button

#let buttonI-l-shift = sameInShift-button

#let buttonJ-l-shift = sameInShift-button

#let buttonK-l-shift = sameInShift-button

#let buttonL-l-shift = sameInShift-button

#let buttonM-l-shift = sameInShift-button

#let buttonN-l-shift = sameInShift-button

#let buttonO-l-shift = sameInShift-button

#let buttonP-l-shift = sameInShift-button

//right
#let buttonA-r-shift = sameInShift-button

#let buttonB-r-shift = sameInShift-button

#let buttonC-r-shift = sameInShift-button

#let buttonD-r-shift = sameInShift-button

#let buttonE-r-shift = sameInShift-button

#let buttonF-r-shift = sameInShift-button

#let buttonG-r-shift = sameInShift-button

#let buttonH-r-shift = sameInShift-button

#let buttonI-r-shift = sameInShift-button

#let buttonJ-r-shift = sameInShift-button

#let buttonK-r-shift = sameInShift-button

#let buttonL-r-shift = sameInShift-button

#let buttonM-r-shift = sameInShift-button

#let buttonN-r-shift = sameInShift-button

#let buttonO-r-shift = sameInShift-button

#let buttonP-r-shift = sameInShift-button

#let buttons-l-normal = (
  buttonA-l-normal,
  buttonB-l-normal,
  buttonC-l-normal,
  buttonD-l-normal,
  buttonE-l-normal,
  buttonF-l-normal,
  buttonG-l-normal,
  buttonH-l-normal,
  buttonI-l-normal,
  buttonJ-l-normal,
  buttonK-l-normal,
  buttonL-l-normal,
  buttonM-l-normal,
  buttonN-l-normal,
  buttonO-l-normal,
  buttonP-l-normal,
)

#let buttons-r-normal = (
  buttonA-r-normal,
  buttonB-r-normal,
  buttonC-r-normal,
  buttonD-r-normal,
  buttonE-r-normal,
  buttonF-r-normal,
  buttonG-r-normal,
  buttonH-r-normal,
  buttonI-r-normal,
  buttonJ-r-normal,
  buttonK-r-normal,
  buttonL-r-normal,
  buttonM-r-normal,
  buttonN-r-normal,
  buttonO-r-normal,
  buttonP-r-normal,
)

#let buttons-l-shift = (
  buttonA-l-shift,
  buttonB-l-shift,
  buttonC-l-shift,
  buttonD-l-shift,
  buttonE-l-shift,
  buttonF-l-shift,
  buttonG-l-shift,
  buttonH-l-shift,
  buttonI-l-shift,
  buttonJ-l-shift,
  buttonK-l-shift,
  buttonL-l-shift,
  buttonM-l-shift,
  buttonN-l-shift,
  buttonO-l-shift,
  buttonP-l-shift,
)

#let buttons-r-shift = (
  buttonA-r-shift,
  buttonB-r-shift,
  buttonC-r-shift,
  buttonD-r-shift,
  buttonE-r-shift,
  buttonF-r-shift,
  buttonG-r-shift,
  buttonH-r-shift,
  buttonI-r-shift,
  buttonJ-r-shift,
  buttonK-r-shift,
  buttonL-r-shift,
  buttonM-r-shift,
  buttonN-r-shift,
  buttonO-r-shift,
  buttonP-r-shift,
)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page contents                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

=== Layer Page - Menu <layers>
Pressing the layer button on any of the other pages
takes you to this page.
Pushing any of the switches
A-P
takes the user to the switch's associated page of commands.

//#prepend-page-letter(buttons-l-normal)

#lrk2-vertshift-layout(
  buttonmatrixlayout(
    ..prepend-page-letter(buttons-l-normal),
  ),

  buttonmatrixlayout(
    ..prepend-page-letter(buttons-r-normal),
  ),

  buttonmatrixlayout(
    ..prepend-page-letter(buttons-l-shift),
  ),

  buttonmatrixlayout(
    ..prepend-page-letter(buttons-r-shift),
  ),
)

#pagebreak()
