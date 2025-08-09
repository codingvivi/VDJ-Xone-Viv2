#set page(
//  margin: 50pt,
//  flipped: true,
  fill: rgb("161616")
)

#set text(
  font: "Helvetica",
  fill: rgb("d0d0d0")
)

= Setup
  _to write_

= Controls

  == Layout basics
   #include "layout-basics.typ"

  == Top encoder section
    #include "encoders-top.typ"
//  #include "knobbuttons-left.typ"
//  #include "knobbuttons-right.typ"
//  #include "faders.typ"
//  #include "encoders-bottom.typ"
//  #include "layerpage.typ"
#pagebreak()
  == Button matrix pages
    === Layer Page
      #include "pageLayer.typ"
    === Page A
      //#include "pageA.typ"
