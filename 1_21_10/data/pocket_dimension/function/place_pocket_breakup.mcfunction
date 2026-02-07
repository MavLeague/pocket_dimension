function pocket_dimension:refund_pocket_item with entity @s equipment.mainhand.components.minecraft:custom_data
kill @s[type=armor_stand,tag=pocket_dimension.block_initiator]
title @a[distance=..6] actionbar {"text":"Pocket is unplaceable!","color":"yellow"}