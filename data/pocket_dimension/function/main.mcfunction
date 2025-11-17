# Detect if a player is holding a warped fungus on a stick with pocket data and run the click detection function
execute as @a[scores={pocket_dimension.carrot_on_a_stick=1..}] if data entity @s SelectedItem.components.minecraft:custom_data.pocket run function pocket_dimension:assign_id

# Handle interaction clicks on pocket dimension displays
execute at @a as @e[distance=..20,type=interaction,tag=pocket_dimension.display.interaction] at @s if data entity @s interaction run function pocket_dimension:interaction_detection
execute at @a as @e[distance=..20,type=interaction,tag=pocket_dimension.display.interaction] at @s if data entity @s attack run function pocket_dimension:interaction_attack_detection

# Remove pocket dimension displays after a short time
execute at @a as @e[distance=..20,tag=pocket_dimension.leave_marker,nbt={Age:2}] at @s run function pocket_dimension:remove_pocket_display

# Place pocket dimension blocks initiated by armor stands
execute at @a as @e[type=armor_stand,tag=pocket_dimension.block_initiator] at @s run function pocket_dimension:place_pocket

#execute as @e[tag=test1] at @s on passengers if data entity @s {Age:2} run function pocket_dimension:testfunktion2
#execute as @e[tag=test1] at @s on passengers if data entity @s {Age:12} on vehicle run function pocket_dimension:testfunktion3

# Animate breaking pockets
execute at @a as @e[distance=..20,type=interaction,tag=pocket_dimension.display.interaction,scores={pocket_dimension.break_time=0..200}] run scoreboard players add @s pocket_dimension.break_time 1
execute at @a as @e[distance=..20,type=interaction,tag=pocket_dimension.display.interaction,scores={pocket_dimension.break_time=200..}] run scoreboard players reset @s pocket_dimension.break_time
