scoreboard players reset @s pocket_dimension.leave_game
execute unless dimension pocket_dimension:realm run return fail

execute if data storage pocket_dimension:temp {enter_success:1b} run data modify storage pocket_dimension:temp register_exit.UUID set from entity @s UUID
execute if data storage pocket_dimension:temp {enter_success:1b} run function pocket_dimension:read_exit_register_follow with storage pocket_dimension:temp register_exit
