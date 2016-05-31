# Windows-Time-Sync
That annoying bug when you Dual boot, Linux and Windows. This script Using the 'Auto-Hotkey' Software will enable you to fix that in a giffy
###################NOTE#########################
This Process once set up, Only requires you to run an .exe to execute the script by double clicking it.
I am not Personally responsible for Any modification of said executable file by 3rd-parties, which results in a compromise of your system.
I am not forcing you to use my file. If you don't trust me don't use my programs.
###################NOTE#########################

Steps: 
1. You will need cmdtime3.exe either from my repo or you can download from any Windows servers (just google 'cmdtime3').
2. Next You will need my exe file 'Time-Executable.exe'
3. Make sure both these executable files are placed in the same folder.
4. Now run 'Time-Executable.exe' with Administrator priviledes.
5. You should have the correct time in a minute.
6. Note this program only works for Error in dual booting, IT WILL NOT FIX YOUR DATE DUE TO BIOS BATTERY PROBLEMS.
7. If you are not keen in using my .exe file you can download the .ahk script along with 'Auto-Hotkey' Software (Google it). And you may modify it as you please.
8. If your keen on applying this further, you can latch this program at windows startup with Task Scheduler, So that it runs on each startup. Remember to provide it Administrator Priviledges as it accesses your %temp% folder in windows. Or else it will loop due to low priviledges and you will need to exit it manually in the taskbar.
