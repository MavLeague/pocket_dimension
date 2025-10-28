execute if entity @s[gamemode=!spectator,tag=!pocket_dimension.highjacker] positioned ~ 0 0 run function pocket_dimension:leave_pocket_follow with entity @n[tag=pocket_dimension.anchor] data
execute if entity @s[gamemode=!spectator,tag=pocket_dimension.highjacker] positioned ~ 0 0 run function pocket_dimension:highjack/leave_pocket_follow with entity @n[tag=pocket_dimension.anchor] data

advancement revoke @s only pocket_dimension:leave_pocket
