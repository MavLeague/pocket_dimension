#tellraw @a {"score":{"name":"@s","objective":"pocket_dimension.break_time"},"color":"yellow"}

# initial reset
execute if score @s pocket_dimension.break_time matches 1 on passengers as @s[type=item_display] run data modify entity @s transformation set value {left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.1f,0f],scale:[1f,1f,1f]}
#execute if score @s pocket_dimension.break_time matches 1 on passengers as @s[type=item_display] run data modify entity @s item.components.minecraft:custom_model_data.strings[0] set value "outside_animation"

# animation steps
execute if score @s pocket_dimension.break_time matches 1 on passengers as @s[type=item_display] run data modify entity @s transformation.right_rotation set value [ 0.0871557f, 0.0f, 0.0f, 0.9961947f]
execute if score @s pocket_dimension.break_time matches 6 on passengers as @s[type=item_display] run data modify entity @s transformation.right_rotation set value [ -0.0871557f, 0.0f, 0.0f, 0.9961947f]
execute if score @s pocket_dimension.break_time matches 11 on passengers as @s[type=item_display] run data modify entity @s transformation.right_rotation set value [ 0.0871557f, 0.0f, 0.0f, 0.9961947f]
execute if score @s pocket_dimension.break_time matches 16 on passengers as @s[type=item_display] run data modify entity @s transformation.right_rotation set value [ -0.0871557f, 0.0f, 0.0f, 0.9961947f]
execute if score @s pocket_dimension.break_time matches 21 on passengers as @s[type=item_display] run data modify entity @s transformation.right_rotation set value [ 0.0871557f, 0.0f, 0.0f, 0.9961947f]
execute if score @s pocket_dimension.break_time matches 26 on passengers as @s[type=item_display] run data modify entity @s transformation.right_rotation set value [ -0.0871557f, 0.0f, 0.0f, 0.9961947f]

# end reset
execute if score @s pocket_dimension.break_time matches 31 on passengers as @s[type=item_display] run data modify entity @s transformation.right_rotation set value [0f,0f,0f,1f]
execute if score @s pocket_dimension.break_time matches 31 on passengers as @s[type=item_display] run data modify entity @s transformation set value {left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]}


execute on passengers as @s[type=item_display] run data modify entity @s start_interpolation set value -1b
execute on passengers as @s[type=item_display] run data modify entity @s interpolation_duration set value 5

#execute if score @s pocket_dimension.break_time matches 36 on passengers as @s[type=item_display] run data modify entity @s item.components.minecraft:custom_model_data.strings[0] set value "outside"

execute on passengers as @s[type=marker] run function pocket_dimension:breaking_animation_tick_particles with entity @s data