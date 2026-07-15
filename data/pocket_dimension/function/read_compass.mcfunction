advancement revoke @s only pocket_dimension:use_compass

# check if item is selected correctly
execute unless data entity @s SelectedItem.components.minecraft:custom_data.compass run return fail

# read id and check success
data modify storage pocket_dimension:temp compass.read_id.pocket_id set value 0
execute store result storage pocket_dimension:temp compass.read_id.pocket_id int 1 store success storage pocket_dimension:temp compass.has_id byte 1 run scoreboard players get @s pocket_dimension.id

# Initialize placement status
data modify storage pocket_dimension:temp pocket_placed set value 0b
execute run function pocket_dimension:check_4_open_pocket with storage pocket_dimension:temp compass.read_id
# Place or refund pocket dimension item based on placement status
execute if data storage pocket_dimension:temp {pocket_placed:0b} run item modify entity @s weapon.mainhand {function:"minecraft:set_components",components:{"minecraft:lodestone_tracker":{tracked:1b}}}

execute if data storage pocket_dimension:temp {pocket_placed:1b, compass:{has_id:1b}} run function pocket_dimension:assign_compass with storage pocket_dimension:temp compass.read_id
