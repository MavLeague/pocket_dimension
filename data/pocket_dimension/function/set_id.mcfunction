$item modify entity @s weapon {function:"minecraft:set_custom_data",tag:{pocket_id:$(pocket_id)}}
item modify entity @s weapon [{"function":"minecraft:set_lore","entity":"this","lore":[{"text":"Belongs to: ","color":"blue","bold":false,"italic":false,"extra":[{"selector":"@s","bold":true}]}],"mode":"append"}]
