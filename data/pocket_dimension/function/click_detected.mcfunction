scoreboard players reset @s pocket_dimension.warped_fungus_on_a_stick

# prove full health
execute store result score #max_health pocket_dimension.data run attribute @s max_health get 1
execute store result score #health pocket_dimension.data run data get entity @s Health 1

# assign_id
execute if score #max_health pocket_dimension.data <= #health pocket_dimension.data \
    unless data entity @s SelectedItem.components.minecraft:custom_data.pocket_id \
    at @s unless dimension pocket_dimension:realm \
    run function pocket_dimension:assign_id with entity @s SelectedItem.components.minecraft:custom_data
#

# enter pocket
#execute if score #max_health pocket_dimension.data = #health pocket_dimension.data \
    if data entity @s SelectedItem.components.minecraft:custom_data.pocket_id \
    at @s unless dimension pocket_dimension:realm \
    run function pocket_dimension:enter_pocket with entity @s SelectedItem.components.minecraft:custom_data
#

# enter pocket creative
#execute if entity @s[gamemode=creative] \
    if data entity @s SelectedItem.components.minecraft:custom_data.pocket_id \
    at @s unless dimension pocket_dimension:realm \
    run function pocket_dimension:enter_pocket with entity @s SelectedItem.components.minecraft:custom_data
#

# Note: to seperate between stable and unstable pockets use...
#   unless data entity @s SelectedItem.components.minecraft:custom_data.pocket_unstable \

#execute as @s[tag=pocket_dimension.entered] run tag @s remove pocket_dimension.entered

# check for unstable
execute if data entity @s SelectedItem.components.minecraft:custom_data.pocket_unstable run item replace entity @s weapon with air


# debug
execute unless score #max_health pocket_dimension.data = #health pocket_dimension.data run title @s actionbar {"text":"You require full Health!","color":"yellow"}