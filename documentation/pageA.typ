#import "templates/text.typ": *
#import "templates/cmds-ins.typ": *
#import "templates/layouts.typ": *

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               duplicate vars                               */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

#let play = command(
    command-name: "Play",
    command-description: "",
    target-type: dl,
)


#let cue = command(
    command-name: "Cue",
    command-description: "",
    target-type: dl,
)


#let sync = command(
    command-name: "Sync",
    command-description: "",
    target-type: dl,
)


#let setmaster = command(
    command-name: "Set master",
    command-description: "",
    target-type: dl,
)


#let nudgef = command(
    command-name: "nudge >",
    command-description: "",
    target-type: dl,
)


#let nudgeb = command(
    command-name: "< nudge",
    command-description: "",
    target-type: dl,
)


#let slip = command(
  command-name: "slip",
  command-description: "",
  target-type: dl
)

#let reverse = command(
  command-name: "reverse",
  command-description: "",
  target-type: dl,
)

#let beginning = command(
  command-name: "jump start",
  command-description: "",
  target-type: dl,
)

#let editgrid = command(
  command-name: "edit grid",
  command-description: "",
  target-type: dl,
)

#let load = command(
  command-name: "load track",
  command-description: "",
  target-type: dl,
)

#let mastertempo = command(
  command-name: "master tempo",
  command-description: "",
  target-type: dl,
)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page contents                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
= Page A
#dupebuttonmatrix(
  (
    cue, setmaster, nudgeb, nudgef,
    play, sync, slip, reverse
  ),
  (
    beginning, mastertempo, editgrid, load,
    unmapped-command, unmapped-command, unmapped-command, unmapped-command
  )
)

#pagebreak()
