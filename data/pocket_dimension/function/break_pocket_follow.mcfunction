#kick all players out of pocket
$execute as @a[dz=8,dx=8,y=0,dy=8] run function pocket_dimension:leave_pocket_follow {"Dimension":"$(Dimension)","Pos0":$(Pos0),"Pos1":$(Pos1),"Pos2":$(Pos2),"Rotation0":$(Rotation0)}

# mark pocket as unplaced
data modify entity @s data.placed set value 0b

# delete pocket display
$execute in $(Dimension) positioned $(Pos0) $(Pos1) $(Pos2) run summon area_effect_cloud ~ ~ ~ {Tags:["pocket_dimension","pocket_dimension.leave_marker"],custom_particle:{type:"block",block_state:"minecraft:air"},Radius:0f,Duration:10}

# clear unstable pocket item
#clear @s *[minecraft:custom_data~{pocket_unstable:1b,pocket:1b}]

data modify storage pocket_dimension:temp pocket_break.pocket_breaked set value 1b

#say breat pocket follow executed