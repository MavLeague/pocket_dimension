# This Function will be run once after installing an update to ensure up to date data
# if you want to run this function again, run this and reload: /data remove storage pocket_dimension:temp version
tellraw @a {text:"Updating Pocket Dimensions..."}

# Migrade to 2.0
# Update pocket display tags
execute in pocket_dimension:realm as @e[type=item_display,tag=pocket_dimension.display] if data entity @s {item:{components:{"minecraft:custom_model_data":{strings:["inside"]}}}} run tag @s add pocket_dimension.display.inside
execute in pocket_dimension:realm as @e[type=item_display,tag=pocket_dimension.display] if data entity @s {item:{components:{"minecraft:custom_model_data":{strings:["teleport"]}}}} run tag @s add pocket_dimension.display.teleport

# update ligt rendering for pockets
execute in pocket_dimension:realm as @e[type=item_display,tag=pocket_dimension.display.inside] unless data entity @s brightness run data modify entity @s brightness set value {sky:15,block:15}
execute in pocket_dimension:realm as @e[type=item_display,tag=pocket_dimension.display.teleport] unless data entity @s brightness run data modify entity @s brightness set value {sky:0,block:0}

# set to current version
data modify storage pocket_dimension:temp game_version set value "1.21.11"
data modify storage pocket_dimension:temp version set value "1.3"
