execute on leasher if entity @s[tag=!pocket_dimension.leasher] run return fail

$execute in pocket_dimension:realm at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id),type: 1}},distance=0..] run tp @s ~4 ~2 ~4
$execute in pocket_dimension:realm at @n[tag=pocket_dimension.anchor,nbt={data:{id:$(pocket_id),type: 2}},distance=0..] run tp @s ~8 ~6 ~8
