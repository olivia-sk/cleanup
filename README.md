# cleanup

A few Windows scripts for freeing up disk space. Run them in order, each one as administrator (right-click and choose "Run as administrator").

1. **Delete Temporary Files.bat** empties your temp folder and the Windows temp folder.
2. **Delete Log Files.bat** deletes `.log` files older than 7 days from `C:\Windows\Logs` and the temp folders.
3. **Delete WU Cached Files.bat** stops the Windows Update services, clears downloaded update files and starts the services again; your update history is kept.
4. **Disk Clean-Up.lnk** opens the built-in Windows Disk Cleanup tool.

Files that are in use by running programs are skipped.
