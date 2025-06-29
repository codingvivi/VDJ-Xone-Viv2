#import "controllerlayout.typ": *


== Layer page 
#let blank = {text(fill: gray, "blank")}

#let dupebuttonmatrix = (
  [page A: \ play controls] + d13, [page B: \ slicer], [page C: \ beat roll], [page D: \ keycue],
  [page E: \ hotcues], [page F: \ cueloop], [page G: \ #blank], [page H: \ #blank],
  [page I: \ browser], [page J: \ #blank], [page K: \ #blank], [page L: \ #blank],
  [page M: \ #blank], [page N: \ #blank], [page O: \ deck opts], [page P: \ master opts],
)


#let shiftbuttonmatrix = ()
#for value in range(16) {
  shiftbuttonmatrix.push(same + [ \ \ \ ])
}
#horlayoutshift(
  "Left controller",
  layouttable( 
    ..lsharedtopcmds,

    ..dupebuttonmatrix, 

    ..lsharedbottomcmds
  ),

  layouttable( 

    ..lsharedtopcmdsshift,

    ..shiftbuttonmatrix, 

    ..lsharedbottomcmdsshift,
  )
)

#pagebreak()

#horlayoutshift(
  "Right controller",
  layouttable( 
    ..rsharedtopcmds,

    ..dupebuttonmatrix, 

    ..rsharedbottomcmds
  ),

  layouttable( 

    ..rsharedtopcmdsshift,


    ..shiftbuttonmatrix, 


    ..rsharedbottomcmdsshift,
  )
)

