#!/usr/bin/python

# Title: Temperature Python Script
# Description:  This script will email the system admin if the temperature
#    exceeds alert amount. ex. alert = 75.0 degrees fahrenhite
# Creation Date:  12-30-2011
# Creator: Troy Powell


import sys    # Load library module
import smtplib    #Needed for smtp protocal
from email.mime.text import MIMEText    #Needed for Message text formating

# Temperature Alert Level
alert = 75.0    #Temperature Alert Max Threshold

#Load files into variables
fb = open('/home/tpowell/tempbody.txt', 'rb')    #Open message text and load to fb
f = open('/var/1-wire/10.1EE2B1000800/temperature', 'r')    #Open temperature file and assign to f
temp = float(f.readline())    #Read temperature file and convert to float

#Email Variables
sender = 'happy@enthought.com'    #From email address
admin = 'tpowell@enthought.com'     #To  email Address
smtpServer = 'mail.enthought.com'    #SMTP Server name
subject = "Server Room Temperatire Exceeds Setpoint at %.2f F !" % temp
body = 'Server Room Temperature:  %.2f F  -  Alert:  %.2f F' % (temp, alert)

#Prepare Message
msg = MIMEText(body + '\n' + fb.read())    #Include Body and read from file for message body
msg['Subject'] = subject  #Get message subject for variable
msg['From'] = sender    #Get sender address from variable
msg['To'] = admin    #Get reciever address form variable

#Check Temp and Send Alert    
if temp >= alert:    #If temperature is greater than alert
    print 'Server room temperature is %.2f and rising.' % temp #Print current Temp
    #Send the email
    server = smtplib.SMTP(smtpServer)    #start smtp server
    server.sendmail(sender, admin, msg.as_string())    #sendmail(from, to, message)
    server.quit()    #Close server

