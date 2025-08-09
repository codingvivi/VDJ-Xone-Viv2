#import "template-all.typ": *

#let pg(letter) = {"Page " + letter + ":" + linebreak()}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               duplicate vars                               */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let blankbutton = {
  button(
    command_name: unmapped,
    command_description: unmapped, 
    target: unmapped,
    LED_color: "",
    description_LED: "" 
  )
}

// duplicate buttons
#let buttonPlay(target) = {
  button(
    command_name: "Play",
    command_description: "",
    target: target
  )
}

#let buttonCue(target) = {
  button(
    command_name: "Cue",
    command_description: "",
    target: target
  )
}

#let buttonSync(target) = {
  button(
    command_name: "Sync",
    command_description: "",
    target: target
  )
}

#let buttonSetmaster(target) = {
  button(
    command_name: "Set master",
    command_description: "",
    target: target
  )
}

#let buttonBendf(target) = {
  button(
    command_name: "Pitch bend >",
    command_description: "",
    target: target
  )
}

#let buttonBendb(target) = {
  button(
    command_name: "< Pitch bend",
    command_description: "",
    target: target
  )
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  buttons                                   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
//normal
#let buttonA_l_normal = 

#let buttonB_l_normal = 

#let buttonC_l_normal = 

#let buttonD_l_normal = 

#let buttonE_l_normal = 

#let buttonF_l_normal = 

#let buttonG_l_normal = 

#let buttonH_l_normal = 

#let buttonI_l_normal = 

#let buttonJ_l_normal = 

#let buttonK_l_normal = 

#let buttonL_l_normal = 

#let buttonM_l_normal = 

#let buttonN_l_normal = 

#let buttonO_l_normal = 

#let buttonP_l_normal = 

//shift

#let buttonA_l_shift = b

#let buttonB_l_shift = b

#let buttonC_l_shift = b

#let buttonD_l_shift = b

#let buttonE_l_shift = b

#let buttonF_l_shift = b

#let buttonG_l_shift = b

#let buttonH_l_shift = b

#let buttonI_l_shift = b

#let buttonJ_l_shift = b

#let buttonK_l_shift = b

#let buttonL_l_shift = b

#let buttonM_l_shift = b

#let buttonN_l_shift = b

#let buttonO_l_shift = b

#let buttonP_l_shift = b

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                               page contents                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#horshiftlayout(

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
