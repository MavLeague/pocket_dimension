data modify storage pocket_dimension:temp chunk_loaded set value 1b
$execute in $(Dimension) store success storage pocket_dimension:temp chunk_loaded byte 1 positioned $(Pos0) $(Pos1) $(Pos2) run forceload query ~ ~
$execute in $(Dimension) if data storage pocket_dimension:temp {chunk_loaded:0b} positioned $(Pos0) $(Pos1) $(Pos2) run forceload add ~ ~

$execute in $(Dimension) positioned $(Pos0) $(Pos1) $(Pos2) run function pocket_dimension:remove_pocket_display

$execute in $(Dimension) if data storage pocket_dimension:temp {chunk_loaded:0b} positioned $(Pos0) $(Pos1) $(Pos2) run forceload remove ~ ~
