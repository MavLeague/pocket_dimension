## Enter Pocket Dimension
# save Position, Rotation and Dimension of Player
$execute in pocket_dimension:realm run data modify entity @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}}] data.Pos0 set from entity @s Pos[0]
$execute in pocket_dimension:realm run data modify entity @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}}] data.Pos1 set from entity @s Pos[1]
$execute in pocket_dimension:realm run data modify entity @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}}] data.Pos2 set from entity @s Pos[2]
$execute in pocket_dimension:realm run data modify entity @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}}] data.Rotation0 set from entity @s Rotation[0]
$execute in pocket_dimension:realm run data modify entity @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}}] data.Dimension set from entity @s Dimension

# check for correct item
$scoreboard players set #current_id pocket_dimension.id $(pocket_id)
execute unless score @s pocket_dimension.id = #current_id pocket_dimension.id run loot replace entity @s weapon loot pocket_dimension:unstable_pocket

#$item modify entity @s weapon {function:"minecraft:set_custom_data",tag:{pocket_id:$(pocket_id)}}

# try teleport to room
data modify storage pocket_dimension:temp enter_success set value 0b
$execute in pocket_dimension:realm store success storage pocket_dimension:temp enter_success byte 1 positioned as @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}}] run tp @s ~4 ~1 ~4

# message
execute in pocket_dimension:realm if data storage pocket_dimension:temp {enter_success:0b} run title @s actionbar {text:"Room isn't available or can't be entered!",color:"yellow"}

# spawn decoration
execute if data storage pocket_dimension:temp {enter_success:1b} run summon item_display ~ ~ ~ {Tags:["pocket_dimension","pocket_dimension.display"],item:{id:warped_fungus_on_a_stick,components:{"minecraft:custom_model_data":{strings:["pocket_display"]}}}}


tag @s add pocket_dimension.entered