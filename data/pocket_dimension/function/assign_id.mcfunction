execute unless score @s pocket_dimension.id matches 0.. run scoreboard players add %step_id pocket_dimension.id 1
execute unless score @s pocket_dimension.id matches 0.. run scoreboard players operation @s pocket_dimension.id = %step_id pocket_dimension.id

execute store result storage pocket_dimension:temp pocket_id int 1 run scoreboard players get @s pocket_dimension.id
function pocket_dimension:set_id with storage pocket_dimension:temp

# generate Room (if needed)
data modify storage pocket_dimension:temp room_exists set value 0
execute in pocket_dimension:realm as @e[tag=pocket_dimension.anchor,type=marker] store success storage pocket_dimension:temp room_exists byte 1 unless score @s pocket_dimension.id = %step_id pocket_dimension.id

execute if data storage pocket_dimension:temp {room_exists:0} store result storage pocket_dimension:temp pocket_generation.pos_x int 8 run scoreboard players get %step_id pocket_dimension.id
execute if data storage pocket_dimension:temp {room_exists:0} store result storage pocket_dimension:temp pocket_generation.id int 8 run scoreboard players get %step_id pocket_dimension.id

execute if data storage pocket_dimension:temp {room_exists:0} in pocket_dimension:realm run function pocket_dimension:generate_room with storage pocket_dimension:temp pocket_generation
