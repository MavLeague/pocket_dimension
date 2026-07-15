$execute in pocket_dimension:realm as @e[tag=pocket_dimension.anchor,nbt={data:{id: $(pocket_id)}}] run data modify storage pocket_dimension:temp compass.read_id.Pos0 set from entity @s data.Pos0
$execute in pocket_dimension:realm as @e[tag=pocket_dimension.anchor,nbt={data:{id: $(pocket_id)}}] run data modify storage pocket_dimension:temp compass.read_id.Pos1 set from entity @s data.Pos1
$execute in pocket_dimension:realm as @e[tag=pocket_dimension.anchor,nbt={data:{id: $(pocket_id)}}] run data modify storage pocket_dimension:temp compass.read_id.Pos2 set from entity @s data.Pos2
$execute in pocket_dimension:realm as @e[tag=pocket_dimension.anchor,nbt={data:{id: $(pocket_id)}}] run data modify storage pocket_dimension:temp compass.read_id.Dimension set from entity @s data.Dimension

function pocket_dimension:assign_compass_follow with storage pocket_dimension:temp compass.read_id
