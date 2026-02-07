# Place Pocket Dimension Function

# error prevention
data modify storage pocket_dimension:temp room_exists set value 0

execute in pocket_dimension:realm as @e[tag=pocket_dimension.anchor,type=marker] \
    run function pocket_dimension:reconsider_id_score with entity @s data
#
execute in pocket_dimension:realm as @e[tag=pocket_dimension.anchor,type=marker] \
    if score @s pocket_dimension.id = %step_id pocket_dimension.id \
    run data modify storage pocket_dimension:temp room_exists set value 1
#
execute unless data storage pocket_dimension:temp {room_exists:1} run return run function pocket_dimension:place_pocket_breakup
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
