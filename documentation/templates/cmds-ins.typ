#import "text.typ":*

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*                                  commands                                  */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#let command(
  page-name: none,
  command-type: "command",
  command-name: str, 
  command-description: none, 
  target: target,
  LED: none,
) = (
  page-name:page-name,
  command-type: command-type,
  command-name: command-name,
  command-description:command-description,
  target: target,
  LED: LED,
)

#let pad-command(
  page-name: none,
  command-name: str, 
  command-description: none, 
  target: target,
  LED: none,
) = command(
  page-name:page-name,
  command-type: "pad",
  command-name: command-name,
  command-description:command-description,
  target: target,
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
  target: unmapped-target,
  LED: none,
)

#let sameInShift-command = command(
  command-name: sameInShift-text,
  command-description: none,
  target: sameInShift-target,
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
  target: target
) = (
  type-input: type-input,
  command:command,
  target: target,
)

#let button(
  command: command,
  target: global,
) = (
  input(
    type-input: "Button",
    command: command,
    target: target
  )
)

#let sameInShift-button = button(
  command: sameInShift-command,
  target: sameInShift-target
)

#let encoder(
  command-push: command, 
  target-push: target,
  command-turn: command, 
  target-turn: target,
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


