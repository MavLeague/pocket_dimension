scoreboard objectives remove pocket_dimension.data
scoreboard objectives remove pocket_dimension.id
scoreboard objectives remove pocket_dimension.carrot_on_a_stick

execute in pocket_dimension:realm at @e[tag=pocket_dimension.anchor] run fill ~ ~ ~ ~8 ~8 ~8 air replace
execute in pocket_dimension:realm at @e[tag=pocket_dimension.anchor] run fill ~-1 ~15 ~-1 ~1 ~12 ~1 air replace
execute in pocket_dimension:realm run kill @e[type=!player,distance=0..]

execute in pocket_dimension:realm as @a[distance=0..] in minecraft:overworld positioned 0.0 0.0 0.0 positioned over motion_blocking_no_leaves run tp @s ~ ~ ~

tellraw @s [{"text":"Reinstalled pocket dimension.","color":"green"},"\n",{"text":"Please delete the folder ","color":"yellow"},{"text":"dimensions/pocket_dimension","color":"gray",italic:true},{"text":" in the world folder for a full reset!","color":"yellow",italic:false}]

function pocket_dimension:setup