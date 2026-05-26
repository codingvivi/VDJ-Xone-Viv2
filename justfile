root-dir := justfile_directory()

src-dir := root-dir / "src"

map-prefix := "Allen & Heath XONE K2 - VDJ-Xone_Viv2-"
map-suffix := ".xml"

install-dir := "$HOME/Library/Application Support/VirtualDJ/Mappers"

_default:
    just -l
    
_link-side side:
    #!/usr/bin/env bash
    set -euxo pipefail
    src_file='{{map-prefix}}{{side}}{{map-suffix}}'
    ln -s "{{src-dir}}/$src_file" "{{install-dir}}/$src_file"

link:
    just link l
    just link r
