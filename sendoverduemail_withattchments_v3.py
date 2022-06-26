import os
import glob
import datetime
from datetime import date
from decimal import Decimal
import smtplib
import mimetypes
from email.mime.multipart import MIMEMultipart
from email import encoders
from email.message import Message
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email.headerregistry import Address
from email.utils import make_msgid

emailfrom = "donotreply@domain1.ae"
#emailto = "qwerk@domain1.ae"
ccto = "asdf@domain1.ae"
username = ""
password = ""
fileToSend = ""
path = "C:\\overdue\\"
x = datetime.datetime.now()
date_ = str(x.day) + str(x.month)+ str(x.year)
path1 = path + date_ + "\\"
os.chdir(path1)
path2 = path1 + "*.csv"
attachmentslist = glob.glob(path2)
for attachmentname in attachmentslist:
    print (attachmentname)
    filename1 = attachmentname.replace(path1,"")
    print (filename1)
    email = filename1.replace(".csv","")
    print (email)
    #emailto = "mohammed.shaik@cbd.ae"
    msg = MIMEMultipart()
    msg["From"] = emailfrom
    #emailto += ", " + email
    emailto = email
    msg["To"] = emailto
    msg["Cc"] = ccto
    msg["Subject"] = "Overdue reminder"
    msg.preamble = "Overdue reminder"
    text = "Hi!\nHow are you?\nHere is the link you wanted:\nhttps://www.python.org"
    
    html = """\
<html>
  <head></head>
  <body>
    <p>Hi!<br>
       How are you?<br>
       Here is the <a href="https://www.python.org">link</a> you wanted.
    </p>
  </body>
</html>
"""
    part1 = MIMEText(text, 'plain')
    #part2 = MIMEText(html, 'html')
    msg.attach(part1)
    #msg.attach(part2)
    fileToSend = filename1
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

    server = smtplib.SMTP("smtprelay.domain.dev:25")
    server.set_debuglevel(True)
    server.starttls()
    #server.login(username,password)
    #server.sendmail(emailfrom, emailto , msg.as_string())
    server.send_message(msg)
    server.quit()
