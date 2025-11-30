## Enter Pocket Dimension

# add tag for identification
#tag @s add pocket_dimension.highjacker

$execute in pocket_dimension:realm as @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id)}},distance=0..] unless data entity @s data.type run data modify entity @s data.type set value 1

# try teleport to room
data modify storage pocket_dimension:temp enter_success set value 0b
$execute in pocket_dimension:realm store success storage pocket_dimension:temp enter_success byte 1 at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id),type: 1}},distance=0..] run tp @s ~4 ~2 ~4
$execute in pocket_dimension:realm store success storage pocket_dimension:temp enter_success byte 1 at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id),type: 2}},distance=0..] run tp @s ~8 ~6 ~8

# message
execute in pocket_dimension:realm if data storage pocket_dimension:temp {enter_success:0b} run title @s actionbar {text:"Room isn't available or can't be entered!",color:"yellow"}

#tag @s add pocket_dimension.entered