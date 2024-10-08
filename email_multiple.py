import os
import glob
import datetime
from datetime import date
from decimal import Decimal
import smtplib, socket
import mimetypes
from email.mime.multipart import MIMEMultipart
from email import encoders
from email.message import Message
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email.headerregistry import Address
from email.utils import make_msgid

emailfrom = 'donotreply@domain1.ae'
emailto = ['email1@domain1.ae', 'email2@domain.ae']
ccto = ['email3@domain.ae','email4@domain.ae']
username = ""
password = ""
fileToSend = ""
path = "C:\\IT_Security_communications\\Open_Findings\\"
x = datetime.datetime.now()
date_ = str(x.day) + str(x.month)+ str(x.year)
print ("------------------------------")
print ('Timestamp : ' + str(x))
path1 = path + date_ + "\\"
os.chdir(path1)
path2 = path1 + "All_Open_Findings_List.csv"
#attachmentslist = glob.glob(path2)
print ('******************')
#print ('Attachment name: ' + str(attachmentname))
#filename1 = attachmentname.replace(path1,"")

msg = MIMEMultipart()
msg["From"] = emailfrom
    #emailto += ", " + email
msg["To"] = ", ".join(emailto)
msg["Cc"] = ", ".join(ccto)
msg["Subject"] = "List of open Findings"
#msg.preamble = "List of open Findings"
text = """

Test email

This is an automated email from {Team}, please find the attached list of open security findings 

The attachment in this email provides the list of open findings that are being tracked by Technology risk department, 
The email has been sent for:
        1. Vulnerability Assessment, 
        2. Penetration testing, 
        3. Application change assessments, 
        4. Live assessments and risk assessments
        
**please open the attachment with Excel for clear view
For any queries or clarifications contact Technology risk email7@domain1.ae or email5@doamin1.ae"
"""
part1 = MIMEText(text, 'plain')
msg.attach(part1)
fileToSend = path2
ctype, encoding = mimetypes.guess_type(fileToSend)
if ctype is None or encoding is not None:
    ctype = "application/octet-stream"
maintype, subtype = ctype.split("/", 1)
fp = open(fileToSend)
    # Note: we should handle calculating the charset
attachment = MIMEText(fp.read(), _subtype=subtype)
fp.close()

attachment.add_header("Content-Disposition", "attachment", filename=fileToSend)
msg.attach(attachment)
try:
    server = smtplib.SMTP("smtprelay.abc.dev:25")
except socket.error as e:
    print ("cannot connect to SMTP server")
server.set_debuglevel(True)
server.starttls()
    #server.login(username,password)
    #server.sendmail(emailfrom, emailto , msg.as_string())
server.sendmail(emailfrom, emailto, msg.as_string())
print ('Mail sent ...')
server.quit()
    
