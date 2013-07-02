setlocal tabstop=3 softtabstop=3 shiftwidth=3 expandtab " for MaGe & XMASS
"setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab " for BAT
"setlocal path=.,,..,~/work/MaGe/**,~/work/MGDL/**,~gsoft/usr/geant4.9.0.p01/source/**
"setlocal tags=~/work/MaGe/tags,~/work/MGDO/tags,~/work/geant4/tags
setlocal foldmethod=syntax
setlocal tags=~/XMan/trunk/src/tags
" :tj or g^] - jumping to the definition of a function from where it's called.
"              if there are multiple matches, a list will be shown
" :tn :tp    - going forward and backward in the list
" 
" ctags does not create tags for prototypes by default. You have to tell it
" with '--c-kinds=+p'.  Then take a look at the commands at :h tag-matchlist
