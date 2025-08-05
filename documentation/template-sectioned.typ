#import "template-all.typ": horlayout

#let hardcode-lr-shift(
  l-cntrls-normal, 
  r-cntrls-normal, 
  description-normal: [],
  l-cntrls-shift,
  r-cntrls-shift,
  description-shift: [],
) = {
  horlayout(
    layouttitle: "Normal",

    "Left contoller", 
    l-cntrls-normal,

    "Right controller",
    r-cntrls-normal,
  )
  description-normal

  horlayout(
    layouttitle: "Shift On",

    "Left contoller", 
    l-cntrls-shift,

    "Right controller",
    r-cntrls-shift,

  )
  description-shift
}

