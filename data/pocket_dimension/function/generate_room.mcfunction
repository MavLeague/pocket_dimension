# load chunk
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run forceload add ~ ~


$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run summon marker ~ ~ ~ {Tags:["pocket_dimension","pocket_dimension.anchor"],data:{id:$(id)}}
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 as @n[tag=pocket_dimension.anchor] run scoreboard players operation @s pocket_dimension.id = %step_id pocket_dimension.id
$execute in pocket_dimension:realm positioned $(pos_x) 0.0 0.0 run fill ~ ~ ~ ~8 ~8 ~8 minecraft:bedrock hollow

say boom