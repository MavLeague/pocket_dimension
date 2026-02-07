$data modify entity @s data.break_interval set value $(index)
# reset break time if interval reached
execute on vehicle run scoreboard players set @s pocket_dimension.break_time 0
