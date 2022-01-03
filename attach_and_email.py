import smtplib
import os
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication

def send_iam_report():
    dir_path = "C:\IAM\iamfiles"
    onlyfiles = [os.path.join(dir_path, f) for f in os.listdir(dir_path) if 
    os.path.isfile(os.path.join(dir_path, f))]
    if onlyfiles:
    
    #Send emails list
        emailtolist = ['xxxx.xxxx@xxxx.ae']
    #Display on msg
        ccto = ['IdentityAndAccessManagement@cbd.ae']
        msg = MIMEMultipart()
        msg['To'] = ", ".join(emailtolist)
        msg["Cc"] = ", ".join(ccto)
        msg['From'] = "Rinu Jacob"
        msg['Subject'] = "xxxx application daily Audit Logs"
        mailtext = """
Dear xxxxxxx,
    
Please find attached the reviewed xxxxx application audit logs.
    
Cheers,
    
"""
        #msg = MIMEText(mailtext)
        maillist = emailtolist + ccto
        msg.attach(MIMEText(mailtext,'plain'))  # add message body (text or html)
    
        for f in onlyfiles:  # add files to the message
            file_path = os.path.join(dir_path, f)
            attachment = MIMEApplication(open(file_path, "rb").read(), _subtype="txt")
            attachment.add_header('Content-Disposition','attachment', filename=f)
            msg.attach(attachment)
        try:
            s = smtplib.SMTP("smtprelay.cbd.dev:25")
        except socket.error as e:
            print ("cannot connect to SMTP server")
        #s.set_debuglevel(True)
        s.starttls()

        #s = smtplib.SMTP("smtprxxxelay.xxxxx.dev:2225")
        #s.connect(host=SMTP_SERVER)
        #s.sendmail(msg['From'], msg['To'], msg.as_string())
        s.sendmail('rinu@cbd.ae', maillist, msg.as_string())
        print ("done!")
        s.close()

if __name__ == "__main__":
    send_iam_report()
