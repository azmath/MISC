''Fulllist.txt (format)
''Email,Name,LineManagerMail

''phishing awareness emails
import smtplib
import os
import csv
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication

def send_iam_report():
    dir_path = "C:\\Phish-awareness-program\\attach"
    os.chdir(dir_path)
    files = ["Phishing Awareness 2022.docx", "IS awareness policy.pdf"]
    emailfrom1 = 'xyz1@asdf.ae'
    emailcc1 ='xyz2@asdf.ae'
    emailcc2 ='xyz3@asdf.ae'
    emailcc3 = 'xyz4@asdf.ae'
    msg = MIMEMultipart()
    msg['From'] = "xyz1@asdf.ae"
    msg['Subject'] = "Phishing Email Awareness"
    mailtext = """
<html>

<head>

</head>

<body lang=EN-US style='tab-interval:.5in;word-wrap:break-word'>

<div class=WordSection1>

<p class=msipheader3c13a4b style='margin:0in'><span style='font-size:10.0pt;
color:black'>Classification: Internal</span><o:p></o:p></p>

<p class=MsoNormal><span style='mso-fareast-font-family:"Times New Roman"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='color:#1F497D'>Dear User,<o:p></o:p></span></p>


<p class=MsoNormal style='margin-left:.5in'><span style='color:#1F497D'>Kindly
be informed that you failed to react adequately to the phishing simulation
exercise email sent on </span>

<b><span style='color:#C00000'>28<sup>th</sup>September, 2022</span></b><span style='color:#C00000'> </span><span
style='color:#1F497D'>with the subject line “</span><b>

<span style='color:#C00000'>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</span></b>
<span
style='color:#1F497D'>” which was conducted as per asdf’s “Information Security
Awareness Policy <b>[attached]</b>”.<o:p></o:p></span></p>


<p class=MsoNormal style='margin-left:.5in'><span style='color:#1F497D'>Please
be advised that falling for Phishing scams renders the bank vulnerable to data
compromise and security breaches which might have critical financial and
reputational impacts.<o:p></o:p></span></p>


<p class=MsoNormal style='margin-left:.5in'><span style='color:#1F497D'>As per
“Information Security Awareness Policy <b>[attached]</b>”, <b><u>External email</u></b>
and <b><u>Internet access</u></b> will be revoked for the users who fail to
recognize these emails and fall for it consecutively 3 times in a row.
Completing Information Security course adequately will be a mandate to re-gain
the access to External email and Internet access.<o:p></o:p></span></p>


<p class=MsoNormal style='margin-left:.5in'><span style='color:#1F497D'>Please
be reminded not to open attachments, click on links or even respond to emails
from unknown or suspicious sources and don’t forget to report suspicious emails
using the “Report Phishing” button, showcase# tip10. Kindly contact ITSD if
“Report Phishing” button is missing in your Outlook menu Items.<o:p></o:p></span></p>


<p class=MsoNormal style='margin-left:.5in'><b><span style='color:#C00000'>Kindly
go through the attached document </span><span style='color:#1F497D'>[Phishing
Awareness 2022.docx] </span><span style='color:#C00000'>to know more about
Phishing and how you can prevent yourself from falling to such attempts.<o:p></o:p></span></b></p>


<p class=MsoNormal style='text-indent:.5in'><b><span style='color:#1F497D'>Thank
you for helping us to keep our customers, staff and asdf network safe from these
cyber threats. Please let us know if you have any questions.</span></b><o:p></o:p></p>


<p class=MsoNormal><span class=GramE><span style='color:#1F497D'>Thanks and regards,</span></p>

<p class=MsoNormal><span style='color:#1F497D'>Team Technology Risk.<o:p></o:p></span></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

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
        s = smtplib.SMTP("smtprelay.asdf.dev:2500")
    except socket.error as e:
        print ("cannot connect to SMTP server")
        #s.set_debuglevel(True)
    s.starttls()
    dir_path2 = "C:\\Phish-awareness-program"
    os.chdir(dir_path2)
    with open('C:\\Phish-awareness-program\\fulllist.txt', newline='') as csvfile:
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
            
            emailslist = emailfrom1 +","+ emailcc1 +","+ emailcc2 + "," +emailcc3 + "," + id1 + "," + id2
            msg["To"] = id1
            msg["Cc"] = id2 +"," + emailcc1 + ","+emailcc2 +", " + emailcc3
            print (msg["To"])
            print ("CC to ----")
            print (msg["Cc"])
            li = list(emailslist.split(","))
            s.sendmail('xyz1@asdf.ae', li, msg.as_string())
            print ("email send.......)")
            print ("--------------------")

    s.close()
    print("Done......")
if __name__ == "__main__":
    send_iam_report()
