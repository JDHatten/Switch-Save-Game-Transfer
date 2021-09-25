::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Switch Save Game Transfer Script                                           ::
::     For Ryujinx and Yuzu Switch Emulators                                  ::
::         by JDHatten                                                        ::
::             Version 1.0                                                    ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                            ::
:: This script will allow you to easily transfer your game save files between ::
:: Ryujinx and Yuzu Switch emulators. Just run the script, select the game,   ::
:: and then select which emulator to copy from (Ryujinx to Yuzu or Yuzu to    ::
:: Ryujinx).                                                                  ::
::                                                                            ::
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

:: Yuzu Save File Directory
set yuzu_save_file_directory=%APPDATA%\yuzu\nand\user\save\0000000000000000\{your yuzu user id}


:: Array Of Game Save Directory Paths (Games / Array Length = 14)
:: Indexes of game saves you wish to transfers, if it's not here it won't show in menu.
:: Also if you wish to transfer all game save files at once, only those indexed here will transfer.
set switch_save_directories.indexes=0 1 2 3 4 5 6 7 8 9 10 11 12 13
:: Astral Chain
set switch_save_directories[0].name=Astral Chain
set switch_save_directories[0].ryujinx=%ryujinx_save_file_directory%\0000000000000009\0
set switch_save_directories[0].yuzu=%yuzu_save_file_directory%\01007300020FA000
:: Bayonetta
set switch_save_directories[1].name=Bayonetta
set switch_save_directories[1].ryujinx=%ryujinx_save_file_directory%\000000000000000a\0
set switch_save_directories[1].yuzu=%yuzu_save_file_directory%\010076F0049A2000
:: Bayonetta 2
set switch_save_directories[2].name=Bayonetta 2
set switch_save_directories[2].ryujinx=%ryujinx_save_file_directory%\000000000000000b\0
set switch_save_directories[2].yuzu=%yuzu_save_file_directory%\01007960049A0000
:: Donkey Kong Country: Tropical Freeze
set switch_save_directories[3].name=Donkey Kong Country: Tropical Freeze
set switch_save_directories[3].ryujinx=%ryujinx_save_file_directory%\0000000000000007\0
set switch_save_directories[3].yuzu=%yuzu_save_file_directory%\0100C1F0051B6000
:: Final Fantasy Crystal Chronicles Remastered Edition
set switch_save_directories[4].name=Final Fantasy Crystal Chronicles Remastered Edition
set switch_save_directories[4].ryujinx=%ryujinx_save_file_directory%\000000000000000c\0
set switch_save_directories[4].yuzu=%yuzu_save_file_directory%\0100CE4010AAC000
:: Luigi's Mansion 3
set switch_save_directories[5].name=Luigi's Mansion 3
set switch_save_directories[5].ryujinx=%ryujinx_save_file_directory%\000000000000000d\0
set switch_save_directories[5].yuzu=%yuzu_save_file_directory%\0100DCA0064A6000
:: Mario + Rabbids Kingdom Battle
set switch_save_directories[6].name=Mario + Rabbids Kingdom Battle
set switch_save_directories[6].ryujinx=%ryujinx_save_file_directory%\000000000000000e\0
set switch_save_directories[6].yuzu=%yuzu_save_file_directory%\0100E46003042000
:: Mario Kart 8 Deluxe
set switch_save_directories[7].name=Mario Kart 8 Deluxe
set switch_save_directories[7].ryujinx=%ryujinx_save_file_directory%\000000000000000f\0
set switch_save_directories[7].yuzu=%yuzu_save_file_directory%\0100152000022000
:: Splatoon 2
set switch_save_directories[8].name=Splatoon 2
set switch_save_directories[8].ryujinx=%ryujinx_save_file_directory%\0000000000000011\0
set switch_save_directories[8].yuzu=%yuzu_save_file_directory%\01003BC0000A0000
:: Super Mario 3D World + Bowser's Fury
set switch_save_directories[9].name=Super Mario 3D World + Bowser's Fury
set switch_save_directories[9].ryujinx=%ryujinx_save_file_directory%\0000000000000012\0
set switch_save_directories[9].yuzu=%yuzu_save_file_directory%\010028600EBDA000
:: Super Mario Odyssey
set switch_save_directories[10].name=Super Mario Odyssey
set switch_save_directories[10].ryujinx=%ryujinx_save_file_directory%\0000000000000002\0
set switch_save_directories[10].yuzu=%yuzu_save_file_directory%\0100000000010000
:: The Legend of Zelda: Breath of the Wild
set switch_save_directories[11].name=The Legend of Zelda: Breath of the Wild
set switch_save_directories[11].ryujinx=%ryujinx_save_file_directory%\0000000000000001\0
set switch_save_directories[11].yuzu=%yuzu_save_file_directory%\01007EF00011E000
:: The Legend of Zelda: Link's Awakening
set switch_save_directories[12].name=The Legend of Zelda: Link's Awakening
set switch_save_directories[12].ryujinx=%ryujinx_save_file_directory%\0000000000000006\0
set switch_save_directories[12].yuzu=%yuzu_save_file_directory%\01006BB00C6F0000
:: Xenoblade Chronicles: Definitive Edition
set switch_save_directories[13].name=Xenoblade Chronicles: Definitive Edition
set switch_save_directories[13].ryujinx=%ryujinx_save_file_directory%\0000000000000008\0
set switch_save_directories[13].yuzu=%yuzu_save_file_directory%\0100FF500E34A000


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  No need to edit below this line                                           ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


set transfer_from.indexes=1 2
set transfer_from[1]=Ryujinx to Yuzu
set transfer_from[2]=Yuzu to Ryujinx

call echo/
call echo  Game Save Transfer Script by Grahf Azura (v1.0)
call echo  Used to transfer save files between Ryujinx and Yuzu Switch Emulators.
call echo/

call :Start
:: Menu Loop
:Start
    call echo ================================================================
    for %%i in (%switch_save_directories.indexes%) do (
        call echo   %%i. !switch_save_directories[%%i].name!
    )
    call echo ================================================================
    set /p game="--> Which game save files do you wish to transfer? Enter # "
    call echo/
    
    call echo ================================================================
    for %%i in (%transfer_from.indexes%) do (
        call echo   %%i. !transfer_from[%%i]!
    )
    call echo ================================================================
    set /p emu="--> From which emulator do you want to transfer to? Enter # "
    call echo/
    
    call echo     You chose to transfer [!switch_save_directories[%game%].name!] save game files [from !transfer_from[%emu%]!].
    set /p confirm="--> Is this correct? [y/n]"
    call echo/
    
    if "!confirm!"=="y" (
        call :TransferSaveFilesFrom "!game!", "!emu!"
    ) else (
    if "!confirm!"=="Y" (
        call :TransferSaveFilesFrom "!game!", "!emu!"
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
        set copy_folder=!switch_save_directories[%~1].yuzu!
        set paste_folder=!switch_save_directories[%~1].ryujinx!
    )
    call :CreateBackupOf "!paste_folder!"
    robocopy /E "!copy_folder!" "!paste_folder!"
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
    )
    exit /b 0


:: %1 Folder To Backup
:CreateBackupOf
    if %create_backup_before_overwriting%==True (
        robocopy /E "%~1" "%~1%backup_extention%"
        call echo/
    )
    exit /b 0
