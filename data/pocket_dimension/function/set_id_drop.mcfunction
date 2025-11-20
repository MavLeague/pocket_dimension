$item modify entity @s container.0 {function:"minecraft:set_custom_data",tag:{pocket_id:$(pocket_id)}}
item modify entity @s container.0 {function:"minecraft:set_item",item:"minecraft:armor_stand"}
$item modify entity @s container.0 [{"function":"minecraft:set_lore","entity":"this","lore":[{"text":"Belongs to: ","color":"blue","bold":false,"italic":false,"extra":[{"text":"$(player_name)","bold":true}]}],"mode":"append"}]

$item modify entity @s container.0 {function:"minecraft:set_components",components:{"minecraft:entity_data":{id:"minecraft:armor_stand",Tags:["pocket_dimension","pocket_dimension.block_initiator"],equipment:{mainhand:{id:"minecraft:armor_stand",components:{"minecraft:custom_data":{pocket_id:$(pocket_id), player_name:"$(player_name)"},"minecraft:item_model":"pocket_dimension:blank"}}},Invulnerable:1b,Silent:1b,Invisible:1,NoBasePlate:1,Small:1}}}
