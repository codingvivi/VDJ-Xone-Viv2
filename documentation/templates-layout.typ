#import "template-text.typ":*
#import "templates-cmds-ins.typ":*

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                            page content helpers                            */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ cell arrangement ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let cellayout(input) = {
//  let command-line = {
//  //add inputsymbol if it exists
//    if "inputsymbol" in input {
//      input.inputsymbol 
//      h(0.3em) // spacing
//    }
//      input.command.command-name
//  }

  // grid for symbol and text
  grid(
    columns: 2,
    align: horizon,

    if "inputsymbol" in input {
      input.inputsymbol 
      h(0.3em) // spacing
    },

    //grid for input and target
    grid(
      columns: 1,
      row-gutter: 3pt,
      align: center,

      // command-line
      input.command.page-name,
      input.command.command-name,
      text(size: 7.4pt,)[_#input.target _]
    )
  )
}    
  

#let encoderlayout(encoder) = {
  grid(
    columns: 2,

    grid(
      columns: 1,
      gutter: 5pt,
      align: center,
      [#cellayout(encoder.push)],
      [#cellayout(encoder.turn)],
    )
  )
}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ cell groupings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
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

#let layout-encoder-top-half(e1, e2, e3, e4 ) = {
   grid(
    columns: 4,
    gutter: 6pt,
    align: center,
    encoderlayout(e1),
    encoderlayout(e2),
    encoderlayout(e3),
    encoderlayout(e4),
  ) 
}
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~ control groupings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let controlgrouping(title: "", controls) = {
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

#let verticalgroupingpair(
  layouttitle:"", topcntrls, toptitle, bottomcntrls, bottomtitle
) = {
  grid(
    if layouttitle != ""{
      align(center)[#heading(level:4, layouttitle)]
    },
    grid(
      columns: 1,
      gutter: 10pt,
      controlgrouping(title:toptitle, topcntrls),
      controlgrouping(title:bottomtitle, bottomcntrls)
    )
  )
}

#let horizontalgroupingpair(layouttitle: "", ltitle, lcntrls, rtitle, rcntrls,) = {
  grid(
    if layouttitle != ""{
      align(center)[#heading(level:4, layouttitle)]
    },
    grid(
      columns: (49%, 49%),
      gutter: 10pt,
      controlgrouping(title: ltitle, lcntrls),
      controlgrouping(title: rtitle, rcntrls)
    )
  )
}

#let quadgroups(
  heading-section-1, 
  heading-l-1, l-1-cntrls, 
  heading-r-1, r-1-cntrls, 

  heading-section-2, 
  heading-l-2, l-2-cntrls, 
  heading-r-2, r-2-cntrls
) = {
  heading(level: 3, heading-section-1)
  horizontalgroupingpair(heading-l-1, l-1-cntrls, heading-l-2, r-1-cntrls)
  heading(level: 3, heading-section-2)
  horizontalgroupingpair(heading-r-1, l-2-cntrls, heading-r-2, r-2-cntrls)
}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                              layout templates                              */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~ shift mode layouts ~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let horshiftlayout(normal-cntrls, shift-cntrls) = { 
  horizontalgroupingpair("Normal", normal-cntrls, "Shift", shift-cntrls)
} 

#let vershiftlayout(normal-cntrls, shift-cntrls) = { 
  verticalgroupingpair("Normal", normal-cntrls, "Shift", shift-cntrls)
} 

/* ~~~~~~~~~~~~~~~~~~~~ left and right controller layout ~~~~~~~~~~~~~~~~~~~~ */
#let hork2layout(normal-cntrls, shift-cntrls) = { 
  horizontalgroupingpair("Left controller", normal-cntrls, "Right controller", shift-cntrls)
} 

#let lrk2-vertshift-layout(
  l-normal-cntrls, r-normal-cntrls, 
  l-shift-cntrls,  r-shift-cntrls
) = quadgroups(
  "Normal mode",
  "Left controller", l-normal-cntrls,
  "Right controller", r-normal-cntrls,

  "Shift mode",
  "Left controller", l-shift-cntrls,
  "Right controller", r-shift-cntrls,
)


