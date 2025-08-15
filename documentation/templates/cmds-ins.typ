#import "text.typ":*

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  commands                                  */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let command(
  page-name: none,
  command-type: "command",
  command-name: str, 
  command-description: none, 
  target-type: str,
  LED: none,
) = (
  page-name:page-name,
  command-type: command-type,
  command-name: command-name,
  command-description:command-description,
  target-type: target-type,
  LED: LED,
)

#let pad-command(
  page-name: none,
  command-name: str, 
  command-description: none, 
  target-type: str,
  LED: none,
) = command(
  page-name:page-name,
  command-type: "pad",
  command-name: command-name,
  command-description:command-description,
  target-type: target-type,
  LED: LED,
)

#let pad-command-old(
  command-name: str,
  command-description: none,
  LED: none
) = {

  return-dict = (:)

  for value in range(8) {
    let key = "pad" + str(value)
    let value = command(
      command-name: command-name + " " + str(value),
      command-description: command-description,
      LED: LED,
    )

    returndict.insert(key, value)
  }
}

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

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~ command dulication ~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let create-pad-set(pad-command) = {

  let return-array = ()

  for value in range(8) {

    let pad-number = str(value + 1)

    let value = command(
      command-name: pad-command.command-name + " " + pad-number,
      command-description: pad-command.command-description,
      LED: pad-command.LED,
    )

    return-array.push(value)
  }

  return-array

}

#let create-duplicate-set(cmd) = {
  let return-array = ()

  for value in range(8) {
    return-array.push(cmd)
  }
  return-array
}
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


