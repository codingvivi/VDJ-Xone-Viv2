#import "full2ctemplate.typ": controllerpage, d13, d24, same


== Layer page 
#let blank = {text(fill: gray, "blank")}

#let dupebuttonmatrix = (
  [page A: \ play cntrl], [page B: \ slicer], [page C: \ beat roll], [page D: \ keycue],
  [page E: \ hotcues], [page F: \ cueloop], [page G: \ #blank], [page H: \ #blank],
  [page I: \ browser], [page J: \ #blank], [page K: \ #blank], [page L: \ #blank],
  [page M: \ #blank], [page N: \ #blank], [page O: \ deck opts], [page P: \ master opts],
)

#let leftdbm = (..dupebuttonmatrix)

#for value in range(8) {
  //adds deck
  ( leftdbm.at(value) += d13)
}


#let rightdbm = (..dupebuttonmatrix)
#for value in range(8) {
  //adds deck
  ( rightdbm.at(value) += d24)
}

#let shiftbuttonmatrix = ()
#for value in range(16) {
  shiftbuttonmatrix.push(same + [ \ \ \ ])
}
#controllerpage(
  leftdbm,
  shiftbuttonmatrix,
  [],

  rightdbm,
  shiftbuttonmatrix,
  [],
)
