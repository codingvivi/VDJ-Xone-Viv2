// __________________________________ Buttons ____________________________________
#let emptygray = rgb("#525252")
#let unmapped = [#text(fill: emptygray, "N/A" )]
#let same = [#text(fill: emptygray, "Non shift" )]

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
#let input(
  type_input: str, 
  command_name: str, 
  command_description: str, 
  target: str
) = (
  type_input: type_input,
  target: target,
  command_name: command_name,
  command_description: command_description,
)

#let input_with_LED(
  type_input: str,
  command_name: str,
  command_description: str,
  target: "",
  LED_color: color,
  description_LED: ""
) = {
  let temp_dict = input(type_input: type_input, command_name: command_name, command_description: command_description, target: target)
  
  let final_dict = temp_dict + (
    "LED": LED_color,
    "description_LED": description_LED
  )
 
  return final_dict
}
#let button(
  type_input: str,
  command_name: str,
  command_description: str,
  target: "",
  LED_color: color,
  description_LED: ""
) = (
  input_with_LED(
    type_input: type_input,
    command_name: command_name,
    command_description: command_description,
    target: target,
    LED_color: LED_color,
    description_LED: description_LED
  )
)

#let encoder(
  command_push: str, 
  description_push: str,
  target_push: "",
  command_turn: str, 
  description_turn: str,
  target_turn: "",
  LED:"",
  description_LED: "",
) = {
  let pushdict = input(
    type_input: "enconder_push",
    command_name: command_push,
    command_description: description_push,
    target: target_push
  )
  let turndict = input(
    type_input: "encoder_turn",
    command_name: command_turn,
    command_description: description_turn,
    target: target_turn
  )

  pushdict.insert("inputsymbol", symbol_encp)
  turndict.insert("inputsymbol", symbol_encr)

  let fulldict = (
    type_input: "encoder_full",
    push: pushdict,
    turn: turndict,
    LED: LED,
    description_LED: description_LED,
  )  
  fulldict
}
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

#let verlayout(lcntrls, ltitle, rcntrls, rtitle) = {
  grid(
    columns: 1,
    row_gutter: 10pt,
    controllerlayout(toptitle, topcntrls),
    controllerlayout(bottomtitle, bottomcntrls)
  )
}

#let horlayout(layouttitle: "", ltitle, lcntrls, rtitle, rcntrls,) = {
  grid(
 //   gutter: 4pt,
    [#if layouttitle != ""{
      align(center)[#heading(level:4, layouttitle)]
    }],
    [#grid(
      columns: (49%, 49%),
      gutter: 20pt,
      controllerlayout(title: ltitle, lcntrls),
      controllerlayout(title: rtitle, rcntrls)
    )]
  )
}

#let horshiftlayout(normal_cntrls, shift_cntrls) = { 
  horlayout("Normal", normal_cntrls, "Shift", shift_cntrls)
} 

#let cellayout(input) = {
  let command_line = {
  //add inputsymbol if it exists
    if "inputsymbol" in input {
      input.inputsymbol 
      h(0.3em) // spacing
    }
    input.command_name
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
    gutter: 11pt,
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

