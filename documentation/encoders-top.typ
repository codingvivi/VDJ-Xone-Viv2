#import "templates/text.typ":*
#import "templates/cmds-ins.typ":*
#import "templates/layouts.typ":*
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                             command templates                              */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let jump-long = command(
  command-name: "jump long",
  command-description: none,
  target: decklocal,
  LED: none,
)

#let jump-short = command(
  command-name: "jump short",
  command-description: none,
  target: decklocal,
  LED: none,
)

#let change-jump-length = command(
  command-name: "jump length",
  command-description: none,
  target: global,
  LED: none,
)

#let set-loop = command(
  command-name: "set loop",
  command-description: none,
  target: decklocal,
  LED: none,
)

#let change-loop-length = command(
  command-name: "loop size",
  command-description: none,
  target: decklocal,
  LED: none,
)

#let move-loop = command(
  command-name: "move loop",
  command-description: none,
  target: decklocal,
  LED: none,
)
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                input dicts                                 */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ normal mode ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
//left side
#let enc-top-1-l-normal = encoder(
  command-push: change-jump-length,
  target-push: global,
  command-turn: jump-long,
  target-turn: deck1
)

#let enc-top-2-l-normal = encoder(
  command-push: set-loop,
  target-push: deck1,
  command-turn: change-loop-length,
  target-turn: deck1
)

#let enc-top-3-l-normal = encoder(
  command-push: unmapped-command,
  target-push: unmapped-target,
  command-turn: jump-long,
  target-turn: deck3
)

#let enc-top-4-l-normal = encoder(
  command-push: set-loop,
  target-push: deck3,
  command-turn: change-loop-length,
  target-turn: deck3
)

//right side
#let enc-top-1-r-normal = encoder(
  command-push: unmapped-command,
  target-push: unmapped-target,
  command-turn: jump-long,
  target-turn: deck2
)

#let enc-top-2-r-normal = encoder(
  command-push: set-loop,
  target-push: deck2,
  command-turn: change-loop-length,
  target-turn: deck2
)

#let enc-top-3-r-normal = encoder(
  command-push: unmapped-command,
  target-push: unmapped-target,
  command-turn: jump-long,
  target-turn: deck4
)

#let enc-top-4-r-normal = encoder(
  command-push: set-loop,
  target-push: deck4,
  command-turn: change-loop-length,
  target-turn: deck4
)


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ shift mode ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
//left side
#let enc-top-1-l-shift = encoder(
  command-push: sameInShift-command,
  target-push: sameInShift-target,
  command-turn: jump-short,
  target-turn: deck1
)

#let enc-top-2-l-shift = encoder(
  command-push: sameInShift-command,
  target-push: sameInShift-target,
  command-turn: move-loop,
  target-turn: deck1
)

#let enc-top-3-l-shift = encoder(
  command-push: sameInShift-command,
  target-push: sameInShift-target,
  command-turn: jump-short,
  target-turn: deck3
)

#let enc-top-4-l-shift = encoder(
  command-push: sameInShift-command,
  target-push: sameInShift-target,
  command-turn: move-loop,
  target-turn: deck3
)

//right side
#let enc-top-1-r-shift = encoder(
  command-push: sameInShift-command,
  target-push: sameInShift-target,
  command-turn: jump-short,
  target-turn: deck2
)

#let enc-top-2-r-shift = encoder(
  command-push: sameInShift-command,
  target-push: sameInShift-target,
  command-turn: move-loop,
  target-turn: deck2
)

#let enc-top-3-r-shift = encoder(
  command-push: sameInShift-command,
  target-push: sameInShift-target,
  command-turn: jump-short,
  target-turn: deck4
)

#let enc-top-4-r-shift = encoder(
  command-push: sameInShift-command,
  target-push: sameInShift-target,
  command-turn: move-loop,
  target-turn: deck4
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
