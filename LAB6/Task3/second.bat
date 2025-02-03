sc stop Dnscache
TIMEOUT /t 5
sc query state= all | findstr "SERVICE_NAME" > newService.txt
sc start Dnscache
Pause