# Remove Pocket Dimension
# break outside displays
#$execute in pocket_dimension:realm as @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] run function remove_pocket_follow with entity @s data

# remove room blocks and displays
$execute in pocket_dimension:realm at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] run fill ~-1 ~ ~-1 ~15 ~15 ~15 minecraft:air
$execute in pocket_dimension:realm at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] positioned ~4 ~4 ~4 run kill @n[type=item_display,distance=..1,tag=pocket_dimension.display]
$execute in pocket_dimension:realm at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] positioned ~8 ~8 ~8 run kill @n[type=item_display,distance=..1,tag=pocket_dimension.display]
$execute in pocket_dimension:realm at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] positioned ~ ~14 ~ run kill @n[type=item_display,distance=..1,tag=pocket_dimension.display]

# reset scoreboard ids
$execute in pocket_dimension:realm as @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] run scoreboard players reset @s pocket_dimension.id
$execute as @a[scores={pocket_dimension.id=$(pocket_id)}] run scoreboard players reset @s pocket_dimension.id
$execute if score %step_id pocket_dimension.id matches $(pocket_id) run scoreboard players remove %step_id pocket_dimension.id 1
# remove anchor marker
$execute in pocket_dimension:realm as @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] run kill @s

tellraw @s [{"text":"Pocket Dimension has been removed.","color":"yellow"}]