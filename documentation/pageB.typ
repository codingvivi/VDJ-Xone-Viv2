#import "templates/text.typ": *
#import "templates/cmds-ins.typ": *
#import "templates/layouts.typ": *

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  commands                                  */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let slicer-pad = pad-command(
  command-name: "slicer pad",
  command-description:"",
  target-type: dl
)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page contents                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
=== Page B

#dupebuttonmatrix(
  create-pad-set(slicer-pad),
  create-duplicate-set(same-command)
)


#pagebreak()
