#import "templates/text.typ": *
#import "templates/cmds-ins.typ": *
#import "templates/layouts.typ": *

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  commands                                  */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

#let padname = pad-command(
  command-name: str, 
  command-description: none, 
  target-type: str,
  LED: none,
)


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page contents                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
=== Page name

#dupebuttonmatrix(
  create-pad-set(padname),

  //shift mode pad
  create-duplicate-set(same-command)
 // create-padpset(padname),
)

#pagebreak()
