#let layouttable(
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
  let encp =  sym.triangle.filled.b + [\ ]
  let encr = sym.triangle.filled.l + sym.triangle.filled.r + [\ ]

  set text(
    size: 8.5pt,
    font: "Helvetica"
  )

// let action(
//   command,
//   color: none,
//   target: none
// ) = {
//   table.cell(
//     fill: color,
//     [#command] + [\  #text(style: "italic", size: 8pt)[#target]] 
//   )
// }
  
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


#let verlayoutshift(normaltable, shiftable) = {
  grid(
    columns: 1,
    row-gutter: 10pt,
    normaltable,
    shiftable,
  )
}

#let horlayoutshift(controllertitle, normaltable, shiftable) = {
  heading(
    level: 4,
    controllertitle
  )
  grid(
    columns: (49%, 49%),
    column-gutter: 20pt,
    normaltable, shiftable,
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
#let unmapped = [#text(fill: gray, "N/A" )]

#let same = [#text(fill: gray, "Non-shift" )]

#let target(deck) = {
  if deck == "g" {
    [\ _global_]
  } else {
    [\ _deck #deck _]
  }
}

#let d1 = target("1")
#let d2 = target("2")
#let d3 = target("3")
#let d4 = target("4")

#let d13 = target("1&3")
#let d24 = target("2&4")

// ----------------------------------------------------------------------------- 
#let unmappedmiddle = ()
#for value in range(28) {
  unmappedmiddle.push(unmapped)
}

#let lsharedtopcmds = arguments(

  [Normal],

  [jump length \ _global_], [set loop \ _deck 1_], unmapped, [set loop \ _deck 3_],
  [long jump \ _deck 1_], [loop length \ _deck 1_], unmapped, [loop length \ _deck 3_],

  ..unmappedmiddle, 
)

#let lsharedbottomcmds = arguments(

    [add folder to favorites], [add to sidelist],
    unmapped, [scroll folders], [scroll songs], [shift]
)

#let lsharedtopcmdsshift = arguments(
  [Shift],

  [jump length \ _global_], [set loop \ _deck 1_], unmapped, [set loop \ _deck 3_],
  [long jump \ _deck 1_], [loop length \ _deck 1_], unmapped, [loop length \ _deck 3_],

  unmapped, unmapped, unmapped, unmapped,
  unmapped, unmapped, unmapped, unmapped,

  unmapped, unmapped, unmapped, unmapped,
  unmapped, unmapped, unmapped, unmapped,

  unmapped, unmapped, unmapped, unmapped,
  unmapped, unmapped, unmapped, unmapped,
  

  unmapped, unmapped, unmapped, unmapped,
)

#let lsharedbottomcmdsshift = arguments(
  [ebp1], [ebp2],
  unmapped, same, [BPM -/+ \ _masterdeck_ ], [shift]
)



#let rsharedtopcmds = arguments(

  [Normal],

  [jump length \ _global_], [set loop \ _deck 2_], unmapped, [set loop \ _deck 4_],
  [long jump \ _deck 2_], [loop length \ _deck 2_], unmapped, [loop length \ _deck 4_],

  unmapped, unmapped, unmapped, unmapped,
  unmapped, unmapped, unmapped, unmapped,

  unmapped, unmapped, unmapped, unmapped,
  unmapped, unmapped, unmapped, unmapped,

  unmapped, unmapped, unmapped, unmapped,
  unmapped, unmapped, unmapped, unmapped,
  

  unmapped, unmapped, unmapped, unmapped,

)

#let rsharedbottomcmds = arguments(

    [add folder to favorites], [browser view],
    unmapped, unmapped, [waveform zoom], [shift]
)

#let rsharedtopcmdsshift = arguments(
  [Shift],

  unmapped, same, unmapped, [set loop \ _deck 4_],
  [short jump \ _deck 2_], [move loop \ _deck 2_], unmapped, [loop length \ _deck 4_],

  unmapped, unmapped, unmapped, unmapped,
  unmapped, unmapped, unmapped, unmapped,

  unmapped, unmapped, unmapped, unmapped,
  unmapped, unmapped, unmapped, unmapped,

  unmapped, unmapped, unmapped, unmapped,
  unmapped, unmapped, unmapped, unmapped,
  

  unmapped, unmapped, unmapped, unmapped,
)

#let rsharedbottomcmdsshift = arguments(
  unmapped, same,
  unmapped, [scroll sidebar], [font size], [shift]
)
