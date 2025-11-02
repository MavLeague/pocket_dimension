$item modify entity @s weapon {function:"minecraft:set_custom_data",tag:{pocket_id:$(pocket_id)}}
item modify entity @s weapon {function:"minecraft:set_item",item:"minecraft:armor_stand"}
item modify entity @s weapon {function:"minecraft:set_components",components:{"minecraft:entity_data":{id:"minecraft:armor_stand",Tags:["pocket_dimension","pocket_dimension.block_initiator"]}}}
item modify entity @s weapon [{"function":"minecraft:set_lore","entity":"this","lore":[{"text":"Belongs to: ","color":"blue","bold":false,"italic":false,"extra":[{"selector":"@s","bold":true}]}],"mode":"append"}]
