## interaction click detection
# store pocket id
execute on passengers as @s[type=marker] store result storage pocket_dimension:temp highjack.pocket_id int 1 run data get entity @s data.pocket_id

# prove full health
execute on target store result score #max_health pocket_dimension.data run attribute @s max_health get 1
execute on target store result score #health pocket_dimension.data run data get entity @s Health 1

# enter pocket
execute on target if score #max_health pocket_dimension.data = #health pocket_dimension.data \
    at @s unless dimension pocket_dimension:realm \
    run function pocket_dimension:highjack/enter_pocket with storage pocket_dimension:temp highjack
#

# enter pocket creative
execute on target if entity @s[gamemode=creative] \
    at @s unless dimension pocket_dimension:realm \
    run function pocket_dimension:highjack/enter_pocket with storage pocket_dimension:temp highjack
#

# debug
execute unless score #max_health pocket_dimension.data = #health pocket_dimension.data unless entity @s[gamemode=creative] run title @s actionbar {"text":"You require full Health!","color":"yellow"}

# reset interaction
data modify entity @s interaction set value {}