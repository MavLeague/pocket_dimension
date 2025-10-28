#kick all highjackers
$execute as @a[tag=pocket_dimension.highjacker,dz=8,dx=8,y=0,dy=8] in $(Dimension) run tp @s $(Pos0) $(Pos1) $(Pos2) $(Rotation0) ~

# teleport player
$execute in $(Dimension) run tp @s $(Pos0) $(Pos1) $(Pos2) $(Rotation0) ~
$execute in $(Dimension) positioned $(Pos0) $(Pos1) $(Pos2) run summon area_effect_cloud ~ ~ ~ {Tags:["pocket_dimension","pocket_dimension.leave_marker"],custom_particle:{type:"block",block_state:"minecraft:air"},Radius:0f,Duration:10}

# clear unstable pocket item
#clear @s *[minecraft:custom_data~{pocket_unstable:1b,pocket:1b}]
