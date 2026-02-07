

# summon item when breaking pocket
summon item ~ ~ ~ {Tags:["pocket_dimension","pocket_dimension.item_drop"],Item:{id:"stone",count:1b,components:{"minecraft:item_model":"pocket_dimension:blank"}},PickupDelay:32767,Age:5990}

execute as @n[tag=pocket_dimension.item_drop] run loot replace entity @s container.0 loot pocket_dimension:pocket
$execute as @n[tag=pocket_dimension.item_drop] run function pocket_dimension:set_id_drop {pocket_id:$(pocket_id), player_name:"$(player_name)"}

data modify entity @n[tag=pocket_dimension.item_drop] PickupDelay set value 0
data modify entity @n[tag=pocket_dimension.item_drop] Age set value 0
