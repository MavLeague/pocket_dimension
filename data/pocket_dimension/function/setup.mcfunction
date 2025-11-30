tellraw @a ["\n",{text:"Pocket Dimensions",bold:false,color:"white"},{text:" are loaded!",bold:false,color:"white"}]

tellraw @a [{text:"Version: ",color:"yellow"},{text:"1.21.10",color:"green"},{text:".0.6",color:"gray"}]

tellraw @a ["",{text:"⚠ If you find a bug,\nplease report it ",color:"red"},{text:"here!",bold:false,underlined:true,color:"red",click_event:{action:"open_url",url:"https://github.com/MavLeague/pocket_dimension/issues"},hover_event:{action:"show_text",value:[{text:"GitHub Issue"}]}}]

# create scoreboards
scoreboard objectives add pocket_dimension.data dummy
scoreboard objectives add pocket_dimension.carrot_on_a_stick minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add pocket_dimension.id dummy
scoreboard objectives add pocket_dimension.break_time dummy

# set variables
execute unless score %step_id pocket_dimension.id matches -1.. run scoreboard players set %step_id pocket_dimension.id -1