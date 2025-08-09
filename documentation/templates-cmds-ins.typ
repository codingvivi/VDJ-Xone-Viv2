#import "templates-text.typ":*

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  commands                                  */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let command(
  page-name: none,
  command-name: str, 
  command-description: none, 
  target-type: str,
  LED: none,
) = (
  page-name:page-name,
  command-name: command-name,
  command-description:command-description,
  target-type: target-type,
  LED: LED,
)

#let unmapped-command = command(
  command-name: unmapped-text,
  command-description: none,
  target-type: unmapped-text,
  LED: none,
)

#let same-command = command(
  command-name: same-text,
  command-description: none,
  target-type: same-text,
  LED: none,
)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                   inputs                                   */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let input(
  type-input: str, 
  command: command,
  target: str
) = (
  type-input: type-input,
  command:command,
  target: target,
)

#let button(
  command: command,
  target: dg,
) = (
  input(
    type-input: "Button",
    command: command,
    target: target
  )
)

#let same-button = button(
  command: same-command,
  target: same-text
)

#let encoder(
  command-push: command, 
  target-push: "",
  command-turn: command, 
  target-turn: "",
) = {
  let pushdict = input(
    type-input: "enconder-push",
    command: command-push,
    target: target-push
  )
  let turndict = input(
    type-input: "encoder-turn",
    command: command-turn,
    target: target-turn
  )

  pushdict.insert("inputsymbol", symbol-encp)
  turndict.insert("inputsymbol", symbol-encr)

  let fulldict = (
    type-input: "encoder-full",
    push: pushdict,
    turn: turndict,
  )  
  fulldict
}

