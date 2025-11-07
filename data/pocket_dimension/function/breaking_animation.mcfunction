# if over time limit: initialize break interval if not set and reset break time
execute unless score @s pocket_dimension.break_time matches 0..200 on passengers as @s[type=marker] run data modify entity @s data.break_interval set value 0
execute unless score @s pocket_dimension.break_time matches 0..200 run scoreboard players set @s pocket_dimension.break_time 0

# if within time limit: increment break interval
execute if score @s pocket_dimension.break_time matches 30..200 on passengers as @s[type=marker] if data entity @s {data:{break_interval:0}} run data modify entity @s data.break_interval set value 1
execute if score @s pocket_dimension.break_time matches 30..200 on passengers as @s[type=marker] if data entity @s {data:{break_interval:1}} run data modify entity @s data.break_interval set value 2
execute if score @s pocket_dimension.break_time matches 30..200 on passengers as @s[type=marker] if data entity @s {data:{break_interval:2}} run data modify entity @s data.break_interval set value 3
execute if score @s pocket_dimension.break_time matches 30..200 on passengers as @s[type=marker] if data entity @s {data:{break_interval:3}} run data modify storage pocket_dimension:temp pocket_break.kick_players set value 1b

# reset break time if interval reached
execute if score @s pocket_dimension.break_time matches 30..200 run scoreboard players set @s pocket_dimension.break_time 0

say breaking animation executed