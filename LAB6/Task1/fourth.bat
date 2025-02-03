cd C:\LAB6\TASK1\TEST
for %%I in (*) do (
if not "%%~nxI"=="all_files" del "%%~nxI"
)