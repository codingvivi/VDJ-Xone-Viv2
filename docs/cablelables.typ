#import "templates/text.typ": *

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                definitions                                 */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ objects ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let dsub = connector(
  spec: "DB25",
  amount: 1,
)

#let trs-dsub = connector(
  spec: "TRS",
  amount: 8,
)

#let dsub-in-breakouts(
  name: str,
  audio-source: target,
) = cable(
  IN: audio-in(
    connector: trs-dsub,
    target: audio-source,
  ),

  OUT: audio-out(
    connector: dsub,
    target: model1,
    name: name,
  ),
)

#let dsub-in-breakout-1 = dsub-in-breakouts(
  name: 1,
  audio-source: VirtualDJ,
)

#let dsub-in-breakout-2 = dsub-in-breakouts(
  name: 2,
  audio-source: Ableton,
)



#let dsub-out-breakout = cable(
  IN: audio-in(
    connector: dsub,
    target: model1,
    name: "1",
  ),

  OUT: audio-out(
    connector: trs-dsub,
    target: Ableton,
  ),
)



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~ content generators ~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let cable-label-dict(
  stroke: color,
  fill: color,
  content: content,
) = (
  content: content,
  stroke: stroke,
  fill: fill,
)

#let dsub-label-dict(
  cable-end: audio-io,
  signal: target,
  socket-flow: str,
) = {
  let spec = cable-end.connector.spec
  let customname = cable-end.name
  let labeling-content = [#spec #socket-flow #customname \ #signal.name]

  cable-label-dict(
    content: labeling-content,
    fill: signal.color,
    stroke: signal.stroke,
  )
}
#let cable-label(
  label-dict: cable-label-dict,
  height: relative,
  width: relative,
) = {
  // --- Data Setup ---

  let to-string(content) = {
    if content.has("text") {
      content.text
    } else if content.has("linebreak") {
      linebreak
    } else if content.has("children") {
      content.children.map(to-string).join(" ")
    } else if content.has("body") {
      to-string(content.body)
    } else {
      ""
    }
  }

  let labeling-string = to-string(label-dict.content)

  // --- Layout Calculations ---
  let padding = 2mm
  let usable-width = width - (2 * padding)
  [usable-width: #usable-width\ ] //debug
  let usable-height = height - (2 * padding)
  [usable-height: #usable-height\ ] //debug
  context {
    let reference-font-size = 1pt
    let measured-ref-width = measure(
      block(
        width: auto,
        text(size: reference-font-size, labeling-string),
      ),
    ).width
    [measured width: #measured-ref-width\ ] //debug
    let scaling = (usable-width * 0.98 / measured-ref-width)
    [scaling: #scaling\ ] //debug
    let font-size = reference-font-size * scaling
    [font size: #font-size] //debug
    let line-height = font-size * 1.25
    let line-number = int(usable-height / line-height)

    // --- Layout ---
    rect(
      height: height,
      width: width,
      stroke: black,
      fill: label-dict.fill,
    )[
      #pad(rest: padding)[
        #align(center + horizon)[
          #text(
            stroke: label-dict.stroke,
            fill: label-dict.stroke,
            size: font-size,
            label-dict.content,
          )
        ]
      ]
    ]
  }
}


#let dsub-label(
  cable-end: audio-io,
  signal: target,
  socket-flow: str,
) = {
  cable-label(
    height: 4.5cm,
    width: 4cm,
    label-dict: dsub-label-dict(
      cable-end: cable-end,
      signal: signal,
      socket-flow: socket-flow,
    ),
  )
}
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  content                                   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#set text(font: "Helvetica Neue")
#set page(paper: "a4")

#grid(
  columns: 3,
  rows: (auto, auto),
  gutter: 0pt,

  /* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DSUB ends ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
  dsub-label(
    cable-end: dsub-out-breakout.IN,
    signal: dsub-out-breakout.IN.target,
    socket-flow: dsub-out-breakout.OUT.direction,
  ),
  dsub-label(
    cable-end: dsub-in-breakout-1.OUT,
    signal: dsub-in-breakout-1.IN.target,
    socket-flow: dsub-in-breakout-1.IN.direction,
  ),

  dsub-label(
    cable-end: dsub-in-breakout-2.OUT,
    signal: dsub-in-breakout-2.IN.target,
    socket-flow: dsub-in-breakout-2.IN.direction,
  ),
  /* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ TRS ends ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
  dsub-label(
    cable-end: dsub-out-breakout.IN,
    signal: dsub-out-breakout.IN.target,
    socket-flow: dsub-out-breakout.OUT.direction,
  ),

  dsub-label(
    cable-end: dsub-in-breakout-1.OUT,
    signal: dsub-in-breakout-1.IN.target,
    socket-flow: dsub-in-breakout-1.IN.direction,
  ),

  dsub-label(
    cable-end: dsub-in-breakout-2.OUT,
    signal: dsub-in-breakout-2.IN.target,
    socket-flow: dsub-in-breakout-2.IN.direction,
  ),
)
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DSUB ends ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

