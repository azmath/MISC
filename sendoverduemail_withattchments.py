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

emailfrom = "a87b632432-204f2a@inbox.mailtrap.io"
emailto = "a87b632432-204f2a@inbox.mailtrap.io"
username = "0a963eb932e850"
password = "c9ed7c0e764404"
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
    emailto = "a87b632432-204f2a@inbox.mailtrap.io"
    msg = MIMEMultipart()
    msg["From"] = emailfrom
    emailto += ";" + email
    msg["To"] = emailto
    msg["Subject"] = "Overdue reminder"
    msg.preamble = "Overdue reminder"
    fileToSend = filename1
    ctype, encoding = mimetypes.guess_type(fileToSend)
    if ctype is None or encoding is not None:
        ctype = "application/octet-stream"

    maintype, subtype = ctype.split("/", 1)

    if maintype == "text":
        fp = open(fileToSend)
        # Note: we should handle calculating the charset
        attachment = MIMEText(fp.read(), _subtype=subtype)
        fp.close()
    elif maintype == "image":
        fp = open(fileToSend, "rb")
        attachment = MIMEImage(fp.read(), _subtype=subtype)
        fp.close()
    elif maintype == "audio":
        fp = open(fileToSend, "rb")
        attachment = MIMEAudio(fp.read(), _subtype=subtype)
        fp.close()
    else:
        fp = open(fileToSend, "rb")
        attachment = MIMEBase(maintype, subtype)
        attachment.set_payload(fp.read())
        fp.close()
        encoders.encode_base64(attachment)
    attachment.add_header("Content-Disposition", "attachment", filename=fileToSend)
    msg.attach(attachment)

    server = smtplib.SMTP("smtp.mailtrap.io:2525")
    server.starttls()
    server.login(username,password)
    server.sendmail(emailfrom, emailto, msg.as_string())
    server.quit()