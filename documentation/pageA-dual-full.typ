#import "full2ctemplate.typ": cp_duplicatehalves, unmapped 

#cp_duplicatehalves(
  //Page name letter
  "A",
  //Title of page
  "Play Controls",


  //Controls non-shift
  (
    [Cue], [Set Master], [< nudge], [nudge >],
    [Play], [Sync], [Slip], [Reverse] ,
  ),
  //Controls shift
  (
    [Beginning], [Repitch], [Edit grid], [Load],
    unmapped, [], unmapped, unmapped, 
  ),
  //Description
  [
    ==== Cue 
      Pioneer like cue button

      ===== LED:
        - off: no cue is set
        - orange, blinking: cue set, paused
        - orange, solid: cue set, track playing
    ==== Play  
      Plays song.
      ===== LED:
        - off: no track loaded
        - green, blinking: track loaded, paused
        - orange, solid: track playing
        - red, blinking slow: track ending soon
        - red, blinking fast: track ending in 30s
  ]
)
