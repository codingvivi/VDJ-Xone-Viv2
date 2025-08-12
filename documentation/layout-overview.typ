#import "templates/text.typ":*
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                   page 1                                   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ contents ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
== Layout overview

Roughly speaking,
the top encoder section controls looping and beat jumps,
the left rotary potentiometer section controls the stem EQ,
the switch matrix section controls a range of deck and global controls,
and the bottom rotary section control browser, pitch and UI views. 
Shift retains it's use of providing access to alternate controls for a lot of inputs, 
the layer button accesses other command layers

#figure(
  image("K2-overview-full.svg")
)

Latch layers functionality does not use inbuilt, 
hardware-side,
layering system.
It's written from the ground up 
in VirtualDJ
and mimics inbuilt latch-layer setting 2.
That is,
the latch layer button changes the functionality of the button matrix A-P.
However, instead of cycling through 3 layers
by repeatedly pressing the latch layer button,
the button brings you to a menu page
where each of the buttons represents a unique layer. 
This makes for a total of 16 layers,
with 16 more theoretically possible
using the shift button.


Faders of both controllers //(4)
and the rotary potentiometer section //(2)
including the pot switches //(3)
of the right controller 
are completely unmapped, 
allowing for custom user mapping
in VirtualDJ 
or other software
(e.g. channel faders in Ableton,
controls of external FX,
etc).

#pagebreak()

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                   page 2                                   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~ helpers and settings ~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#set figure(
  supplement: none,
  //gap: 1em,
)

#set figure.caption(
  position: top,
)


#let boxstyling(
  side:str,
  upper-deck:str,
  upper-fill:color,
  lower-deck:str,
  lower-fill:color,
) = (
  side:side,
  upper-deck:upper-deck,
  upper-fill:upper-fill,
  lower-deck:lower-deck,
  lower-fill:lower-fill,
)

#let leftboxstyling = boxstyling(
    side:"left", 
    upper-deck: d1, 
    upper-fill:rgb("33b0ff"),
    lower-deck: d3,
    lower-fill: rgb("08bdba")
)

#let rightboxstyling = (
  side:"right", 
  upper-deck: d2, 
  upper-fill:rgb("ee5296"),
  lower-deck: d4,
  lower-fill: rgb("ffb784")
)



#let matrixlayoutfigures(
   boxstyling
) = {
  figure(
    caption: [#boxstyling.side K2 switch matrix],
    {

      image("K2-switch-matrix.svg", width: 95%)

      place(
        center + top,

        stack(
         
          let deckbox(fill: color, box-text:str) = {
            rect(
              width: 82%,
              height: 44.6%,
              radius: 7%,
              fill:fill.transparentize(34%),

              align( center + horizon, text(fill: white, box-text) )
            )
          },

          rect( height: 20.9%, stroke: none,),
          deckbox(fill: boxstyling.upper-fill, box-text: boxstyling.upper-deck),
          rect( height: 1.3%, stroke: none,),
          deckbox(fill: boxstyling.lower-fill, box-text: boxstyling.lower-deck),

        )
      )
    }
  )
}

#let encoderlayoutfigures(
  boxstyling
) = {

  figure(
    caption: [#boxstyling.side K2 top encoder section],
    {

      image("K2-encoder-top.svg",width: 95%)
      place(
        left + top,

        //top padding
        stack(
          rect( height: 62.6%, stroke: none,),
          //actual overlay stack
          stack(
            dir: ltr, 
              let deckbox(fill: color, box-text:str) = {
                rect(
                  width: 35%,
                  height: 49.4%,
                  radius: 7%,
                  fill:fill.transparentize(34%),

                  align( center + horizon, text(fill: white, box-text) )
                )
              },

          rect( width: 8.9%, stroke: none,),
          deckbox(fill: boxstyling.upper-fill, box-text: boxstyling.upper-deck),
          rect( width: 7.1%, stroke: none,),
          deckbox(fill: boxstyling.lower-fill, box-text: boxstyling.lower-deck),
          )
        ),

      )
    }
  )
}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ contents ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
With the exception of the stem EQ, 
controls targeting individual decks are split across the two controllers.

#figure(
  image("layoutVDJcut.png")
)

#grid(
  columns: (48%, 48%),
  rows: 111pt, // needs to be set for place to behave
  gutter: 1%,
  //stroke: red,
  matrixlayoutfigures(
   leftboxstyling
  ),

  matrixlayoutfigures(
   rightboxstyling
  ),
)
#v(0.5em)

The arrangement mimics the way decks are shown in performance mode
within VirtualDJ.
Deck controls are thus "stacked" vertically, 
instead of being lined up in columns horizontally like in most other mappings.


#grid(
  columns: (48%, 48%),
  rows: 86pt,
  gutter: 1%,

  encoderlayoutfigures(
    leftboxstyling
  ),
  encoderlayoutfigures(
   rightboxstyling
  ),
)
#v(0.5em)

The upper encoder section has the "top" deck on the left and the "bottom" deck on the right.


#pagebreak()
