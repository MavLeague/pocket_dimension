# reset temp storage variables
data modify storage pocket_dimension:temp pocket_break.data_written set value 0b
data modify storage pocket_dimension:temp pocket_break.pocket_breaked set value 0b

# delete when no players are in pocket
$execute unless data storage pocket_dimension:temp {pocket_break:{kick_players:1b}} in pocket_dimension:realm as @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}}] at @s unless entity @p[dz=15,dx=15,y=0,dy=15,gamemode=!spectator] run function pocket_dimension:break_pocket_follow with entity @s data

# delete when players are in pocket and kick_players is set
$execute if data storage pocket_dimension:temp {pocket_break:{kick_players:1b}} in pocket_dimension:realm as @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}}] at @s run function pocket_dimension:break_pocket_follow with entity @s data



# summon item when breaking pocket
$execute if data storage pocket_dimension:temp {pocket_break:{pocket_breaked:1b}} run function pocket_dimension:refund_pocket_item {pocket_id:$(pocket_id), player_name:"$(player_name)"}
#execute if data storage pocket_dimension:temp {pocket_break:{pocket_breaked:1b}} run say drops gelutscht

# check if players are in pocket to set has_players flag
data modify storage pocket_dimension:temp pocket_break.has_players set value 0b
$execute in pocket_dimension:realm as @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}}] at @s if entity @p[dz=15,dx=15,y=0,dy=15,gamemode=!spectator] run data modify storage pocket_dimension:temp pocket_break.has_players set value 1b

# clear unstable pocket item
#clear @s *[minecraft:custom_data~{pocket_unstable:1b,pocket:1b}]


#say breat pocket executed
