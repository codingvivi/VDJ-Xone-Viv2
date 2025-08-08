// __________________________________ Buttons ____________________________________
#let emptygray = rgb("#525252")
#let unmapped_text = [#text(fill: emptygray, "N/A" )]
#let same_text = [#text(fill: emptygray, "Non shift" )]

//encoder symbols
#let symbol_encp = sym.triangle.filled.b 
#let symbol_encr = sym.triangle.filled.l + sym.triangle.filled.r

#let write_symbols(cmdarray) = {
  cmdarray.enumerate().map(((index, value)) => {
    // Determine which content to prepend based on the index.
    let prepend = if index <= 4 {
      symbol_encp // Assumes 'encp' is defined
    } else {
      symbol_encr // Assumes 'encr' is defined
    }
    // Return the new, combined content for the new array.
    prepend + value
  }
)}

//deck targets
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


// __________________________________ Controls __________________________________ 
#let command(
  command_name: str, 
  command_description: none, 
  target_type: str,
  LED: none,
) = (
  command_name: command_name,
  command_description:command_description,
  target_type: target_type,
  LED: LED,
)

#let unmapped_command = command(
  command_name: unmapped_text,
  command_description: none,
  target_type: unmapped_text,
  LED: none,
)

#let same_command = command(
  command_name: same_text,
  command_description: none,
  target_type: same_text,
  LED: none,
)

#let input(
  type_input: str, 
  command: command,
  target: str
) = (
  type_input: type_input,
  command:command,
  target: target,
)

#let button(
  command: command,
  target: dg,
) = (
  input(
    type_input: "Button",
    command: command,
    target: target
  )
)

#let encoder(
  command_push: command, 
  target_push: "",
  command_turn: command, 
  target_turn: "",
) = {
  let pushdict = input(
    type_input: "enconder_push",
    command: command_push,
    target: target_push
  )
  let turndict = input(
    type_input: "encoder_turn",
    command: command_turn,
    target: target_turn
  )

  pushdict.insert("inputsymbol", symbol_encp)
  turndict.insert("inputsymbol", symbol_encr)

  let fulldict = (
    type_input: "encoder_full",
    push: pushdict,
    turn: turndict,
  )  
  fulldict
}
#let unmappedencoder =  encoder()
// __________________________________ Layout ___________________________________ 
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
      gutter: 20pt,
      controllerlayout(title: ltitle, lcntrls),
      controllerlayout(title: rtitle, rcntrls)
    )
  )
}

#let horshiftlayout(normal_cntrls, shift_cntrls) = { 
  horlayout("Normal", normal_cntrls, "Shift", shift_cntrls)
} 

#let vershiftlayout(normal_cntrls, shift_cntrls) = { 
  verlayout("Normal", normal_cntrls, "Shift", shift_cntrls)
} 

#let fulllayout(l_normal_cntrls, r_normal_cntrls, l_shift_cntrls,  r_shift_cntrls) = {
  grid(
    columns: (50%, 50%),
    vershiftlayout(l_normal_cntrls, l_shift_cntrls),
    vershiftlayout(r_normal_cntrls, r_shift_cntrls)
  )
}

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
    gutter: 4pt,
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
    columns: (25%,25%,25%,25%,),
    gutter: 4pt,
    align: center,

    ..cells
  )
}

