scoreboard players reset @s pocket_dimension.warped_fungus_on_a_stick

# prove full health
execute store result score #max_health pocket_dimension.data run attribute @s max_health get 1
execute store result score #health pocket_dimension.data run data get entity @s Health 1

# chose between leave and enter
# assign_id
execute if score #max_health pocket_dimension.data = #health pocket_dimension.data unless data entity @s SelectedItem.components.minecraft:custom_data.pocket_id unless dimension pocket_dimension:realm run function pocket_dimension:assign_id with entity @s SelectedItem.components.minecraft:custom_data

# enter
execute at @s unless dimension pocket_dimension:realm if score #max_health pocket_dimension.data = #health pocket_dimension.data if data entity @s SelectedItem.components.minecraft:custom_data.pocket_id unless data entity @s SelectedItem.components.minecraft:custom_data.pocket_unstable run function pocket_dimension:enter_pocket with entity @s SelectedItem.components.minecraft:custom_data

# leave
#execute unless entity @s[tag=pocket_dimension.entered] at @s if dimension pocket_dimension:realm if data entity @s SelectedItem.components.minecraft:custom_data.pocket_id run function pocket_dimension:leave_pocket with entity @s SelectedItem.components.minecraft:custom_data

execute as @s[tag=pocket_dimension.entered] run tag @s remove pocket_dimension.entered

# check for unstable
execute if data entity @s SelectedItem.components.minecraft:custom_data.pocket_unstable run item replace entity @s weapon with air


# debug
execute unless score #max_health pocket_dimension.data = #health pocket_dimension.data run title @s actionbar {"text":"You require full Health!","color":"yellow"}

