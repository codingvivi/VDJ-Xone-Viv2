#import "templates/text.typ": *
#import "templates/cmds-ins.typ": *
#import "templates/layouts.typ": *

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  commands                                  */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let qf(n) = command(
  command-name: "Quick Filter " + str(n),
  command-description: "",
  target: global,
)

#let normal = (
  qf(1), qf(2), qf(3), qf(4),
  unmapped-command, unmapped-command, unmapped-command, unmapped-command,
  unmapped-command, unmapped-command, unmapped-command, unmapped-command,
  unmapped-command, unmapped-command, unmapped-command, unmapped-command,
)

#let shift = (
  sameInShift-command, sameInShift-command, sameInShift-command, sameInShift-command,
  sameInShift-command, sameInShift-command, sameInShift-command, sameInShift-command,
  sameInShift-command, sameInShift-command, sameInShift-command, sameInShift-command,
  sameInShift-command, sameInShift-command, sameInShift-command, sameInShift-command,
)

#let mkbtn(cmd) = {
  let tgt = if cmd == unmapped-command { unmapped-target }
            else if cmd == sameInShift-command { sameInShift-target }
            else { global }
  button(command: cmd, target: tgt)
}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page contents                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
=== Page I — Quick Filters 1–4

Triggers VirtualDJ's built-in Quick Filters. Resolved filter index =
`button_number + @\$qfoffset`. `@\$qfoffset` is initialised in `ONINIT`
(default `-1`) — change it there to shift the mapped range without editing
each button.

#lrk2-vertshift-layout(
  buttonmatrixlayout(..normal.map(mkbtn)),
  buttonmatrixlayout(..normal.map(mkbtn)),
  buttonmatrixlayout(..shift.map(mkbtn)),
  buttonmatrixlayout(..shift.map(mkbtn)),
)
#pagebreak()
