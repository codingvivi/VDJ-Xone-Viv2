#import "template-all.typ": *

#let pg(letter) = {"Page " + letter + ":" + linebreak()}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               duplicate vars                               */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let shiftdupepagebutton = {
  button(
    command_name: [#same ],
    command_description: "",
    target: same,
    LED_color: "",
    description_LED: "",
  )
}

#let blankpage(letter) = {
  button(
    command_name:  [#pg(letter) #text(fill: rgb("#aaaaaa"), "blank")],
    command_description:"", 
    target: unmapped,
    LED_color: "",
    description_LED: "" 
  )
}

// duplicate buttons
#let buttonA(target) = {
  button(
    command_name: [#pg("A") play controls],
    command_description: "",
    target: target
  )
}

#let buttonB(target) = {
  button(
    command_name: [#pg("B") slicer],
    command_description: "",
    target: target
  )
}

#let buttonC(target) = {
  button(
    command_name: [#pg("A") beat roll],
    command_description: "",
    target: target
  )
}

#let buttonD(target) = {
  button(
    command_name: [#pg("A") keycue],
    command_description: "",
    target: target
  )
}

#let buttonE(target) = {
  button(
    command_name: [#pg("A") hotcues],
    command_description: "",
    target: target
  )
}

#let buttonF(target) = {
  button(
    command_name: [#pg("A") cueloop],
    command_description: "",
    target: target
  )
}

// non duplicate buttons
#let buttonG = blankpage("G") 

#let buttonH = blankpage("I") 

#let buttonI = blankpage("H") 

#let buttonJ = blankpage("J") 

#let buttonK = blankpage("K") 

#let buttonL = blankpage("L") 

#let buttonM = blankpage("M") 

#let buttonN = blankpage("N") 

#let buttonO = blankpage("O") 

#let buttonP = blankpage("P") 

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  buttons                                   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
//normal
#let buttonA_l_normal = buttonA(d13)

#let buttonB_l_normal = buttonB(d13)

#let buttonC_l_normal = buttonC(d13)

#let buttonD_l_normal = buttonD(d13)

#let buttonE_l_normal = buttonE(d13)

#let buttonF_l_normal = buttonF(d13)

#let buttonG_l_normal = buttonG

#let buttonH_l_normal = buttonH

#let buttonI_l_normal = buttonI

#let buttonJ_l_normal = buttonJ

#let buttonK_l_normal = buttonK

#let buttonL_l_normal = buttonL

#let buttonM_l_normal = buttonM

#let buttonN_l_normal = buttonN

#let buttonO_l_normal = buttonO

#let buttonP_l_normal = buttonP

//shift

#let buttonA_l_shift = shiftdupepagebutton

#let buttonB_l_shift = shiftdupepagebutton

#let buttonC_l_shift = shiftdupepagebutton

#let buttonD_l_shift = shiftdupepagebutton

#let buttonE_l_shift = shiftdupepagebutton

#let buttonF_l_shift = shiftdupepagebutton

#let buttonG_l_shift = shiftdupepagebutton

#let buttonH_l_shift = shiftdupepagebutton

#let buttonI_l_shift = shiftdupepagebutton

#let buttonJ_l_shift = shiftdupepagebutton

#let buttonK_l_shift = shiftdupepagebutton

#let buttonL_l_shift = shiftdupepagebutton

#let buttonM_l_shift = shiftdupepagebutton

#let buttonN_l_shift = shiftdupepagebutton

#let buttonO_l_shift = shiftdupepagebutton

#let buttonP_l_shift = shiftdupepagebutton

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page contents                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#vershiftlayout(

  buttonmatrixlayout(
    buttonA_l_normal,
    buttonB_l_normal,
    buttonC_l_normal,
    buttonD_l_normal,
    buttonE_l_normal,
    buttonF_l_normal,
    buttonG_l_normal,
    buttonH_l_normal,
    buttonI_l_normal,
    buttonJ_l_normal,
    buttonK_l_normal,
    buttonL_l_normal,
    buttonM_l_normal,
    buttonN_l_normal,
    buttonO_l_normal,
    buttonP_l_normal,
  ),

  buttonmatrixlayout(
    buttonA_l_shift,
    buttonB_l_shift,
    buttonC_l_shift,
    buttonD_l_shift,
    buttonE_l_shift,
    buttonF_l_shift,
    buttonG_l_shift,
    buttonH_l_shift,
    buttonI_l_shift,
    buttonJ_l_shift,
    buttonK_l_shift,
    buttonL_l_shift,
    buttonM_l_shift,
    buttonN_l_shift,
    buttonO_l_shift,
    buttonP_l_shift,
  )
)
