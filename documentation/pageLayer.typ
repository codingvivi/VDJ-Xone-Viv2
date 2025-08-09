#import "templates-text.typ":*
#import "templates-cmds-ins.typ":*
#import "templates-layout.typ":*
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               misc templates                               */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page commands                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let blankpage(letter) = command(
    command-name:  text(fill: rgb("#aaaaaa"), "blank"),
    command-description:"", 
    target-type: unmapped-text,
    LED: none
)

#let pageA = command(
    command-name: "play controls",
    command-description: "",
    target-type: dl
)


#let pageB = command(
    command-name: "slicer",
    command-description: "",
    target-type: dl
)


#let pageC = command(
    command-name: "beat roll",
    command-description: "",
    target-type: dl
)


#let pageD = command(
    command-name: "keycue",
    command-description: "",
    target-type: dl
)


#let pageE = command(
    command-name: "hotcues",
    command-description: "",
    target-type: dl
)


#let pageF = command(
    command-name: "cueloop",
    command-description: "",
    target-type: dl
)


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  buttons                                   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ normal mode ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
// left
#let buttonA-l-normal = button(
  command: pageA,
  target: d13
)

#let buttonB-l-normal = button(
  command: pageB,
  target: d13
)

#let buttonC-l-normal = button(
  command: pageC,
  target: d13,
)

#let buttonD-l-normal = button(
  command: pageD,
  target: d13,
)

#let buttonE-l-normal = button(
  command: pageE,
  target: d13,
)

#let buttonF-l-normal = button(
  command: pageF,
  target: d13,
)

#let buttonG-l-normal = button(
  command: blankpage("G"),
  target: unmapped-text,
)

#let buttonH-l-normal = button(
  command: blankpage("H"),
  target: unmapped-text,
)

#let buttonI-l-normal = button(
  command: blankpage("I"),
  target: unmapped-text,
)

#let buttonJ-l-normal = button(
  command: blankpage("J"),
  target: unmapped-text,
)

#let buttonK-l-normal = button(
  command: blankpage("K"),
  target: unmapped-text,
)

#let buttonL-l-normal = button(
  command: blankpage("L"),
  target: unmapped-text,
)

#let buttonM-l-normal = button(
  command: blankpage("M"),
  target: unmapped-text,
)

#let buttonN-l-normal = button(
  command: blankpage("N"),
  target: unmapped-text,
)

#let buttonO-l-normal = button(
  command: blankpage("O"),
  target: unmapped-text,
)

#let buttonP-l-normal = button(
  command: blankpage("P"),
  target: unmapped-text,
)

//right
#let buttonA-r-normal = button(
  command: pageA,
  target: d24
)

#let buttonB-r-normal = button(
  command: pageB,
  target: d24
)

#let buttonC-r-normal = button(
  command: pageC,
  target: d24,
)

#let buttonD-r-normal = button(
  command: pageD,
  target: d24,
)

#let buttonE-r-normal = button(
  command: pageE,
  target: d24,
)

#let buttonF-r-normal = button(
  command: pageF,
  target: d24,
)

#let buttonG-r-normal = button(
  command: blankpage("G"),
  target: unmapped-text,
)

#let buttonH-r-normal = button(
  command: blankpage("H"),
  target: unmapped-text,
)

#let buttonI-r-normal = button(
  command: blankpage("I"),
  target: unmapped-text,
)

#let buttonJ-r-normal = button(
  command: blankpage("J"),
  target: unmapped-text,
)

#let buttonK-r-normal = button(
  command: blankpage("K"),
  target: unmapped-text,
)

#let buttonL-r-normal = button(
  command: blankpage("L"),
  target: unmapped-text,
)

#let buttonM-r-normal = button(
  command: blankpage("M"),
  target: unmapped-text,
)

#let buttonN-r-normal = button(
  command: blankpage("N"),
  target: unmapped-text,
)

#let buttonO-r-normal = button(
  command: blankpage("O"),
  target: unmapped-text,
)

#let buttonP-r-normal = button(
  command: blankpage("P"),
  target: unmapped-text,
)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ shift mode ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
// left
#let buttonA-l-shift = same-button

#let buttonB-l-shift = same-button

#let buttonC-l-shift = same-button

#let buttonD-l-shift = same-button

#let buttonE-l-shift = same-button

#let buttonF-l-shift = same-button

#let buttonG-l-shift = same-button

#let buttonH-l-shift = same-button

#let buttonI-l-shift = same-button

#let buttonJ-l-shift = same-button

#let buttonK-l-shift = same-button

#let buttonL-l-shift = same-button

#let buttonM-l-shift = same-button

#let buttonN-l-shift = same-button

#let buttonO-l-shift = same-button

#let buttonP-l-shift = same-button

//right
#let buttonA-r-shift = same-button

#let buttonB-r-shift = same-button

#let buttonC-r-shift = same-button

#let buttonD-r-shift = same-button

#let buttonE-r-shift = same-button

#let buttonF-r-shift = same-button

#let buttonG-r-shift = same-button

#let buttonH-r-shift = same-button

#let buttonI-r-shift = same-button

#let buttonJ-r-shift = same-button

#let buttonK-r-shift = same-button

#let buttonL-r-shift = same-button

#let buttonM-r-shift = same-button

#let buttonN-r-shift = same-button

#let buttonO-r-shift = same-button

#let buttonP-r-shift = same-button

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ page contents ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#lrk2-vertshift-layout(
  buttonmatrixlayout(
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
  ),

  buttonmatrixlayout(
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
  ),

  buttonmatrixlayout(
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
  ),

  buttonmatrixlayout(
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
)
