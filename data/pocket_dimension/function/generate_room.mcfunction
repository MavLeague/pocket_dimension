# load chunk
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run forceload add ~ ~


$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run summon marker ~ ~ ~ {Tags:["pocket_dimension","pocket_dimension.anchor"],data:{id:$(id)}}
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 as @n[tag=pocket_dimension.anchor] run scoreboard players operation @s pocket_dimension.id = %step_id pocket_dimension.id

$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run fill ~ ~ ~ ~8 ~8 ~8 minecraft:bedrock hollow
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run fill ~3 ~2 ~ ~5 ~4 ~ end_gateway{ExactTeleport:1b,exit_portal:[I;$(pos_x),13,0]} replace
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run summon item_display ~4.0 ~4.0 ~4.0 {item:{id:"minecraft:warped_fungus_on_a_stick",count:1,components:{"minecraft:custom_model_data":{strings:["pocket_display","inside"]}}}}

$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run fill ~-1 ~15 ~-1 ~1 ~12 ~1 minecraft:bedrock hollow
$execute in pocket_dimension:realm positioned $(pos_x) 0 0 run summon item_display ~ ~14.0 ~ {item:{id:"minecraft:warped_fungus_on_a_stick",count:1,components:{"minecraft:custom_model_data":{strings:["pocket_display","teleport"]}}}}

say boom