# Place Pocket Dimension Function

execute if dimension pocket_dimension:realm run return run function pocket_dimension:place_pocket_breakup

# check if pocket has a counterpart
function pocket_dimension:proof_placement with entity @s equipment.mainhand.components.minecraft:custom_data

# Initialize placement status
data modify storage pocket_dimension:temp pocket_placed set value 1b
execute run function pocket_dimension:check_4_open_pocket with entity @s equipment.mainhand.components.minecraft:custom_data
# Place or refund pocket dimension item based on placement status
execute if data storage pocket_dimension:temp {pocket_placed:0b} run function pocket_dimension:place_pocket_follow with entity @s equipment.mainhand.components.minecraft:custom_data
execute if data storage pocket_dimension:temp {pocket_placed:1b} run function pocket_dimension:refund_pocket_item with entity @s equipment.mainhand.components.minecraft:custom_data
execute if data storage pocket_dimension:temp {pocket_placed:1b} run title @a[distance=..6] actionbar {"text":"Pocket is already placed!","color":"yellow"}
kill @s[type=armor_stand,tag=pocket_dimension.block_initiator]
