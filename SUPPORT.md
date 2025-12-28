# Q & A
## (1) I can't enter a pocket!
If this message is stated something went wrong:
![action bar title](media/support/cant-entered-title.png)

### (1.1) What to do?
This issue can happen when the custom dimension has not been loaded successfully.
1. Try restart your server.
2. You might need to activate custom dimensions somewhere. This could be caused by other mods, plugins or loaders. I cannot influence that behavior with my pack unfortunately.

To proof if thats the problem, try this command:

    /execute in pocket_dimension:realm if dimension pocket_dimension:realm

## (2) How to remove the pocket display?
In case the custom dimension `pocket_dimension:realm` cannot be loaded you won't be able to break the pocket. This happens due to a failing verification process when the pack tries to generate the item. This behaviour is not intended as the datapack is not designed to handle such errors. If it happens anyways you can use this command to remove them:

     /function pocket_dimension:remove_pocket_display

> [!warning]
> Do not use `/kill @n[...]` as this could potentionally damage or break the pocket dimension!

## (3) How to reassign or manage rooms?
In some cases, if you are a server admin and want full control over the pockets, or you want to restore a pocket for a new player with a new player name or similar, you can use the following steps for managing that.

### (3.1) How does it work?
Every player gets a unique ID assigned when creating the first pocket. This ID links directly to the room in the custom dimension `pocket_dimension:realm`. When activating a newly crafted item, the item gets linked with the current ID of the player. This doesn't change when passing the item over to somebody. It is baked in and you need to get a new item if you want to change the room.

### (3.2) Who has which ID?
To obtain the ID of a player you can use either one of these commands:

    /scoreboard players get @s pocket_dimension.id

    /scoreboard players get <Player> pocket_dimension.id

> [!important]
> Replace `<Player>` with the player name.

You can also visualize all at once if you run:

    /scoreboard objectives setdisplay sidebar pocket_dimension.id

> [!note]
> You can ignore all the UUIDs listed as well in this scoreboard. Only Player names are relevant for you.

### (3.3) How to reassign IDs?
You might have guessed that you can simply modify the scoreboard depending on the room you desire. After changing the ID all new items you activate will then link to the new room. All existing items will stay as they are.

    /scoreboard players set @s pocket_dimension.id <ID>

    /scoreboard players set <Player> pocket_dimension.id <ID>

> [!important]
> Replace `<Player>` with the player name and `<ID>` with the desired ID.

> [!caution]
> Do NOT increase the ID past the score from `%step_id` as this would break the pack! Use [3.2](#32-who-has-which-id) to obtain its ID. Do not change its value! <br>
> If you want to generate a new ID with a new room, please follow the steps in [3.4](#34-how-to-get-a-new-room).

### (3.4) How to get a new room?
To obtain a new room you simply reset the ID from the player. When activating a new item, the new ID will be assigned and the room will be generated.


    /scoreboard players reset @s pocket_dimension.id

    /scoreboard players reset <Player> pocket_dimension.id

> [!important]
> Replace `<Player>` with the player name.

### (3.5) How to obtain a pocket dimension?
There are two ways of obtaining one, crafting and with a command.

#### Crafting Recipe
<img src="https://cdn.modrinth.com/data/cached_images/1c8320a0327998475ac7c7ed8f60960c60487397.png" alt="crafting recipe" width="50%">

#### Command

    /loot give @s loot pocket_dimension:pocket

This command can be helpful when removing a broken pocket [(2)](#2-how-to-remove-the-pocket-display) and restoring the item to the player.

#
<p align="center">
    If you still have questions, feel free to open an <a href="https://github.com/MavLeague/pocket_dimension/issues">Issue</a> and help me to improve my pack!
</p>

<p align="center">
  <a href="https://github.com/MavLeague/pocket_dimension/blob/main/LICENSE.md">
    <img src="https://img.shields.io/badge/License-CC%20BY--NC%204.0-blue?style=for-the-badge">
  </a>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <a href="https://modrinth.com/datapack/pocket_dimension">
    <img src="https://img.shields.io/modrinth/game-versions/ycIKn71C?style=for-the-badge&logo=modrinth&logoColor=%2300AF5C&label=Pocket%20Dimensions">
  </a>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <a href="https://buymeacoffee.com/mavleague">
    <img src="https://github.com/MavLeague/pocket_dimension/blob/main/media/bmc-button.png?raw=true" width="120px">
  </a>
</p>
