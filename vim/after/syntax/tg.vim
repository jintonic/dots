" Geant4 text geometry input file syntax
if exists("b:current_syntax")
  finish
endif

syn keyword Statement isot elem elem_from_isot mate mixt 
syn keyword Statement mixt_by_weight mixt_by_natoms mixt_by_volume
syn keyword Statement solid color colour rotm vis check_overlaps
syn keyword Statement div_width div_ndiv div_ndiv_width repl 
syn keyword Statement volu volu_assembly place place_param place_assembly
syn match Statement "^:p " 

syn keyword Type BOX TUBE TUBS CONE CONS TRD PARA TRAP SPHERE ORB TORUS
syn keyword Type POLOCONE POLYHEDRA ELLIPTICAL_TUBE ELLIPSOID ELLIPTICAL_CONE HYPE TET 
syn keyword Type TWISTED_BOX TWISTED_TRAP TWISTED_TRD TWISTED_TUBS

syn keyword Type LINEAR LINEAR_X LINEAR_Y LINEAR_Z CIRCLE 
syn keyword Type SQUARE SQUARE_XZ SQUARE_XY SQUARE_YZ

syn match PreProc "^#include"

syn keyword Constant G4_AIR G4_Au
