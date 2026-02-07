# Leave Pocket Dimension Function
data modify storage pocket_dimension:temp pocket_placed set value 1b
execute at @s if entity @s[gamemode=!spectator] positioned ~ 0 0 store success storage pocket_dimension:temp pocket_placed byte 1 in pocket_dimension:realm if data entity @n[tag=pocket_dimension.anchor] {data:{placed:1b}}

# Leave pocket dimension if allowed
execute if data storage pocket_dimension:temp {pocket_placed:1b} at @s if entity @s[gamemode=!spectator] positioned ~ 0 0 run function pocket_dimension:leave_pocket_follow with entity @n[tag=pocket_dimension.anchor] data
execute if data storage pocket_dimension:temp {pocket_placed:0b} run function pocket_dimension:pocket_rift

advancement revoke @s only pocket_dimension:leave_pocket
