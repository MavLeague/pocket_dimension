# break pocket without players
data modify storage pocket_dimension:temp pocket_break.kick_players set value 0b
execute on passengers as @s[type=marker] run function pocket_dimension:break_pocket with entity @s data

execute if data storage pocket_dimension:temp {pocket_break:{has_players:1b}} run function pocket_dimension:breaking_animation
execute if data storage pocket_dimension:temp {pocket_break:{kick_players:1b}} on passengers as @s[type=marker] run function pocket_dimension:break_pocket with entity @s data

say interaction attack detected
data remove entity @s attack