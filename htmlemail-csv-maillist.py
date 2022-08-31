import smtplib
import os
import csv
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication

def send_iam_report():
    dir_path = "C:\\Phish-awareness-program\\attach"
    os.chdir(dir_path)
    files = ["Phishing Awareness 2022.docx", "RM-TR-ISMS-POL- Information security awareness policy.pdf"]
    emailfrom1 = 'IT@cvvvd.ae'
    emailcc1 ='ma.nr@cvvvd.ae'
    emailcc2 ='riii@cvvvd.ae'
    msg = MIMEMultipart()
    msg['From'] = "IT@cvvvd.ae"
    msg['Subject'] = "Phishing Email Awareness"
    mailtext = """
<html>

<head>

</head>

<div>
<p>Kindly cccccccccccccccccccc:p></p>

</div>

</body>

</html>

    
"""
    body = MIMEText(mailtext, 'html', 'utf-8')  
    msg.attach(body)  # add message body (text or html)
    #maillist = emailtolist + ccto
    for f in files:  # add files to the message
        file_path = os.path.join(dir_path, f)
        attachment = MIMEApplication(open(file_path, "rb").read(), _subtype="txt")
        attachment.add_header('Content-Disposition','attachment', filename=f)
        msg.attach(attachment)
    try:
        s = smtplib.SMTP("smrelay.cxxxxd.com:25")
    except socket.error as e:
        print ("cannot connect to SMTP server")
        #s.set_debuglevel(True)
    s.starttls()
    dir_path2 = "C:\\Phh-awess-proam"
    os.chdir(dir_path2)
    with open('C:\\Phh-awess-proam\\fulllist.txt', newline='') as csvfile:
        data =csv.DictReader(csvfile)
        for row in data:
            id1 = ''
            id2 = ''
            emailslist = ''
            li = ''
            del msg["To"]
            del msg["Cc"]
            id1 = row['Email']
            id2 = row['LineManagerMail']
            print ("Sending email to:")
            
            emailslist = emailfrom1 +","+ emailcc1 +","+ emailcc2 + "," + id1 + "," + id2
            msg["To"] = id1
            msg["Cc"] = id2 +"," + emailcc1 + ","+emailcc2
            print (msg["To"])
            print ("CC to ----")
            print (msg["Cc"])
            li = list(emailslist.split(","))
            s.sendmail('ITC@cxxxxd.ae', li, msg.as_string())
            print ("email send.......)")
            print ("--------------------")

    s.close()
    print("Done......")
if __name__ == "__main__":
    send_iam_report()


Fulllist.txt
Email,Username,LineManagerMail
ve.r@cxd.ae,Vensh R [Extal],shuaa.alshehhi@cxx.ae
muad.al@cbd.ae,Muhab Alm,mer.alhmi@ccc.ae
