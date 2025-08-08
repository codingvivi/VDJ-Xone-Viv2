#import "template-all.typ": *
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                             command templates                              */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */



#let jump-long = command(
  command_name: "jump long",
  command_description: none,
  target_type: dl,
  LED: none,
)

#let jump-short = command(
  command_name: "jump short",
  command_description: none,
  target_type: dl,
  LED: none,
)

#let change-jump-length = command(
  command_name: "jump length",
  command_description: none,
  target_type: dg,
  LED: none,
)

#let set-loop = command(
  command_name: "set loop",
  command_description: none,
  target_type: dl,
  LED: none,
)

#let change-loop-length = command(
  command_name: "loop size",
  command_description: none,
  target_type: dl,
  LED: none,
)

#let move-loop = command(
  command_name: "move loop",
  command_description: none,
  target_type: dl,
  LED: none,
)
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                input dicts                                 */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
//left side
#let enc_top_1_l_normal = encoder(
  command_push: change-jump-length,
  target_push: dg,
  command_turn: jump-long,
  target_turn: d1
)

#let enc_top_2_l_normal = encoder(
  command_push: set-loop,
  target_push: d1,
  command_turn: change-loop-length,
  target_turn: d1
)

#let enc_top_3_l_normal = encoder(
  command_push: unmapped_command,
  target_push: unmapped_text,
  command_turn: jump-long,
  target_turn: d3
)

#let enc_top_4_l_normal = encoder(
  command_push: set-loop,
  target_push: d3,
  command_turn: change-loop-length,
  target_turn: d3
)
//right side
#let enc_top_1_r_normal = encoder(
  command_push: change-jump-length,
  target_push: dg,
  command_turn: jump-long,
  target_turn: d2
)

#let enc_top_2_r_normal = encoder(
  command_push: set-loop,
  target_push: d2,
  command_turn: change-loop-length,
  target_turn: d2
)

#let enc_top_3_r_normal = encoder(
  command_push: unmapped_command,
  target_push: unmapped_text,
  command_turn: jump-long,
  target_turn: d4
)

#let enc_top_4_r_normal = encoder(
  command_push: set-loop,
  target_push: d4,
  command_turn: change-loop-length,
  target_turn: d4
)


//shift mode
#let enc_top_1_l_shift = encoder(
  command_push: same_command,
  target_push: same_text,
  command_turn: jump-short,
  target_turn: d1
)

#let enc_top_2_l_shift = encoder(
  command_push: same_command,
  target_push: same_text,
  command_turn: move-loop,
  target_turn: d1
)

#let enc_top_3_l_shift = encoder(
  command_push: same_command,
  target_push: same_text,
  command_turn: jump-short,
  target_turn: d3
)

#let enc_top_4_l_shift = encoder(
  command_push: same_command,
  target_push: same_text,
  command_turn: move-loop,
  target_turn: d3
)

#let enc_top_1_r_shift = encoder(
  command_push: same_command,
  target_push: same_text,
  command_turn: jump-short,
  target_turn: d2
)

#let enc_top_2_r_shift = encoder(
  command_push: same_command,
  target_push: same_text,
  command_turn: move-loop,
  target_turn: d2
)

#let enc_top_3_r_shift = encoder(
  command_push: same_command,
  target_push: same_text,
  command_turn: jump-short,
  target_turn: d4
)

#let enc_top_4_r_shift = encoder(
  command_push: same_command,
  target_push: same_text,
  command_turn: move-loop,
  target_turn: d4
)
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

#let layout-encoder-top-full(
  e1ln, e2ln, e3ln, e4ln, 
  e1rn, e2rn, e3rn, e4rn,
  e1ls, e2ls, e3ls, e4ls, 
  e1rs, e2rs, e3rs, e4rs
) = {
  fulllayout(
    layout-encoder-top-half(e1ln,e2ln,e3ln,e4ln),
    layout-encoder-top-half(e1rn,e2rn,e3rn,e4rn),
    layout-encoder-top-half(e1ls,e2ls,e3ls,e4ls),
    layout-encoder-top-half(e1rs,e2rs,e3rs,e4rs)
  )
}


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page contents                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#layout-encoder-top-full(
  enc_top_1_l_normal,
  enc_top_2_l_normal,
  enc_top_3_l_normal,
  enc_top_4_l_normal,
  enc_top_1_r_normal,
  enc_top_2_r_normal,
  enc_top_3_r_normal,
  enc_top_4_r_normal,
  enc_top_1_l_shift,
  enc_top_2_l_shift,
  enc_top_3_l_shift,
  enc_top_4_l_shift,
  enc_top_1_r_shift,
  enc_top_2_r_shift,
  enc_top_3_r_shift,
  enc_top_4_r_shift,
)
