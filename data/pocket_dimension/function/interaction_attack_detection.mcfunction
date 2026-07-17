# check if pocketdimension:realm has been loaded correctly
data modify storage pocket_dimension:temp pocket_breaked.realm_loaded set value 0b
execute store success storage pocket_dimension:temp pocket_breaked.realm_loaded byte 1 in pocket_dimension:realm if dimension pocket_dimension:realm

execute if data storage pocket_dimension:temp {pocket_breaked:{realm_loaded:0b}} run data remove entity @s attack
execute if data storage pocket_dimension:temp {pocket_breaked:{realm_loaded:0b}} run return run title @a[distance=..10] actionbar [{translate:"pocket_dimension.error_code"},{text:" 100 :"},{translate:"pocket_dimension.actionbar.realm_not_loaded"}]
# check if pocket.anchor is available
data modify storage pocket_dimension:temp pocket_loaded set value 0b
execute on passengers as @s[type=marker] run function pocket_dimension:check_4_loaded_pocket with entity @s data

execute if data storage pocket_dimension:temp {pocket_loaded:0b} run data remove entity @s attack
execute if data storage pocket_dimension:temp {pocket_loaded:0b} run return run title @a[distance=..10] actionbar [{translate:"pocket_dimension.error_code"},{text:" 101 :"},{translate:"pocket_dimension.actionbar.pocket_not_loaded"}]

# break pocket without players
data modify storage pocket_dimension:temp pocket_break.kick_players set value 0b
execute on passengers as @s[type=marker] run function pocket_dimension:break_pocket with entity @s data

execute if data storage pocket_dimension:temp {pocket_break:{has_players:1b}} run function pocket_dimension:breaking_animation
execute if data storage pocket_dimension:temp {pocket_break:{kick_players:1b}} on passengers as @s[type=marker] run function pocket_dimension:break_pocket with entity @s data

#say interaction attack detected
data remove entity @s attack