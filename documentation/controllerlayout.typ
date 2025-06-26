#let action(
  command,
  color: none,
  target: none
) = {
  table.cell(
    fill: color,
    [#command] + if target != none {
      [\  #text(style: "italic")[#target]] 
    }
  )
}
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
  let encp = [\ ] + sym.triangle.filled.b 
  let encr = [\ ] + sym.triangle.filled.l + sym.triangle.filled.r

  set text(
      size: 10pt
  )

  grid(
    columns: 1,
    align: center,

    heading(
      level: 4,
      title
    ),
      table(
        columns: 4,
        stroke: none,
        align: center,
        
        etp1 + encp, etp2 + encp, etp3 + encp, etp4 + encp,
        et1 + encr, et2 + encr, et3 + encr, et4 + encr, 

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

        [], ebp1 + encp, ebp2 + encp, [],
        layer, eb1 + encr, eb2 + encr, shift
      )
  )
}


#let layoutwithshift(normaltable, shiftable) = {
  grid(
    columns: 1,
    row-gutter: 10pt,
    normaltable,
    shiftable,
  )
}

#let dualcontrollers(lwsleft, lwsright) = {
  grid(
    columns: 2,
    row-gutter: 5pt,
    column-gutter: 20pt,

    heading(level: 3, "Left controller"), heading(level: 3, "Right controller"),
    lwsleft, lwsright
  )
}

