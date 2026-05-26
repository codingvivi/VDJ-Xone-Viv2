#import "templates/text.typ": *
#import "templates/cmds-ins.typ": *
#import "templates/layouts.typ": *

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  commands                                  */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let qfp(name) = command(
  command-name: name,
  command-description: "",
  target: global,
)

// Normal mode = stack buttons. Labels reflect default view (@$qfwin = 0):
// rows from top = +3, +2, +1, 0. Columns = banks E/H/D/P.
#let normal = (
  qfp("E +3"), qfp("H +3"), qfp("D +3"), qfp("P +3"),
  qfp("E +2"), qfp("H +2"), qfp("D +2"), qfp("P +2"),
  qfp("E +1"), qfp("H +1"), qfp("D +1"), qfp("P +1"),
  qfp("E 0"),  qfp("H 0"),  qfp("D 0"),  qfp("P 0"),
)

// Shift mode = range buttons (same default view).
#let shift = (
  qfp("E ≥3"),  qfp("H ≥3"),  qfp("D ≥3"),  qfp("P ≥3"),
  qfp("E ≥2"),  qfp("H ≥2"),  qfp("D ≥2"),  qfp("P ≥2"),
  qfp("E ≥1"),  qfp("H ≥1"),  qfp("D ≥1"),  qfp("P ≥1"),
  qfp("E 0r"),  qfp("H 0r"),  qfp("D 0r"),  qfp("P 0r"),
)

#let mkbtn(cmd) = button(command: cmd, target: global)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page contents                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
=== Page J — QFPro (default view)

QFPro stack/range across four banks: *E*nergy, *H*appy, *D*ance, *P*op.
Each column is one bank; each row is one offset value from the master tag
(stack adds only that value; range covers everything from master out to
that value).

Labels show the *default* view (`@\$qfwin = 0`), with rows +3/+2/+1/0 from
top. Either controller's bottom-right encoder cycles `@\$qfwin` 0↔3,
sliding the visible 4-row window through the virtual 7-row layout
(+3 down to −3). The row currently showing `0` blinks: green if range-0
engaged, orange if stack-0 engaged, red as a plain "this is 0" marker.

#lrk2-vertshift-layout(
  buttonmatrixlayout(..normal.map(mkbtn)),
  buttonmatrixlayout(..normal.map(mkbtn)),
  buttonmatrixlayout(..shift.map(mkbtn)),
  buttonmatrixlayout(..shift.map(mkbtn)),
)
#pagebreak()
