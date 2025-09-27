/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                   colors                                   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let bgcolor = rgb("#161616")

#let textcolor = rgb("#d0d0d0")
#let half-emptygray = rgb("#aaaaaa")
#let emptygray = rgb("#525252")

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ deck colors ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let d1-color = rgb("#33b0ff")
#let d2-color = rgb("#ee5396")
#let d3-color = rgb("#08bdba")
#let d4-color = rgb("#ffb784")

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                    text                                    */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
//variables since I am using the same text in command names
#let unmapped-text = "N/A"
#let sameInShift-text = "Non-shift"
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ deck targets ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
//#let dg = "global"
//#let dl = "local"
//#let d1 = "deck 1"
//#let d2 = "deck 2"
//#let d3 = "deck 3"
//#let d4 = "deck 4"
//
//#let d13 = "deck 1 & 3"
//#let d24 = "deck 2 & 4"

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  targets                                   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ target template ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let target(
  name: str,
  color: color,
  stroke: none,
) = (
  name: name,
  color: color,
  stroke: stroke,
)

#let multideck-gradient(deckcolor1, deckcolor2) = gradient.linear(
  deckcolor1,
  deckcolor2,
  space: oklch,
  angle: 45deg,
)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ single decks ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let deck1 = target(
  name: "deck 1",
  color: rgb("33b0ff"),
  stroke: white,
)

#let deck2 = target(
  name: "deck 2",
  color: rgb("ee5396"),
  stroke: white,
)

#let deck3 = target(
  name: "deck 3",
  color: rgb("08bdba"),
  stroke: white,
)

#let deck4 = target(
  name: "deck 4",
  color: rgb("ffb784"),
  stroke: black,
)
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ multi decks ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let deck13 = target(
  name: "deck 1 & 3",
  color: multideck-gradient(deck1.color, deck3.color),
)

#let deck24 = target(
  name: "deck 2 & 4",
  color: multideck-gradient(deck2.color, deck4.color),
)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ local and global ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let decklocal = target(
  name: "local",
  color: textcolor,
)

#let global = target(
  name: "global",
  color: textcolor,
)


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ software ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let VirtualDJ = target(
  name: "VirtualDJ",
  color: rgb("dc1212"),
  stroke: white,
)

#let Ableton = target(
  name: "Ableton Live",
  color: rgb("0000ff"),
  stroke: white,
)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ hardware ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let model1 = target(
  name: "Model1",
  color: rgb("ffffff"),
  stroke: black,
)
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ unmapped decks ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let unmapped-target = target(
  name: unmapped-text, // using vars, see declaration
  color: emptygray,
)

#let sameInShift-target = target(
  name: sameInShift-text, // using vars, see declaration
  color: half-emptygray,
)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                    i/o                                     */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ templates ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let connector(
  spec: str,
  amount: int,
) = (
  spec: spec,
  amount: amount,
)

#let audio-io(
  direction: str,
  connector: connector,
  target: target,
  name: none,
) = (
  direction: direction,
  connector: connector,
  target: target,
  name: name,
)

#let audio-in(
  connector: connector,
  target: target,
  name: none,
) = audio-io(
  direction: "IN",
  connector: connector,
  target: target,
  name: name,
)

#let audio-out(
  connector: connector,
  target: target,
  name: none,
) = audio-io(
  direction: "OUT",
  connector: connector,
  target: target,
  name: name,
)

#let cable(
  IN: audio-in,
  OUT: audio-out,
) = (
  IN: IN,
  OUT: OUT,
)




/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  symbols                                   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ encoder symbols ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let symbol-encp = sym.triangle.filled.b
#let symbol-encr = sym.triangle.filled.l + sym.triangle.filled.r

#let write-symbols(cmdarray) = {
  cmdarray
    .enumerate()
    .map(
      ((index, value)) => {
        // Determine which content to prepend based on the index.
        let prepend = if index <= 4 {
          symbol-encp // Assumes 'encp' is defined
        } else {
          symbol-encr // Assumes 'encr' is defined
        }
        // Return the new, combined content for the new array.
        prepend + value
      },
    )
}

