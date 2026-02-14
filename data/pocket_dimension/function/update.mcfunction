# This Function will be run once after installing an update to ensure up to date data
# if you want to run this function again, run this and reload: /data remove storage pocket_dimension:temp version
tellraw @a {text:"Updating Pocket Dimensions..."}

# set to current version
data modify storage pocket_dimension:temp game_version set value "1.21.11"
data modify storage pocket_dimension:temp version set value "1.3"
