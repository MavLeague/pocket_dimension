tellraw @a ["\n",{text:"Pocket Dimensions",bold:false,color:"white"},{text:" are loaded!",bold:false,color:"white"},"\n",{text:"Version: ",color:"yellow"},{text:"1.21.5",color:"green"},{text:".0.1",color:"gray"}]

# create scoreboards
scoreboard objectives add pocket_dimension.data dummy
scoreboard objectives add pocket_dimension.warped_fungus_on_a_stick minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add pocket_dimension.id dummy

# set variables
execute unless score %step_id pocket_dimension.id matches -1.. run scoreboard players set %step_id pocket_dimension.id -1