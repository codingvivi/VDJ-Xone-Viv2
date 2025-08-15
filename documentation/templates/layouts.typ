#import "text.typ":*
#import "cmds-ins.typ":*

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
// for pad commands, 
// this creates an array
// to be passed to the buttonmatrixlayout function


#let buttonmatrixlayout(..buttons) = {
  //.pos creates array of all positional arguments
  //.map creates array transformed with function passed
  // each value gets stuck into btn
  let cells = buttons.pos().map(btn => cellayout(btn))
  grid(
    columns: (25%,25%,25%,25%,),
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
#let controlgrouping(title: "", framecolor: none, controls) = {
  set text(
    size: 8.5pt,
  )
  grid(
    columns: 1,
    align: center,
    gutter: 4pt,

    if title != ""{
      heading(
        level: 5,
        title
      )
    },
    grid.cell( 
//      stroke: framecolor,
      controls
    )
  )
}

#let verticalgroupingpair(
  layouttitle:"",
  topcntrls,
  toptitle,
  bottomcntrls,
  bottomtitle
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

#let horizontalgroupingpair(
  layouttitle: "",
  upperframecolor:none,
  lowerframecolor:none,
  ltitle,
  lcntrls,
  rtitle,
  rcntrls
) = {
  grid(
    if layouttitle != ""{
      //align(center)[#heading(level:4, layouttitle)]
      heading(level:4, layouttitle)
    },
    grid(
      columns: (49%, 49%),
      gutter: 10pt,
      controlgrouping(framecolor: upperframecolor, title: ltitle, lcntrls),
      controlgrouping(framecolor: lowerframecolor, title: rtitle, rcntrls)
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

  horizontalgroupingpair(
    upperframecolor: deck1-color,
    lowerframecolor: deck3-color,
    layouttitle: heading-section-1, 
    heading-l-1, l-1-cntrls, 
    heading-r-1, r-1-cntrls
  )

  horizontalgroupingpair(
    upperframecolor: deck2-color,
    lowerframecolor: deck4-color,
    layouttitle: heading-section-2,
    heading-l-2, l-2-cntrls,
    heading-r-2, r-2-cntrls
  )
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
  horizontalgroupingpair(
    "Left controller", normal-cntrls,
    "Right controller", shift-cntrls
  )
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

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                       hardcoded duplicate templates                        */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let dupebuttonmatrix(normal-commands, shift-commands) = {

  let createbutton(cmd, deck) = {
    let returnbutton = button(
      command: cmd,
      target: {
        if cmd == unmapped-command {
          unmapped-text
        } 
        if cmd == same-command {
          same-text 
        } else {
          deck
        }
      }
    )
    returnbutton
  }

  let d1-n-buttons = normal-commands.map(cmd => createbutton(cmd, d1))
  let d2-n-buttons = normal-commands.map(cmd => createbutton(cmd, d2))
  let d3-n-buttons = normal-commands.map(cmd => createbutton(cmd, d3))
  let d4-n-buttons = normal-commands.map(cmd => createbutton(cmd, d4))

  let d1-s-buttons = shift-commands.map(cmd => createbutton(cmd, d1))
  let d2-s-buttons = shift-commands.map(cmd => createbutton(cmd, d2))
  let d3-s-buttons = shift-commands.map(cmd => createbutton(cmd, d3))
  let d4-s-buttons = shift-commands.map(cmd => createbutton(cmd, d4))

  let left-normal-commands = (d1-n-buttons + d3-n-buttons)
  let right-normal-commands = (d2-n-buttons+ d4-n-buttons)

  let left-shift-commands = (d1-s-buttons + d3-s-buttons)
  let right-shift-commands = (d2-s-buttons + d4-s-buttons)

  lrk2-vertshift-layout(
    buttonmatrixlayout(..left-normal-commands),
    buttonmatrixlayout(..right-normal-commands),

    buttonmatrixlayout(..left-shift-commands),
    buttonmatrixlayout(..right-shift-commands)
  )
}




