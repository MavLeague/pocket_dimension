## Enter Pocket Dimension

# add tag for identification
tag @s add pocket_dimension.highjacker

# try teleport to room
data modify storage pocket_dimension:temp enter_success set value 0b
$execute in pocket_dimension:realm store success storage pocket_dimension:temp enter_success byte 1 positioned as @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}}] run tp @s ~4 ~1 ~4

# message
execute in pocket_dimension:realm if data storage pocket_dimension:temp {enter_success:0b} run title @s actionbar {text:"Room isn't available or can't be entered!",color:"yellow"}

#tag @s add pocket_dimension.entered