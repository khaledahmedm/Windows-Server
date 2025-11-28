#for examples nslookup corp.pri
nslookup corp.pri

#the domain should be resolved with the IP address of a domain controller
ping corp.pri

#On a domain controller, you can do the following tests:
#dcdiag /s:"DomainController"
#(Specifies the name of the server to run the command against.)
dcdiag /s:corpdc0101

#/e Tests all the servers in the enterprise, /v Verbose
dcdiag /e /v

#Performs the /DnsBasic tests, and also checks if the address (A), canonical name (CNAME) and well-known service (SRV) resource records are registered. In addition, creates an inventory report based on the test results
dcdiag /DnsRecordRegistration

#to check the sysvol health
dcdiag /test:sysvolcheck

#How to check if domain controllers are in sync with each other (use the command prompt)?
#Step 1 - Check the replication health

Repadmin /replsummary

#Step 2 - Check the inbound replication requests that are queued.

Repadmin /Queue

#Step 3 - Check the replication status

Repadmin /Showrepl

#Step 4 - Synchronize replication between replication partners

Repadmin /syncall

#Step 5 - Force the KCC to recalculate the topology

Repadmin /KCC

#Step 6 - Force replication

Repadmin /replicate