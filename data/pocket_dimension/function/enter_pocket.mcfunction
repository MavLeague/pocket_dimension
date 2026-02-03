## Enter Pocket Dimension

# add tag for identification
#tag @s add pocket_dimension.highjacker

$execute in pocket_dimension:realm as @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] unless data entity @s data.type run data modify entity @s data.type set value 1

# rebuild vital structures
$execute in pocket_dimension:realm at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] run fill ~-1 ~15 ~-1 ~1 ~12 ~1 minecraft:bedrock hollow

$execute in pocket_dimension:realm at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id),type: 1}},distance=0..] run fill ~3 ~2 ~ ~5 ~4 ~ end_gateway{ExactTeleport:1b,exit_portal:[I;$(pos_x),13,0]} replace
$execute in pocket_dimension:realm at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id),type: 2}},distance=0..] run fill ~7 ~6 ~4 ~9 ~8 ~4 end_gateway{ExactTeleport:1b,exit_portal:[I;$(pos_x),13,0]} replace

$execute in pocket_dimension:realm at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id),type: 1}},distance=0..] run fill ~ ~ ~ ~8 ~ ~8 bedrock replace
$execute in pocket_dimension:realm at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id),type: 2}},distance=0..] run fill ~5 ~4 ~5 ~11 ~4 ~11 bedrock replace

# move leashed entities if present
tag @s add pocket_dimension.leasher
execute as @e[distance=..6,type=!minecraft:player] if data entity @s leash run function pocket_dimension:enter_pocket_leash with storage pocket_dimension:temp
tag @s remove pocket_dimension.leasher

# try teleport to room
data modify storage pocket_dimension:temp enter_success set value 0b
$execute in pocket_dimension:realm store success storage pocket_dimension:temp enter_success byte 1 at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id),type: 1}},distance=0..] run tp @s ~4 ~2 ~4
$execute in pocket_dimension:realm store success storage pocket_dimension:temp enter_success byte 1 at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id),type: 2}},distance=0..] run tp @s ~8 ~6 ~8

# message
execute in pocket_dimension:realm if data storage pocket_dimension:temp {enter_success:0b} run title @s actionbar {text:"Room isn't available or can't be entered!",color:"yellow"}

#tag @s add pocket_dimension.entered