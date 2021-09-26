# Switch Save Game Transfer Script (v1.0)
> For Ryujinx and Yuzu Switch Emulators</br>
> By JDHatten
</br>
This batch script will allow you to easily transfer your game save files between Ryujinx and Yuzu Switch emulators. Just run the script, select the game, and then select which emulator to copy from (Ryujinx to Yuzu or Yuzu to Ryujinx).
</br></br>

### How to use:
</br>
1. First, you must edit some variables in the script. Most importantly the Ryujinx and Yuzu save file directories { ryujinx_save_file_directory } and { yuzu_save_file_directory }.  You should only have to add your Yuzu ID though unless you changed the default root paths. Just right click on any game and “Open Save Data Location”, select current user, and copy the number after the “*\0000000000000000\*”.</br></br>
2. Second, you must update the { switch_save_directories } array with each individual game save directory. While Yuzu uses the game’s ID, Ryujinx does not, so even if your game is already listed, you still have to update the Ryujinx directory path. To easily get this path right click the game in the emulator and select “Open User Save Directory”. If the directory does not exist it will be created now. Copy that path or just remember the number at the end and add it to { switch_save_directories[i].ryujinx }. Once all your games are added don’t forget to update the indexes in the array.</br></br>
3. Third, run the script and make your selections.</br></br>
</br>
Hopefully in the future if Ryujinx organizes save file directories using a game’s ID, we can skip step 2 entirely.
