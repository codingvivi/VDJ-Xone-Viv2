#import "templates/text.typ": *
#import "templates/cmds-ins.typ": *
#import "templates/layouts.typ": *

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               duplicate vars                               */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

#let play = command(
    command-name: "Play",
    command-description: "",
    target: decklocal,
)


#let cue = command(
    command-name: "Cue",
    command-description: "",
    target: decklocal,
)


#let sync = command(
    command-name: "Sync",
    command-description: "",
    target: decklocal,
)


#let setmaster = command(
    command-name: "Set master",
    command-description: "",
    target: decklocal,
)


#let nudgef = command(
    command-name: "nudge >",
    command-description: "",
    target: decklocal,
)


#let nudgeb = command(
    command-name: "< nudge",
    command-description: "",
    target: decklocal,
)


#let slip = command(
  command-name: "slip",
  command-description: "",
  target: decklocal
)

#let reverse = command(
  command-name: "reverse",
  command-description: "",
  target: decklocal,
)

#let beginning = command(
  command-name: "jump start",
  command-description: "",
  target: decklocal,
)

#let editgrid = command(
  command-name: "edit grid",
  command-description: "",
  target: decklocal,
)

#let load = command(
  command-name: "load track",
  command-description: "",
  target: decklocal,
)

#let mastertempo = command(
  command-name: "master tempo",
  command-description: "",
  target: decklocal,
)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page contents                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
=== Page A - Play Commands
#dupebuttonmatrix(
  (
    cue, setmaster, nudgeb, nudgef,
    play, sync, slip, reverse
  ),
  (
    beginning, mastertempo, editgrid, load,
    sameInShift-command, sameInShift-command, sameInShift-command,sameInShift-command
  )
)

#pagebreak()
