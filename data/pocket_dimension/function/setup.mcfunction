# create scoreboards
scoreboard objectives add pocket_dimension.data dummy
scoreboard objectives add pocket_dimension.carrot_on_a_stick minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add pocket_dimension.leave_game minecraft.custom:minecraft.leave_game
scoreboard objectives add pocket_dimension.id dummy
scoreboard objectives add pocket_dimension.break_time dummy

# set variables
execute unless score %step_id pocket_dimension.id matches -1.. run scoreboard players set %step_id pocket_dimension.id 0

# reload all pockets if error occured
execute in pocket_dimension:realm as @e[tag=pocket_dimension.anchor,type=marker] run function pocket_dimension:reconsider_id_score with entity @s data

# save world spawn location
summon area_effect_cloud ~ ~ ~ {Tags:["pocket_dimension","pocket_dimension.temp"],custom_particle:{type:"block",block_state:"minecraft:air"},Radius:0f,Duration:0}
data modify storage pocket_dimension:temp world_spawn.dimension set value "minecraft:overworld"
data modify storage pocket_dimension:temp world_spawn.yaw set from entity @n[tag=pocket_dimension.temp] Rotation[0]
data modify storage pocket_dimension:temp world_spawn.pitch set from entity @n[tag=pocket_dimension.temp] Rotation[1]
data modify storage pocket_dimension:temp world_spawn.posX set from entity @n[tag=pocket_dimension.temp] Pos[0]
data modify storage pocket_dimension:temp world_spawn.posY set from entity @n[tag=pocket_dimension.temp] Pos[1]
data modify storage pocket_dimension:temp world_spawn.posZ set from entity @n[tag=pocket_dimension.temp] Pos[2]
execute as @n[tag=pocket_dimension.temp] run kill @s

# revoke trigger advancements
advancement revoke @a only pocket_dimension:leave_pocket
advancement revoke @a only pocket_dimension:leave_rift

# check for Version
execute unless data storage pocket_dimension:temp {game_version:"1.21.11",version:"3.0"} run function pocket_dimension:update

# loaded Message
tellraw @a ["\n",{translate:pocket_dimension.message.game_loaded,bold:false,color:"white",with:[{text:"Pocket Dimensions",bold:false,color:"white"}]}]

tellraw @a [{translate:pocket_dimension.message.version,color:"yellow",with:[{storage:"pocket_dimension:temp",nbt:game_version,color:"green",interpret:true},{storage:"pocket_dimension:temp",nbt:version,color:"gray",interpret:true}]}]

tellraw @a ["",{translate:pocket_dimension.message.report_bug,color:"red",with:[{translate:pocket_dimension.message.here,bold:false,underlined:true,color:"red",click_event:{action:"open_url",url:"https://github.com/MavLeague/pocket_dimension/issues"},hover_event:{action:"show_text",value:[{text:"GitHub Issue"}]}}]}]

