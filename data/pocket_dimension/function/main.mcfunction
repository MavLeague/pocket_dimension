execute as @a[scores={pocket_dimension.warped_fungus_on_a_stick=1..}] if data entity @s SelectedItem.components.minecraft:custom_data.pocket run function pocket_dimension:click_detected

execute at @a as @e[distance=..20,type=interaction,tag=pocket_dimension.display.interaction] if data entity @s interaction run function pocket_dimension:highjack/click_detection

execute at @a as @e[distance=..20,tag=pocket_dimension.leave_marker,nbt={Age:2}] at @s run function pocket_dimension:remove_pocket_display
