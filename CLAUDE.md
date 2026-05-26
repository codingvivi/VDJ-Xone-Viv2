# CLAUDE.md

Guidance for Claude Code working in this repository.

## What this is

A VirtualDJ 2025 controller mapping for two Allen & Heath **Xone:K2** controllers
used as a 2x2-deck setup, plus the Typst sources for the printed manual.

- `VDJ-Xone_Viv2-L.xml` — mapping for the **left** K2 (decks 1 & 3)
- `VDJ-Xone_Viv2-R.xml` — mapping for the **right** K2 (decks 2 & 4)
- `documentation/` — Typst sources, SVGs, screenshots, and the rendered manual PDF

The mappings live next to a hand-written manual that mirrors them page-for-page.
Editing one usually means editing the other.

## Layout convention

Decks are arranged **vertically** to mirror VirtualDJ's performance view:

| Side | Top deck | Bottom deck |
|------|----------|-------------|
| Left K2  | Deck 1 (`#33b0ff`, blue) | Deck 3 (`#08bdba`, teal) |
| Right K2 | Deck 2 (`#ee5396`, pink) | Deck 4 (`#ffb784`, peach) |

Stem EQ on the left K2's rotary section is the only block that targets all
decks. **Faders, the right K2's rotary pot section + pot switches, and the empty
knob-button blocks are intentionally unmapped** — leave them alone unless the
user explicitly asks. They exist for user-side custom mapping (Ableton channel
faders, external FX, etc.).

## VDJScript reference

Authoritative docs (always defer to these for verb behavior):

- Language overview: https://virtualdj.com/wiki/vdjscript.html
- Examples / idioms: https://virtualdj.com/wiki/VDJScript%20Examples.html
- Verb list: https://virtualdj.com/manuals/virtualdj/appendix/vdjscriptverbs.html
- K2 hardware mapping: https://www.virtualdj.com/manuals/hardware/allenheath/k2.html

Quick VDJScript primer for editing actions in this repo:

- `&` chains commands sequentially. Inside a query (LED action / conditional),
  `&` returns the first command's value; `&&` requires both true.
- `cond ? then : else` is ternary; chain with more `?`/`:` for if/elif/else.
- `'string'` and `"string"` are both literals; `` `cmd` `` executes a command and
  substitutes its return value as a parameter.
- **Decimal vs percent matters**: `pitch 1.0` is max pitch; `pitch 100%` is the
  middle. Same kind of distinction for `nudge`, `crossfader`, etc.
- Variable scopes: `$g` global session, `#l`/`%l` local session, `@$g` global
  persistent, `@%l`/`@l` local persistent. This mapping leans heavily on
  `@$cmdpagel`/`@$cmdpage`/`@$cmdpager` (persistent globals) for the page
  system, and on session globals like `$longjump`, `$storeBPM`, `$changed`.
- Use `set 'varname' value` for session, `set_var` likewise; query with
  `var 'name' N ? ... : ...`.

## XML mapping structure

Each file is a single `<mapper device="XONEK2" ...>` root with ~89 `<map>`
children. Each `<map>` binds one input or LED to one VDJScript action:

```xml
<map value="2XK2_BUTTON_A" action="..." />
<map value="LED_2XK2_BUTTON_A" action="..." />
<map value="SHIFT_2XK2_BUTTON_A" action="..." />
<map value="SHIFT_LED_2XK2_BUTTON_A" action="..." />
```

Naming conventions for `value=`:

- `2XK2_*` — input shared between both K2s (decks chosen by side via `action_deck`)
- `K2L_*` / `K2R_*` — input local to that controller (e.g. browser encoders)
- `LED_*` — LED feedback for the named input (action runs as a query)
- `SHIFT_*` / `SHIFT_LED_*` — variant when shift is held
- `ONINIT` — runs once when the mapping is loaded; used here to seed all
  persistent variables and start the `filterUpdate` repeat task

XML escaping is mandatory inside `action="..."`:
`'` → `&apos;`, `&` → `&amp;`, `"` → `&quot;`, `<` → `&lt;`, `>` → `&gt;`.
Always preserve existing escaping when editing — VirtualDJ will silently fail to
load the mapping if the XML is malformed.

## The page system (central architecture)

The "latch layer" button is **not** the K2's hardware layer. It's reimplemented
in VDJScript on top of a single persistent counter:

- `@$cmdpagel` — current page on the left K2 (0–16)
- `@$cmdpage` / `@$cmdpager` — same for the right K2
- Page `0` is the **layer menu**: each matrix button A–P sets the counter to a
  page number and stays there.
- Pages `1`–`16` map A–P to one functional layer each
  (currently filled: 1=play, 2=slicer, 3=beat roll, 4=keycue, 5=hotcue,
  6=cueloop; 7–16 are reserved empty stubs).

Every matrix-button action follows the same shape — an if/elif chain over the
page variable, with one branch per page:

```
var '@$cmdpagel' 0 ? (set '@$cmdpagel' N & set '@$currpagel' '@$cmdpagel') : nothing &
var '@$cmdpagel' 1 ? (deck 1 pioneer_cue)                                 : nothing &
var '@$cmdpagel' 2 ? (deck 1 slicer 1 hold)                               : nothing &
... (one line per page through 16)
```

The matching `LED_*` and `SHIFT_LED_*` mappings have the same per-page
structure, returning a color/blink for that page's state. Empty page slots use
`()` or `nothing` and must be preserved as placeholders.

**When adding a new binding, edit every parallel structure**: the input action,
its `LED_*` feedback, the `SHIFT_*` variant, and `SHIFT_LED_*`. Don't reformat
the existing chain whitespace — the indentation makes the per-page rows
visually scannable and the user reads it that way.

## The Typst manual (`documentation/`)

Compiles to `documentation/VDJ-XoneViv2-Manual.pdf`. Entry point is `main.typ`,
which `#include`s the section files in order:

```
main.typ
├─ setup.typ                  (placeholder)
├─ layout-overview.typ        (intro + per-K2 SVG figures)
├─ encoders-top.typ           (top encoder section, normal + shift)
└─ pageLayer.typ + pageA..pageF.typ  (button matrix pages, one per layer)
```

`pageG.typ` … `pageP.typ` are empty stubs matching the empty XML page slots —
both stay empty until that page is actually filled.

### Templates

The whole manual is built from three shared template files in `templates/`:

- `text.typ` — colors (`bgcolor`, `textcolor`, deck colors), `target` records
  (`deck1`–`deck4`, `deck13`, `deck24`, `decklocal`, `global`, `unmapped-target`,
  `sameInShift-target`, `VirtualDJ`, `Ableton`, `model1`), and the encoder symbols.
- `cmds-ins.typ` — the typed records:
  - `command(command-name, command-description, target, LED, ...)` — a single command
  - `pad-command(...)` — a command intended to fill 8 pads
  - `button(command, target)` and `encoder(command-push, target-push, command-turn, target-turn)` — input bindings
  - `unmapped-command`, `sameInShift-command` — placeholder cells
  - `create-pad-set(cmd)` — duplicates a `pad-command` into an 8-element array,
    appending 1..8 to the name (used for hotcues, slicer slots, etc.)
  - `create-duplicate-set(cmd)` — 8 copies of the same command (used to fill a
    matrix block with `sameInShift-command` when shift does nothing different)
  - `prepend-page-letter(pagearray)` — prepends `A:`, `B:`, `C:`… to each cell's
    name (used on the layer menu page)
- `layouts.typ` — grid composition. The key one is **`dupebuttonmatrix(normal,
  shift)`**: takes 8 commands per mode and renders the four matrices
  (deck 1, 3, 2, 4 in their controller-side positions) for both normal and
  shift modes via `lrk2-vertshift-layout`.

### Page file shape

Filled pages follow this template (see `pageA.typ`, `pageE.typ`, `pageF.typ`):

```typst
#import "templates/text.typ": *
#import "templates/cmds-ins.typ": *
#import "templates/layouts.typ": *

#let mycmd = command(
  command-name: "play",
  command-description: "",
  target: decklocal,
)

=== Page X - Title

#dupebuttonmatrix(
  ( ... 8 normal-mode commands ... ),
  ( ... 8 shift-mode commands ... ),
)
#pagebreak()
```

`copypaste-templates/button-page.typ` and `pad-page.typ` are starter snippets
for adding a new filled page — copy, rename, fill, then `#include` it from
`main.typ`.

## Workflow when editing a binding

1. **Edit the XML.** Find the affected `<map>` (and its `LED_`, `SHIFT_`,
   `SHIFT_LED_` siblings), update the action, keep existing XML escaping and
   the per-page chain layout.
2. **Mirror the change in the matching `pageX.typ`** so the manual stays
   accurate. New pages also need to be added to the `#include` list in `main.typ`
   and an empty stub upgraded.
3. **Re-render the PDF**: `typst compile documentation/main.typ
   documentation/VDJ-XoneViv2-Manual.pdf` (or `typst watch …` while iterating).
4. **Don't auto-format the XML**. Hand-aligned per-page rows are the readable
   form for this file; reflowing it makes it harder to maintain.

## What not to do without being asked

- Don't fill the empty page slots G–P (or their Typst stubs). They are reserved.
- Don't remap faders, the right K2 rotary pot section, or the unmapped knob
  buttons — those are intentionally left for user-side mapping.
- Don't change the deck-stacking layout or deck color assignments; downstream
  SVGs, manual figures, and muscle memory all depend on them.
- Don't introduce a new variable scope/prefix when an existing `@$`/`$`
  variable already covers the case; the page system is consistent on purpose.
