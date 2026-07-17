execute unless score %chunk_crawler pocket_dimension.id matches 0.. run scoreboard players set %chunk_crawler pocket_dimension.id 1
execute if score %chunk_crawler pocket_dimension.id > %step_id pocket_dimension.id run scoreboard players reset %chunk_crawler pocket_dimension.id

execute if score %chunk_crawler pocket_dimension.id <= %step_id pocket_dimension.id store result storage pocket_dimension:temp chunk_crawler.offset int 128 run scoreboard players get %chunk_crawler pocket_dimension.id
execute if score %chunk_crawler pocket_dimension.id <= %step_id pocket_dimension.id run function pocket_dimension:force_pocket_chunkload_follow with storage pocket_dimension:temp chunk_crawler
