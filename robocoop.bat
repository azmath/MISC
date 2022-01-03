@echo off
set "source=C:\IAM\iamfiles"

set "destination=C:\IAM\archive"

robocopy "%source%" "%destination%" /mov

exit /b
