$execute in $(Dimension) run tp @s $(Pos0) $(Pos1) $(Pos2) $(Rotation0) ~
$execute in $(Dimension) positioned $(Pos0) $(Pos1) $(Pos2) run kill @e[type=item_display,tag=pocket_dimension.display,distance=..0.1]

clear @s *[minecraft:custom_data~{pocket_unstable:1b,pocket:1b}]
