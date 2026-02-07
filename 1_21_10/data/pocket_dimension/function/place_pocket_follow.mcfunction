## Enter Pocket Dimension
# save Position, Rotation and Dimension of Player
data modify storage pocket_dimension:temp Dimension set from entity @p[distance=0..] Dimension
$execute in pocket_dimension:realm run data modify entity @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] data.Pos0 set from entity @s Pos[0]
$execute in pocket_dimension:realm run data modify entity @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] data.Pos1 set from entity @s Pos[1]
$execute in pocket_dimension:realm run data modify entity @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] data.Pos2 set from entity @s Pos[2]
$execute in pocket_dimension:realm run data modify entity @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] data.Rotation0 set from entity @s Rotation[0]
$execute in pocket_dimension:realm run data modify entity @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] data.Dimension set from storage pocket_dimension:temp Dimension
$execute in pocket_dimension:realm run data modify entity @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] data.placed set value 1b

# check for correct item
$scoreboard players set #current_id pocket_dimension.id $(pocket_id)
#execute unless score @s pocket_dimension.id = #current_id pocket_dimension.id run loot replace entity @s weapon loot pocket_dimension:unstable_pocket

#$item modify entity @s weapon {function:"minecraft:set_custom_data",tag:{pocket_id:$(pocket_id)}}

# try teleport to room
#data modify storage pocket_dimension:temp enter_success set value 0b
#$execute in pocket_dimension:realm store success storage pocket_dimension:temp enter_success byte 1 positioned as @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}}] run tp @s ~4 ~1 ~4

# message
#execute in pocket_dimension:realm if data storage pocket_dimension:temp {enter_success:0b} run title @s actionbar {text:"Room isn't available or can't be entered!",color:"yellow"}

# spawn decoration
$summon interaction ~ ~ ~ {width:0.5f,height:0.5f,response:1b,Tags:["pocket_dimension","pocket_dimension.display","pocket_dimension.display.interaction"],Passengers:[{id:"minecraft:item_display",Tags:["pocket_dimension","pocket_dimension.display","pocket_dimension.display.display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:carrot_on_a_stick",count:1,components:{"minecraft:item_model":"pocket_dimension:display","minecraft:custom_model_data":{strings:["outside"]}}}},{id:"minecraft:marker",Tags:["pocket_dimension","pocket_dimension.display","pocket_dimension.display.data"],data:{pocket_id:$(pocket_id), player_name:"$(player_name)"}},{id:"minecraft:armor_stand",NoGravity:1b,Marker:0b,Invisible:1b,NoBasePlate:1b,Tags:["pocket_dimension","pocket_dimension.display","pocket_dimension.display.hitbox"],attributes:[{base: 0.25d, id:"minecraft:scale"}]}]}

#data modify entity @n[tag=pocket_dimension.display.data,distance=..1] data.components set from entity @s equipment.mainhand.components


#say placed Pocket Dimension!
