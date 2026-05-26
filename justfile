root-dir := justfile_directory()

src-dir := root-dir / "src"
docs-dir := root-dir / "docs"

map-prefix := "Allen & Heath XONE K2 - VDJ-Xone_Viv2-"
map-suffix := ".xml"

install-dir := "$HOME/Library/Application Support/VirtualDJ/Mappers"

_default:
    just -l

# Compile the Typst manual to docs/VDJ-XoneViv2-Manual.pdf
docs:
    typst compile "{{docs-dir}}/main.typ" "{{docs-dir}}/VDJ-XoneViv2-Manual.pdf"

# Rebuild the manual on every source change
docs-watch:
    typst watch "{{docs-dir}}/main.typ" "{{docs-dir}}/VDJ-XoneViv2-Manual.pdf"
    
_link-side side:
    #!/usr/bin/env bash
    set -euxo pipefail
    src_file='{{map-prefix}}{{side}}{{map-suffix}}'
    ln -s "{{src-dir}}/$src_file" "{{install-dir}}/$src_file"

link:
    just _link-side L
    just _link-side R
