::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Switch Save Game Transfer Script                                           ::
::     For Ryujinx and Yuzu Switch Emulators                                  ::
::         by Grahf Azura                                                     ::
::             Version 1.0                                                    ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                            ::
:: This script will allow you to easily transfer your game save files between ::
:: Ryujinx and Yuzu Switch emulators. Just run the script, select the game,   ::
:: and then select which emulator to copy from (Ryujinx to Yuzu or Yuzu to    ::
:: Ryujinx).                                                                  ::
::                                                                            ::
:: How To Setup:                                                              ::
:: 1. Replace the text between the {brackets} and remove the {brackets}.      ::
::    For example, {xx} could be 04, 0b, or 13.                               ::
:: 2. Add new games by copying one already added and update the title and     ::
::    Ryujinx/Yuzu save directory folders.                                    ::
:: 3. Run the script and and make your game save transfer selections.         ::
::                                                                            ::
:: Notes:                                                                     ::
:: Only one backup will be made per game save transfer and running the script ::
:: 2+ times with the same game, in the same direction will also overwrite the ::
:: backup. So please make proper backups before using this script. I won't be ::
:: held responsible for you accidently overwriting your newer game save files ::
:: with older game save files.                                                ::
::                                                                            ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


MODE CON COLS=128 LINES=1000
@ECHO OFF
setlocal EnableExtensions EnableDelayedExpansion


:: Backup game saves before overwriting
set create_backup_before_overwriting=True

:: When backing up game save folders they will be renamed with this at the end.
set backup_extention=__backup

:: Ryujinx Save File Directory
set ryujinx_save_file_directory=%APPDATA%\Ryujinx\bis\user\save

:: Yuzu Save File Directory (Get ID from the folder and not the app as it's reversed)
set yuzu_save_file_directory=%APPDATA%\yuzu\nand\user\save\0000000000000000\{your yuzu user id}


:: Array Of Game Save Directory Paths
set /a i=1
set switch_save_directories[0].title=Transfer All Game Saves [Backup Your Save Files First]
:: Animal Crossing: New Horizons
set switch_save_directories[!i!].title=Animal Crossing: New Horizons
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\01006F8002326000
call :AddAboveGame
:: Astral Chain
set switch_save_directories[!i!].title=Astral Chain
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\01007300020FA000
call :AddAboveGame
:: Bayonetta
set switch_save_directories[!i!].title=Bayonetta
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\010076F0049A2000
call :AddAboveGame
:: Bayonetta 2
set switch_save_directories[!i!].title=Bayonetta 2
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\01007960049A0000
call :AddAboveGame
:: Bravely Default II
set switch_save_directories[!i!].title=Bravely Default II
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\010056F00C7B4000
call :AddAboveGame
:: Dragon Quest XI S: Echoes of an Elusive Age -Definitive Edition-
set switch_save_directories[!i!].title=Dragon Quest XI S: Echoes of an Elusive Age -Definitive Edition-
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\01006C300E9F0000
call :AddAboveGame
:: Donkey Kong Country: Tropical Freeze
set switch_save_directories[!i!].title=Donkey Kong Country: Tropical Freeze
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100C1F0051B6000
call :AddAboveGame
:: Final Fantasy Crystal Chronicles Remastered Edition
set switch_save_directories[!i!].title=Final Fantasy Crystal Chronicles Remastered Edition
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100CE4010AAC000
call :AddAboveGame
:: Fire Emblem: Three Houses
set switch_save_directories[!i!].title=Fire Emblem: Three Houses
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\010055D009F78000
call :AddAboveGame
:: Fire Emblem Engage
set switch_save_directories[!i!].title=Fire Emblem Engage
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100A6301214E000
call :AddAboveGame
:: Ghosts n Goblins Resurrection
set switch_save_directories[!i!].title=Ghosts n Goblins Resurrection
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100D6200F2BA000
call :AddAboveGame
:: Hyrule Warriors: Definitive Edition
set switch_save_directories[!i!].title=Hyrule Warriors: Definitive Edition
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100AE00096EA000
call :AddAboveGame
:: Hyrule Warriors: Age of Calamity
set switch_save_directories[!i!].title=Hyrule Warriors: Age of Calamity
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\01002B00111A2000
call :AddAboveGame
:: Kirby and the Forgotten Land
set switch_save_directories[!i!].title=Kirby and the Forgotten Land
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\01004D300C5AE000
call :AddAboveGame
:: Luigi's Mansion 3
set switch_save_directories[!i!].title=Luigi's Mansion 3
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100DCA0064A6000
call :AddAboveGame
:: Mario + Rabbids Kingdom Battle (Japan)
set switch_save_directories[!i!].title=Mario + Rabbids Kingdom Battle (Japan)
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100E46003042000
call :AddAboveGame
:: Mario + Rabbids Kingdom Battle
set switch_save_directories[!i!].title=Mario + Rabbids Kingdom Battle
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\010067300059A000
call :AddAboveGame
:: Mario Kart 8 Deluxe
set switch_save_directories[!i!].title=Mario Kart 8 Deluxe
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100152000022000
call :AddAboveGame
:: Metroid Dread
set switch_save_directories[!i!].title=Metroid Dread
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\010093801237C000
call :AddAboveGame
:: Pikmin 3 Deluxe
set switch_save_directories[!i!].title=Pikmin 3 Deluxe
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100F4C009322000
call :AddAboveGame
:: Pokemon Scarlet
set switch_save_directories[!i!].title=Pokemon Scarlet
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100A3D008C5C000
call :AddAboveGame
:: Splatoon 2
set switch_save_directories[!i!].title=Splatoon 2
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\01003BC0000A0000
call :AddAboveGame
:: Super Mario 3D All-Stars
set switch_save_directories[!i!].title=Super Mario 3D All-Stars
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\010049900F546000
call :AddAboveGame
:: Super Mario 3D World + Bowser's Fury
set switch_save_directories[!i!].title=Super Mario 3D World + Bowser's Fury
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\010028600EBDA000
call :AddAboveGame
:: Super Mario Odyssey
set switch_save_directories[!i!].title=Super Mario Odyssey
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100000000010000
call :AddAboveGame
:: Super Mario Party
set switch_save_directories[!i!].title=Super Mario Party
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\010036B0034E4000
call :AddAboveGame
:: Super Smash Bros. Ultimate
set switch_save_directories[!i!].title=Super Smash Bros. Ultimate
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\01006A800016E000
call :AddAboveGame
:: The Legend of Zelda: Breath of the Wild
set switch_save_directories[!i!].title=The Legend of Zelda: Breath of the Wild
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\01007EF00011E000
call :AddAboveGame
:: The Legend of Zelda: Link's Awakening
set switch_save_directories[!i!].title=The Legend of Zelda: Link's Awakening
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\01006BB00C6F0000
call :AddAboveGame
:: The Legend of Zelda: Skyward Sword HD
set switch_save_directories[!i!].title=The Legend of Zelda: Skyward Sword HD
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\01002DA013484000
call :AddAboveGame
:: The Legend of Zelda: Tears of the Kingdom
set switch_save_directories[!i!].title=The Legend of Zelda: Tears of the Kingdom
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100F2C0115B6000
call :AddAboveGame
:: Triangle Strategy
set switch_save_directories[!i!].title=Triangle Strategy
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100CC80140F8000
call :AddAboveGame
:: Xenoblade Chronicles: Definitive Edition
set switch_save_directories[!i!].title=Xenoblade Chronicles: Definitive Edition
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100FF500E34A000
call :AddAboveGame
:: Xenoblade Chronicles 2
set switch_save_directories[!i!].title=Xenoblade Chronicles 2
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100E95004038000
call :AddAboveGame
:: Xenoblade Chronicles 2: Torna - The Golden Country
set switch_save_directories[!i!].title=Xenoblade Chronicles 2: Torna - The Golden Country
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\0100C9F009F7A000
call :AddAboveGame
:: Xenoblade Chronicles 3
set switch_save_directories[!i!].title=Xenoblade Chronicles 3
set switch_save_directories[!i!].ryujinx=%ryujinx_save_file_directory%\00000000000000{xx}\0
set switch_save_directories[!i!].yuzu=%yuzu_save_file_directory%\010074F013262000
call :AddAboveGame


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  No need to edit below this line                                           ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


set transfer_from.indexes=1 2
set transfer_from[1]=Ryujinx to Yuzu
set transfer_from[2]=Yuzu to Ryujinx
call echo/
call echo  Game Save Transfer Script
call echo  Used to transfer save files between Ryujinx and Yuzu Switch Emulators.
call echo/

call :Start
:: Menu Loop
:Start
    call echo ================================================================
    for %%i in (0 %switch_save_directories.indexes%) do (
        call echo   [!check%%i!] %%i. !switch_save_directories[%%i].title!
        if %%i==0 (
            call echo ================================================================
        )
    )
    call echo ================================================================
    set /p game="--> Which game save files do you wish to transfer? Enter # "
    call echo/
    
    call echo ================================================================
    for %%i in (%transfer_from.indexes%) do (
        call echo     %%i. !transfer_from[%%i]!
    )
    call echo ================================================================
    set /p emu="--> From which emulator do you want to transfer to? Enter # "
    call echo/
    
    if "!game!"=="0" (
        call echo     You chose to transfer [All] save game files [from !transfer_from[%emu%]!].
        call echo     Are you absolutely sure because you can easily overwrite files you might not intend to?
        set /p confirm="--> Have you backed up all your game saves and ready to proceed? [y/n]
        set transfer_all=True
    ) else (
        call echo     You chose to transfer [!switch_save_directories[%game%].title!] save game files [from !transfer_from[%emu%]!].
        set /p confirm="--> Is this correct? [y/n]"
        set transfer_all=False
        call echo/
    )
    
    if "!confirm!"=="y" (
        if "!transfer_all!"=="True" (
            call :TransferAllSaveFilesFrom "!emu!"
        ) else (
            call :TransferSaveFilesFrom "!game!", "!emu!"
        )
    ) else (
    if "!confirm!"=="Y" (
        if "!transfer_all!"=="True" (
            call :TransferAllSaveFilesFrom "!emu!"
        ) else (
            call :TransferSaveFilesFrom "!game!", "!emu!"
        )
    ) else (
        call :Start
    ))
    
    call echo\
    call echo\
    set /p loop="All Done, Press [Enter] To Display The Game Save Menu Again -or- [Enter Q] To Quit: "
    call echo\
    
    if "!loop!"=="q" (
        call echo Closing...
        EXIT
    ) else (
    if "!loop!"=="Q" (
        call echo Closing...
        EXIT
    ) else (
        call :Start
    ))
    exit /b 0


:: %1 Game Index #
:: %2 Transfer From Index #
::    1. Ryujinx to Yuzu
::    2. Yuzu to Ryujinx
:TransferSaveFilesFrom
    if %~2 == 1 (
        set copy_folder=!switch_save_directories[%~1].ryujinx!
        set paste_folder=!switch_save_directories[%~1].yuzu!
    ) else (
    if %~2 == 2 (
        set copy_folder=!switch_save_directories[%~1].yuzu!
        set paste_folder=!switch_save_directories[%~1].ryujinx!
    ) else (
        call echo\
        call echo  Error: Invalid Entry
        exit /b 1
    ))
    call :CreateBackupOf "!paste_folder!"
    robocopy /E "!copy_folder!" "!paste_folder!"
    call :TransferSaveCheck "%~1"
    exit /b 0


:: %1 Transfer From Index #
::    1. Ryujinx to Yuzu
::    2. Yuzu to Ryujinx
:TransferAllSaveFilesFrom
    for %%i in (%switch_save_directories.indexes%) do (
        if %~1 == 1 (
            set copy_folder=!switch_save_directories[%%i].ryujinx!
            set paste_folder=!switch_save_directories[%%i].yuzu!
        ) else (
            set copy_folder=!switch_save_directories[%%i].yuzu!
            set paste_folder=!switch_save_directories[%%i].ryujinx!
        )
        call :CreateBackupOf "!paste_folder!"
        robocopy /E "!copy_folder!" "!paste_folder!"
        call :TransferSaveCheck "%%i"
    )
    call :TransferSaveCheck "0"
    exit /b 0


:: %1 Index
:TransferSaveCheck
    set check%~1=x
    exit /b 0


:: %1 Folder To Backup
:CreateBackupOf
    if %create_backup_before_overwriting%==True (
        robocopy /E "%~1" "%~1%backup_extention%"
        call echo/
    )
    exit /b 0


:AddAboveGame
    set "switch_save_directories.indexes=!switch_save_directories.indexes!!i! "
    set /a i=i+1
    exit /b 0

