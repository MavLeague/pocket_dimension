# reset temp storage variables
data modify storage pocket_dimension:temp pocket_break.data_written set value 0b
data modify storage pocket_dimension:temp pocket_break.pocket_breaked set value 0b

# delete when no players are in pocket
$execute unless data storage pocket_dimension:temp {pocket_break:{kick_players:1b}} in pocket_dimension:realm as @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}}] at @s unless entity @p[dz=8,dx=8,y=0,dy=8] run function pocket_dimension:break_pocket_follow with entity @s data

# delete when players are in pocket and kick_players is set
$execute if data storage pocket_dimension:temp {pocket_break:{kick_players:1b}} in pocket_dimension:realm as @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}}] at @s run function pocket_dimension:break_pocket_follow with entity @s data

# summon item when breaking pocket
execute if data storage pocket_dimension:temp {pocket_break:{pocket_breaked:1b}} run summon item ~ ~ ~ {Tags:["pocket_dimension","pocket_dimension.item_drop"],Item:{id:"stone",count:1b,components:{"minecraft:item_model":"pocket_dimension:blank"}},PickupDelay:32767,Age:5990}
execute if data storage pocket_dimension:temp {pocket_break:{pocket_breaked:1b}} store success storage pocket_dimension:temp pocket_break.data_written byte 1 on vehicle on passengers as @s[type=item_display] at @s run data modify entity @n[tag=pocket_dimension.item_drop] Item set from entity @s item
execute if data storage pocket_dimension:temp {pocket_break:{pocket_breaked:1b}} if data storage pocket_dimension:temp {pocket_break:{data_written:1b}} run data modify entity @n[tag=pocket_dimension.item_drop] PickupDelay set value 0
execute if data storage pocket_dimension:temp {pocket_break:{pocket_breaked:1b}} if data storage pocket_dimension:temp {pocket_break:{data_written:1b}} run data modify entity @n[tag=pocket_dimension.item_drop] Age set value 0

#execute if data storage pocket_dimension:temp {pocket_break:{pocket_breaked:1b}} run say drops gelutscht

# check if players are in pocket to set has_players flag
data modify storage pocket_dimension:temp pocket_break.has_players set value 0b
$execute in pocket_dimension:realm as @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}}] at @s if entity @p[dz=8,dx=8,y=0,dy=8] run data modify storage pocket_dimension:temp pocket_break.has_players set value 1b

# clear unstable pocket item
#clear @s *[minecraft:custom_data~{pocket_unstable:1b,pocket:1b}]

execute on vehicle on passengers as @s[type=item_display] run loot replace entity @s container.0 loot pocket_dimension:pocket
$execute on vehicle on passengers as @s[type=item_display] run function pocket_dimension:set_id_drop {pocket_id:$(pocket_id), player_name:"$(player_name)"}


#say breat pocket executed
