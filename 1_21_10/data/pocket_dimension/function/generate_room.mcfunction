# load chunk
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run forceload add ~ ~

# create anchor marker
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run summon marker ~ ~ ~ {Tags:["pocket_dimension","pocket_dimension.anchor"],data:{id:$(id),type: 1}}
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 as @n[tag=pocket_dimension.anchor] run scoreboard players set @s pocket_dimension.id $(id)

# generate room
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run fill ~ ~ ~ ~8 ~8 ~8 minecraft:bedrock hollow
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run fill ~3 ~2 ~ ~5 ~4 ~ end_gateway{ExactTeleport:1b,exit_portal:[I;$(pos_x),13,0]} replace
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run fill ~3 ~2 ~-1 ~5 ~4 ~-1 minecraft:bedrock
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run summon item_display ~4.0 ~4.0 ~4.0 {item:{id:"minecraft:carrot_on_a_stick",count:1,components:{"item_model":"pocket_dimension:display","minecraft:custom_model_data":{strings:["inside"]}}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,0.5f,0.5f],scale:[7f,7f,7f]},Tags:["pocket_dimension","pocket_dimension.display"]}

# generate exit platform
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run fill ~-1 ~15 ~-1 ~1 ~12 ~1 minecraft:bedrock hollow
$execute in pocket_dimension:realm positioned $(pos_x) 0 0 run summon item_display ~ ~14.0 ~ {item:{id:"minecraft:carrot_on_a_stick",count:1,components:{"item_model":"pocket_dimension:display","minecraft:custom_model_data":{strings:["teleport"]}}},Tags:["pocket_dimension","pocket_dimension.display"]}
