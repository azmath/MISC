echo. >> audit-log-csv2email.txt
echo %Date% %Time% >> audit-log-csv2email.txt
echo. >> audit-log-csv2email.txt
"C:\Python37\python.exe" "c:\Tracker-Schedule\sendoverduemail_withattchments.py" >> audit-log-csv2email.txt

timeout 10
echo. >> audit-log-csv2email-itsec-open.txt
echo %Date% %Time% >> audit-log-csv2email-itsec-open.txt
echo. >> audit-log-csv2email-itsec-open.txt
"C:\Python37\python.exe" "c:\Tracker-Schedule\sendoverduemail_withattchments_ITSEC_open.py" >> audit-log-csv2email-itsec-open.txt

timeout 10
echo. >> audit-log-csv2email-itsec-overdue.txt
echo %Date% %Time% >> audit-log-csv2email-itsec-overdue.txt
echo. >> audit-log-csv2email-itsec-overdue.txt
"C:\Python37\python.exe" "c:\Tracker-Schedule\sendoverduemail_withattchments_ITSEC_overdue.py" >> audit-log-csv2email-itsec-overdue.txt
