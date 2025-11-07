tellraw @a ["\n",{text:"Pocket Dimensions",bold:false,color:"white"},{text:" are loaded!",bold:false,color:"white"}]

tellraw @a [{text:"Version: ",color:"yellow"},{text:"1.21.9",color:"green"},{text:".0.2",color:"gray"}]

# create scoreboards
scoreboard objectives add pocket_dimension.data dummy
scoreboard objectives add pocket_dimension.warped_fungus_on_a_stick minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add pocket_dimension.id dummy
scoreboard objectives add pocket_dimension.break_time dummy

# set variables
execute unless score %step_id pocket_dimension.id matches -1.. run scoreboard players set %step_id pocket_dimension.id -1