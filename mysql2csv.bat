echo. >> audit_log-mysql2csv.txt
echo %Date% %Time% >> audit_log-mysql2csv.txt
echo. >> audit_log-mysql2csv.txt
"C:\Python37\python.exe" "c:\Tracker-Schedule\MYSQL2csv_dynamic_overdue_v2.py" >> audit_log-mysql2csv.txt

REM timeout 10
echo. >> audit_log-mysql2csv-itsec-open.txt
echo %Date% %Time% >> audit_log-mysql2csv-itsec-open.txt
"C:\Python37\python.exe" "c:\Tracker-Schedule\MYSQL2csv_dynamic_overdue_v2_ITSEC_open.py" >> audit_log-mysql2csv-itsec-open.txt


REM timeout 10
echo. >> audit_log-mysql2csv-itsec-overdue.txt
echo %Date% %Time% >> audit_log-mysql2csv-itsec-overdue.txt
"C:\Python37\python.exe" "c:\Tracker-Schedule\MYSQL2csv_dynamic_overdue_v2_ITSEC_Overdue.py" >> audit_log-mysql2csv-itsec-overdue.txt
