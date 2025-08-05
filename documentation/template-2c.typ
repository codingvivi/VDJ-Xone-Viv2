#import "template-all.typ": *
#let fullcontroller(
  title,

  etp1, etp2, etp3, etp4,
  et1, et2, et3 ,et4,

  k1-1, k1-2, k1-3, k1-4,
  b1-1, b1-2, b1-3, b1-4,

  k2-1, k2-2, k2-3, k2-4,
  b2-1, b2-2, b2-3, b2-4,

  k3-1, k3-2, k3-3, k3-4,
  b3-1, b3-2, b3-3, b3-4,

  f1, f2, f3, f4,

  a, b, c, d,
  e, f, g, h,
  i, j, k, l,
  m, n, o, p,

  ebp1, ebp2,
  layer, eb1, eb2, shift
) = {
  set text(
    size: 8.5pt,
  )
  grid(
    columns: 1,
    align: center,

    heading(
      level: 4,
      title
    ),
      table(
        columns: (25%, 25%, 25%, 25%),
        stroke: none,
        align: center,
        
         encp + etp1,  encp + etp2,  encp + etp3,  encp + etp4,
         encr + et1,  encr + et2,  encr + et3,  encr + et4, 

        k1-1, k1-2, k1-3, k1-4,
        b1-1, b1-2, b1-3, b1-4,

        k2-1, k2-2, k2-3, k2-4,
        b2-1, b2-2, b2-3, b2-4,

        k3-1, k3-2, k3-3, k3-4,
        b3-1, b3-2, b3-3, b3-4,

        [], [], [], [], 
        f1, f2, f3, f4,

        [], [], [], [], 
        a, b, c, d,
        e, f, g, h,
        i, j, k, l,
        m, n, o, p,

        [],  encp + ebp1,  encp + ebp2, [],
        layer,  encr + eb1,  encr + eb2, shift
      )
  )
}

#let dualcontrollers(lwsleft, lwsright) = {
  grid(
    columns: (50%, 50%,),
    row-gutter: 5pt,
    column-gutter: 20pt,

    heading(level: 3, "Left controller"), heading(level: 3, "Right controller"),
    lwsleft, lwsright
  )
}

// ----------------------------------------------------------------------------- 
#let unmappedmiddle = ()
#for value in range(28) {
  unmappedmiddle.push(unmapped)
}

// ---- Left controller ----
// Normal
#let sharedcmds_top_left = arguments(

  [Normal],

  [jump length] + dg, [set loop], unmapped, [set loop] + d3,
  [long jump] + d1, [loop length] + d1, [long jump], [loop length] + d3,

  ..unmappedmiddle, 
)

#let sharedcmds_bottom_left = arguments(

    [add folder to favorites], [add to sidelist],
    unmapped, [scroll folders], [scroll songs], [shift]
)
// Shift
#let sharedcmds_top_left_shift = arguments(
  [Shift],

  unmapped, same + [\ \ ], unmapped, same + [\ \ ],
  [short jump] + d1, [move loop] + d1, [short jump] + d3, [move loop] +d3,

  ..unmappedmiddle,
)

#let sharedcmds_bottom_left_shift = arguments(
  [ebp1], [ebp2],
  unmapped, same, [BPM -/+ \ _masterdeck_ ], [shift]
)


// ---- Right controller ----
// Normal
#let sharedcmds_top_right = arguments(

  [Normal],

  unmapped, [set loop] + d2, unmapped, [set loop] + d4,
  [long jump] + d2, [loop length], [long jump] + d4, [loop length],

  ..unmappedmiddle,
)
#let sharedcmds_bottom_right = arguments(

    [add folder to favorites], [browser view],
    unmapped, unmapped, [waveform zoom], [shift]
)

//shift
#let sharedcmds_top_right_shift = arguments(
  [Shift],

  unmapped, same + [ \ \ ], unmapped, same + [ \ \ ],
  [short jump] + d2, [move loop] + d2, [short jump] + d4, [move loop] + d4,

  ..unmappedmiddle,
)

#let sharedcmds_bottom_right_shift = arguments(
  unmapped, same,
  unmapped, [scroll sidebar], [font size], [shift]
)

//layout of full page
#let controllerpage(
  cntrls_left, 
  cntrls_left_shift, 
  description_left,
  cntrls_right, 
  cntrls_right_shift,
  description_right
) = {

  horlayout(
    "Left controller",
    layouttable( 
      ..sharedcmds_top_left,
  
      ..cntrls_left, 
  
      ..sharedcmds_bottom_left
    ),
  
    layouttable( 
  
      ..sharedcmds_top_left_shift,
  
      ..cntrls_left_shift, 
  
      ..sharedcmds_bottom_left_shift,
    )
  )
  heading(level: 4, "Description")
  columns(2, description_left)
  pagebreak()
  
  horlayout(
    "Right controller",
    layouttable( 
      ..sharedcmds_top_right,
  
      ..cntrls_right, 
  
      ..sharedcmds_bottom_right
    ),
  
    layouttable( 
  
      ..sharedcmds_top_right_shift,
  
  
      ..cntrls_right_shift, 
  
  
      ..sharedcmds_bottom_right_shift,
    )
  )
  heading(level: 4, "Description")
  columns(2, description_right)
}
//writes decks to cells and returns array
#let writedeck(dbm, decktarget) = {
  for value in range(8) {
    ( dbm.at(value) += decktarget)
  }
  dbm
}

//full layout of page with duplicated controls 
//across 4 halves
#let cp_duplicatehalves(
  page_name, 
  page_title, 
  halfdupebuttonmatrix,
  halfdupebuttonmatrix_shift,
  description
) = [
  == Page #page_name: #page_title
  //create arrays with deck targets in them
  #let top_left = {writedeck((..halfdupebuttonmatrix), d1)}
  #let top_left_shift = {writedeck((..halfdupebuttonmatrix_shift), d1)}
  #let bottom_left = {writedeck((..halfdupebuttonmatrix), d3)}
  #let bottom_left_shift = {writedeck((..halfdupebuttonmatrix_shift), d3)}
  #let top_right = {writedeck((..halfdupebuttonmatrix), d2)}
  #let top_right_shift = {writedeck((..halfdupebuttonmatrix_shift), d2)}
  #let bottom_right = {writedeck((..halfdupebuttonmatrix), d4)}
  #let bottom_right_shift = {writedeck((..halfdupebuttonmatrix_shift), d4)}
  // Create layout pages from arrays above
  #controllerpage(
    (..top_left, ..bottom_left),
    (..top_left_shift, ..bottom_left_shift),
    description,

    (..top_right, ..bottom_right),
    (..top_right_shift, ..bottom_right_shift),

  )

]
