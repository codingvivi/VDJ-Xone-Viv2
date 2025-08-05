#import "template-all.typ": unmapped, same, input, encoder
#import "template-sectioned.typ": *

=== Top encoder section
//
//#let normalcmds_left = (
//    ([jump length] + dg, [set loop], unmapped, [set loop] + d3,
//    [long jump] + d1, [loop length] + d1, [long jump], [loop length] + d3,
//  )
//
//
//#let normalcmds_right = (
//    unmapped, [set loop] + d2, unmapped, [set loop] + d4,
//    [long jump] + d2, [loop length], [long jump] + d4, [loop length],
//  )
//
//
//#let shiftcmds_left = (
//    unmapped, same + [\ \ ], unmapped, same + [\ \ ],
//   [short jump] + d1, [move loop] + d1, [short jump] + d3, [move loop] +d3,
//  )
//
//
//#let shiftcmds_right = (
//    unmapped, same + [ \ \ ], unmapped, same + [ \ \ ],
//    [short jump] + d2, [move loop] + d2, [short jump] + d4, [move loop] + d4,
//  )
//


#let enc_top_1_l = encoder(
  command_push: "jump length", 
  description_push: "",
  target_push: "1",

  command_turn: "long", 
  description_turn: str,
  target_turn: "",

  LED:"",
  description_LED: "",
)
#let enc_top_2_l = encoder(
  command_push: "jump length", 
  description_push: "",
  target_push: "2",

  command_turn: "long", 
  description_turn: str,
  target_turn: "",

  LED:"",
  description_LED: "",
)

#let testbutton = input(
  type_input: "button",
  command_name: "test command",
  target: "4"
) 



//#enc_top_1_l.push.target
//#enc_top_2_l.push.target


#let add_plus_target(inputdict, value) = {
  let returnvalue
  let current_value = inputdict.at(value)

  returnarray.at(value) = {
    current_value.command_name
    if current_value.target != "" {
      + [\ \ #current_value.target]
    }
  return returnvalue
  }
  
}
#let create-cel(inputdict) = {
  let returnarray = ()


  for (key, value) in inputdict {
    let current_value = inputdict.at(key)
    if current_value.type_input != "encoder" {
      returnarray.push(add_plus_target(inputdict, value))
    } else{
      let temparray = current_value.create-cel()
      returnarray.push
    }
    return returnarray

  }
}

#create-cel(testbutton);


//#hardcode_lr_shift(
//  // commands normal
//  normalcmds_left, normalcmds_right,
//  description_normal: [],
//
//  // commands shift
//  shiftcmds_left, shiftcmds_right,
//  description_shift: [],
//
//)
