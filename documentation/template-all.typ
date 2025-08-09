#import "template-text.typ":*
#import "template-cmds-ins.typ":*
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                            page content helpers                            */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ page content ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let cellayout(input) = {
  let command_line = {
  //add inputsymbol if it exists
    if "inputsymbol" in input {
      input.inputsymbol 
      h(0.3em) // spacing
    }
    input.command.command_name
  }

  block(grid(
    columns: 1,
    row-gutter: 3pt,
    align: center,

    [#command_line], 
    [#text(size: 8pt,)[_#input.target _]]
  ))
}    
  

#let encoderlayout(encoder) = {
  grid(
    columns: 1,
    gutter: 5pt,
    align: center,
    [#cellayout(encoder.push)],
    [#cellayout(encoder.turn)],
  )
}


#let buttonmatrixlayout(..buttons) = {
  //.pos creates array of all positional arguments
  //.map creates array transformed with function passed
  // each value gets stuck into btn
  let cells = buttons.pos().map(btn => cellayout(btn))
  grid(
    columns: (24%,24%,24%,24%,),
    row-gutter: 7pt,
    align: center,

    ..cells
  )
}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ page layout ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let controllerlayout(title: "", controls) = {
  set text(
    size: 8.5pt,
  )
  grid(
    columns: 1,
    align: center,
    gutter: 4pt,

    if title != ""{
      heading(
        level: 4,
        title
      )
    },
    controls
    )
}

#let verlayout(layouttitle:"", topcntrls, toptitle, bottomcntrls, bottomtitle) = {
  grid(
    if layouttitle != ""{
      align(center)[#heading(level:4, layouttitle)]
    },
    grid(
      columns: 1,
      gutter: 10pt,
      controllerlayout(title:toptitle, topcntrls),
      controllerlayout(title:bottomtitle, bottomcntrls)
    )
  )
}

#let horlayout(layouttitle: "", ltitle, lcntrls, rtitle, rcntrls,) = {
  grid(
    if layouttitle != ""{
      align(center)[#heading(level:4, layouttitle)]
    },
    grid(
      columns: (49%, 49%),
      gutter: 10pt,
      controllerlayout(title: ltitle, lcntrls),
      controllerlayout(title: rtitle, rcntrls)
    )
  )
}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                              layout templates                              */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~ shift mode layouts ~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let horshiftlayout(normal_cntrls, shift_cntrls) = { 
  horlayout("Normal", normal_cntrls, "Shift", shift_cntrls)
} 

#let vershiftlayout(normal_cntrls, shift_cntrls) = { 
  verlayout("Normal", normal_cntrls, "Shift", shift_cntrls)
} 

/* ~~~~~~~~~~~~~~~~~~~~ left and right controller layout ~~~~~~~~~~~~~~~~~~~~ */
#let hork2layout(normal_cntrls, shift_cntrls) = { 
  horlayout("Left controller", normal_cntrls, "Right controller", shift_cntrls)
} 

#let fulllayout(l_normal_cntrls, r_normal_cntrls, l_shift_cntrls,  r_shift_cntrls) = {
  heading(level: 3, "Normal mode")
  hork2layout(l_normal_cntrls, r_normal_cntrls)
  heading(level: 3, "Shift mode")
  hork2layout(l_shift_cntrls, r_shift_cntrls)
}
