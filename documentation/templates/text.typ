/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                   colors                                   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let emptygray = rgb("#525252")

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                    text                                    */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let unmapped-text = [#text(fill: emptygray, "N/A" )]
#let same-text = [#text(fill: emptygray, "Non shift" )]

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ deck targets ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let targettext(deck) = {
  if deck == "g" {
    "global"
  } 
  if deck == "l" {
    "local deck"
  } 
  if deck == "1" or deck == "2" or deck == "3" or deck == "4" or deck == "1 & 3" or deck == "2 & 4" {
    [deck #deck]
  }
}

#let dg = targettext("g")
#let dl = targettext("l")
#let d1 = targettext("1")
#let d2 = targettext("2")
#let d3 = targettext("3")
#let d4 = targettext("4")

#let d13 = targettext("1 & 3")
#let d24 = targettext("2 & 4")

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  symbols                                   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ encoder symbols ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let symbol-encp = sym.triangle.filled.b 
#let symbol-encr = sym.triangle.filled.l + sym.triangle.filled.r

#let write-symbols(cmdarray) = {
  cmdarray.enumerate().map(((index, value)) => {
    // Determine which content to prepend based on the index.
    let prepend = if index <= 4 {
      symbol-encp // Assumes 'encp' is defined
    } else {
      symbol-encr // Assumes 'encr' is defined
    }
    // Return the new, combined content for the new array.
    prepend + value
  }
)}

