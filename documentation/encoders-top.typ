#import "template-all.typ": *
#import "template-sectioned.typ": *

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                             command templates                              */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let normal-jump-encoder(
  command_push: str, 
  description_push: "",
  target_push: str,

  target_jump: str,

  LED: str,
  description_LED: str,
) = (
  encoder(
    command_push: command_push, 
    description_push: description_push,
    target_push: target_push,
  
    command_turn: "jump long", 
    description_turn: "",
    target_turn: target_jump,
  
    LED:LED,
    description_LED:description_LED,
  )
)

#let shift-jump-encoder(
  command_push: str, 
  description_push: "",
  target_push: str,

  target_jump: str,

  LED: str,
  description_LED: str,
) = (
  encoder(
    command_push: command_push, 
    description_push: description_push,
    target_push: target_push,
  
    command_turn: "jump short", 
    description_turn: "",
    target_turn: target_jump,
  
    LED:LED,
    description_LED:description_LED,
  )
)


#let normal-loop-encoder(target: str) = {
  encoder(
    command_push: "loop", 
    description_push: "",
    target_push: target,
  
    command_turn: "loop length", 
    description_turn: str,
    target_turn: target,
  
    LED:"",
    description_LED: "",
  )

}

#let shift-loop-encoder(target: str) = {
  encoder(
    command_push: unmapped, 
    description_push: "",
    target_push: target,
  
    command_turn: "loop pos", 
    description_turn: str,
    target_turn: target,
  
    LED:"",
    description_LED: "",
  )

}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                input dicts                                 */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
//normal mode
#let enc_top_1_l_normal = normal-jump-encoder(
  command_push: "jump length", 
  description_push: "",
  target_push: "g",

  target_jump: "1",

  LED:"",
  description_LED: "",
)

#let enc_top_2_l_normal = normal-loop-encoder(target: "1")

#let enc_top_3_l_normal = normal-jump-encoder(
  command_push: "jump length", 
  description_push: "",
  target_push: "g",

  target_jump: "3",

  LED:"",
  description_LED: "",
)

#let enc_top_4_l_normal = normal-loop-encoder(target: "3")

//shift mode
#let enc_top_1_l_shift = shift-jump-encoder(
  command_push: "jump length", 
  description_push: "",
  target_push: "g",

  target_jump: "1",

  LED:"",
  description_LED: "",
)


#let enc_top_2_l_shift = shift-loop-encoder(target: "1")

#let enc_top_3_l_shift = shift-jump-encoder(
  command_push: "jump length", 
  description_push: "",
  target_push: "g",

  target_jump: "1",

  LED:"",
  description_LED: "",
)

#let enc_top_4_l_shift = shift-loop-encoder(target: "3")

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                              layout template                               */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
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

#let layout-encoder-top-full(e1n, e2n, e3n, e4n, e1s, e2s, e3s, e4s) = {
  horshiftlayout(
    layout-encoder-top-half(e1n,e2n,e3n,e4n),
    layout-encoder-top-half(e1s,e2s,e3s,e4s)
  )
}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page contents                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
=== Top encoder section
#layout-encoder-top-full(
  enc_top_1_l_normal,
  enc_top_2_l_normal,
  enc_top_3_l_normal,
  enc_top_4_l_normal,
  enc_top_1_l_shift,
  enc_top_2_l_shift,
  enc_top_3_l_shift,
  enc_top_4_l_shift,

)

//#layout-encoder-top()
//#enc_top_1_l_normal.push.target
//#enc_top_2_l_normal.push.target



//#hardcode_l_normalr_shift(
//  // commands normal
//  normalcmds_l_normaleft, normalcmds_right,
//  description_normal: [],
//
//  // commands shift
//  shiftcmds_l_normaleft, shiftcmds_right,
//  description_shift: [],
//
//)
