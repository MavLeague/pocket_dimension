advancement revoke @s only pocket_dimension:leave_rift

execute store result storage pocket_dimension:temp inventory_items int 1 run clear @s * 0
execute unless data storage pocket_dimension:temp {inventory_items:0} run return run title @s actionbar {"text":"You cannot leave the rift with items in your inventory!","color":"yellow"}

execute if data entity @s respawn run data modify storage pocket_dimension:temp spawn_location.dimension set from entity @s respawn.dimension
execute if data entity @s respawn run data modify storage pocket_dimension:temp spawn_location.posX set from entity @s respawn.pos[0]
execute if data entity @s respawn run data modify storage pocket_dimension:temp spawn_location.posY set from entity @s respawn.pos[1]
execute if data entity @s respawn run data modify storage pocket_dimension:temp spawn_location.posZ set from entity @s respawn.pos[2]
execute if data entity @s respawn run data modify storage pocket_dimension:temp spawn_location.pitch set from entity @s respawn.pitch
execute if data entity @s respawn run data modify storage pocket_dimension:temp spawn_location.yaw set from entity @s respawn.yaw

# set to worldspawn if no respawn location is detected
execute unless data entity @s respawn run data modify storage pocket_dimension:temp spawn_location set from storage pocket_dimension:temp world_spawn

# set to worldspawn for illegal respawn locations
execute if data storage pocket_dimension:temp {spawn_location:{dimension:"pocket_dimension:realm"}} run data modify storage pocket_dimension:temp spawn_location set from storage pocket_dimension:temp world_spawn

function pocket_dimension:leave_rift_follow with storage pocket_dimension:temp spawn_location

execute if entity @p[x=-1024,y=0,z=-1024,dx=16,dy=15,dz=16] run return fail

execute in pocket_dimension:realm run fill -1024 0 -1024 -1008 15 -1008 air
execute in pocket_dimension:realm run kill @e[x=-1024,y=0,z=-1024,dx=16,dy=15,dz=16,type=!player]
execute in pocket_dimension:realm positioned -1024 0 -1024 run forceload remove ~ ~
