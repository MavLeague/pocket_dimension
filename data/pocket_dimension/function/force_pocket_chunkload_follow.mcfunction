$execute in pocket_dimension:realm positioned $(offset) 0 0 run forceload add ~ ~
tellraw @a {translate:"pocket_dimension.message.loaded_chunks",with:[{score:{name:"%chunk_crawler",objective:"pocket_dimension.id"}}]}
scoreboard players add %chunk_crawler pocket_dimension.id 1
function pocket_dimension:force_pocket_chunkload