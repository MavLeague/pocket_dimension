$item modify entity @s weapon {function:"minecraft:set_custom_data",tag:{pocket_id:$(pocket_id)}}
item modify entity @s weapon {function:"minecraft:set_item",item:"minecraft:armor_stand"}
item modify entity @s weapon [{"function":"minecraft:set_lore","entity":"this","lore":[{"text":"Belongs to: ","color":"blue","bold":false,"italic":false,"extra":[{"selector":"@s","bold":true}]}],"mode":"append"}]

# write passthrough data for item drop handling
data modify storage pocket_dimension:temp set_id.player_name set from entity @s SelectedItem.components.minecraft:lore[2].extra[0].text
data modify storage pocket_dimension:temp set_id.pocket_id set from storage pocket_dimension:temp pocket_id

function pocket_dimension:set_id_follow with storage pocket_dimension:temp set_id