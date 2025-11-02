data modify entity @s transformation set value {left_rotation:[ 0.0f, 0.0f, 0.0f, 1.0f ],translation:[0.0f, 0.0f, 0.0f],right_rotation:[0f,0f,0f,1f],scale:[1f,1f,1f]}
data modify entity @n[tag=test1] interpolation_duration set value 0
data modify entity @s item.components.minecraft:custom_model_data.strings[0] set value "outside_side"
say test