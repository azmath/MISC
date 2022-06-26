#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      azm
#
# Created:     08/05/2020
# Copyright:   (c) azm 2020
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import os
import csv
import datetime
from datetime import date
from decimal import Decimal
import pymysql
pymysql.install_as_MySQLdb()

import MySQLdb

def main():
    path = "C:\\overdue\\"
    x = datetime.datetime.now()
    date_ = str(x.day) + str(x.month)+ str(x.year)
    path += date_
    try:
        os.mkdir(path)
    except OSError:
        print ("Directory Creation Failed: %s" %path)
    else:
        print ("Successfully created the directory: %s " %path)

    db = MySQLdb.connect(user="root",passwd="",host="localhost",db="test")
    cursor = db.cursor()
    cursor2 = db.cursor()
    cursor.execute("SELECT distinct(app_support_contact) FROM `issues` where status = 'open' and NOT target_date='0000-00-00' AND target_date <=curdate()")
    data=cursor.fetchall()
    for row in data :
        print (row[0])
        name = row[0]
       # query = "Select * from issues where app_support_contact ='email1234@domain.com'"
        query = "Select * from issues where app_support_contact = '" + name +"'" + "and status ='open' AND target_date <=curdate() "
        cursor.execute(query)
        issues=cursor.fetchall()
        column_names = [i[0] for i in cursor.description]
        fileloc = path + "\\" + name + ".csv"
        c = open(fileloc,"w")
        fp = csv.writer(c, lineterminator = '\n' )
        fp.writerow(column_names)
##        fp.writerow(issues)
        for row in issues:
            fp.writerow(row)
        c.close()
        print("Total rows are:  ", len(issues))
        for row1 in issues:
            #print (row1)
            pass
    db.close()
    pass

if __name__ == '__main__':
    main()
