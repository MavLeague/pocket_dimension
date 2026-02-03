data modify storage pocket_dimension:temp register_exit.location.UUID set from storage pocket_dimension:temp register_exit.UUID
data modify storage pocket_dimension:temp register_exit.location.Pos0 set from storage pocket_dimension:temp register_exit.data.Pos0
data modify storage pocket_dimension:temp register_exit.location.Pos1 set from storage pocket_dimension:temp register_exit.data.Pos1
data modify storage pocket_dimension:temp register_exit.location.Pos2 set from storage pocket_dimension:temp register_exit.data.Pos2
data modify storage pocket_dimension:temp register_exit.location.Dimension set from storage pocket_dimension:temp register_exit.data.Dimension
data modify storage pocket_dimension:temp register_exit.location.Rotation0 set from storage pocket_dimension:temp register_exit.data.Rotation0

$execute if data storage pocket_dimension:exit_register list[{UUID:$(UUID)}] run return run data modify storage pocket_dimension:exit_register list[{UUID:$(UUID)}] set from storage pocket_dimension:temp register_exit.location
data modify storage pocket_dimension:exit_register list append from storage pocket_dimension:temp register_exit.location