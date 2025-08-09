#import "templates/text.typ":*
#import "templates/cmds-ins.typ":*
#import "templates/layouts.typ":*
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                             command templates                              */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let jump-long = command(
  command-name: "jump long",
  command-description: none,
  target-type: dl,
  LED: none,
)

#let jump-short = command(
  command-name: "jump short",
  command-description: none,
  target-type: dl,
  LED: none,
)

#let change-jump-length = command(
  command-name: "jump length",
  command-description: none,
  target-type: dg,
  LED: none,
)

#let set-loop = command(
  command-name: "set loop",
  command-description: none,
  target-type: dl,
  LED: none,
)

#let change-loop-length = command(
  command-name: "loop size",
  command-description: none,
  target-type: dl,
  LED: none,
)

#let move-loop = command(
  command-name: "move loop",
  command-description: none,
  target-type: dl,
  LED: none,
)
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                input dicts                                 */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ normal mode ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
//left side
#let enc-top-1-l-normal = encoder(
  command-push: change-jump-length,
  target-push: dg,
  command-turn: jump-long,
  target-turn: d1
)

#let enc-top-2-l-normal = encoder(
  command-push: set-loop,
  target-push: d1,
  command-turn: change-loop-length,
  target-turn: d1
)

#let enc-top-3-l-normal = encoder(
  command-push: unmapped-command,
  target-push: unmapped-text,
  command-turn: jump-long,
  target-turn: d3
)

#let enc-top-4-l-normal = encoder(
  command-push: set-loop,
  target-push: d3,
  command-turn: change-loop-length,
  target-turn: d3
)

//right side
#let enc-top-1-r-normal = encoder(
  command-push: unmapped-command,
  target-push: unmapped-text,
  command-turn: jump-long,
  target-turn: d2
)

#let enc-top-2-r-normal = encoder(
  command-push: set-loop,
  target-push: d2,
  command-turn: change-loop-length,
  target-turn: d2
)

#let enc-top-3-r-normal = encoder(
  command-push: unmapped-command,
  target-push: unmapped-text,
  command-turn: jump-long,
  target-turn: d4
)

#let enc-top-4-r-normal = encoder(
  command-push: set-loop,
  target-push: d4,
  command-turn: change-loop-length,
  target-turn: d4
)


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ shift mode ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
//left side
#let enc-top-1-l-shift = encoder(
  command-push: same-command,
  target-push: same-text,
  command-turn: jump-short,
  target-turn: d1
)

#let enc-top-2-l-shift = encoder(
  command-push: same-command,
  target-push: same-text,
  command-turn: move-loop,
  target-turn: d1
)

#let enc-top-3-l-shift = encoder(
  command-push: same-command,
  target-push: same-text,
  command-turn: jump-short,
  target-turn: d3
)

#let enc-top-4-l-shift = encoder(
  command-push: same-command,
  target-push: same-text,
  command-turn: move-loop,
  target-turn: d3
)

//right side
#let enc-top-1-r-shift = encoder(
  command-push: same-command,
  target-push: same-text,
  command-turn: jump-short,
  target-turn: d2
)

#let enc-top-2-r-shift = encoder(
  command-push: same-command,
  target-push: same-text,
  command-turn: move-loop,
  target-turn: d2
)

#let enc-top-3-r-shift = encoder(
  command-push: same-command,
  target-push: same-text,
  command-turn: jump-short,
  target-turn: d4
)

#let enc-top-4-r-shift = encoder(
  command-push: same-command,
  target-push: same-text,
  command-turn: move-loop,
  target-turn: d4
)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                              layout template                               */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let layout-encoder-top-full(
  e1ln, e2ln, e3ln, e4ln, 
  e1rn, e2rn, e3rn, e4rn,
  e1ls, e2ls, e3ls, e4ls, 
  e1rs, e2rs, e3rs, e4rs
) = {
  lrk2-vertshift-layout(
    layout-encoder-top-half(e1ln,e2ln,e3ln,e4ln),
    layout-encoder-top-half(e1rn,e2rn,e3rn,e4rn),
    layout-encoder-top-half(e1ls,e2ls,e3ls,e4ls),
    layout-encoder-top-half(e1rs,e2rs,e3rs,e4rs)
  )
}


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page contents                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
=== Top encoder section
#layout-encoder-top-full(
  enc-top-1-l-normal,
  enc-top-2-l-normal,
  enc-top-3-l-normal,
  enc-top-4-l-normal,
  enc-top-1-r-normal,
  enc-top-2-r-normal,
  enc-top-3-r-normal,
  enc-top-4-r-normal,
  enc-top-1-l-shift,
  enc-top-2-l-shift,
  enc-top-3-l-shift,
  enc-top-4-l-shift,
  enc-top-1-r-shift,
  enc-top-2-r-shift,
  enc-top-3-r-shift,
  enc-top-4-r-shift,
)
