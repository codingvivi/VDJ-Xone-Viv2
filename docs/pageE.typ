#import "templates/text.typ": *
#import "templates/cmds-ins.typ": *
#import "templates/layouts.typ": *

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  commands                                  */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

#let hotcue = pad-command(
  command-name: "hotcue", 
  command-description: [
    Recalls accordingly numbered hotcue
    or,
    if it doesn't exist,
    stores hotcue
    at the current play marker location.
  ],
  target: decklocal,
  LED: none,
)

#let deletehotcue = pad-command(

  command-name: "delete hc", 
  command-description: [
    Deletes stored hotcue of according number,
    if it exists
  ],
  target: decklocal,
  LED: none,

)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page contents                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
=== Page E - Hotcue

#dupebuttonmatrix(

  //normal mode pad
  create-pad-set(hotcue),

  //shift mode pad
  //create-duplicate-set(same-command)
  create-pad-set(deletehotcue),
)

#pagebreak()
