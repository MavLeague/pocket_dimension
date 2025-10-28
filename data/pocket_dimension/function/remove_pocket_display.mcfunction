# remove display entity and its passengers
execute as @n[type=interaction,tag=pocket_dimension.display,distance=..1] on passengers run kill @s
kill @n[type=interaction,tag=pocket_dimension.display,distance=..1]
kill @s[type=area_effect_cloud,tag=pocket_dimension.leave_marker]

#say Removed display entity