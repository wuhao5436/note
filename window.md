###  windows 下杀端口

1. netstat -aon|findstr "8010"

2. tasklist|findstr "8784"

3. taskkill /f /t /im javaw.exe
