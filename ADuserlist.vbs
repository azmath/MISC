Option Explicit

Dim adoCommand, adoConnection, strBase, strFilter, strAttributes
Dim objRootDSE, strDNSDomain, strQuery, adoRecordset, strName, strMail, strphone, strdistinguishedName, strdistinguishedName1

' Setup ADO objects.
Set adoCommand = CreateObject("ADODB.Command")
Set adoConnection = CreateObject("ADODB.Connection")
adoConnection.Provider = "ADsDSOObject"
adoConnection.Open "Active Directory Provider"
Set adoCommand.ActiveConnection = adoConnection

' Search entire Active Directory forest.
Set objRootDSE = GetObject("GC://RootDSE")
strDNSDomain = objRootDSE.Get("rootDomainNamingContext")
strBase = "<GC://" & strDNSDomain & ">"

' Filter on user objects.
strFilter = "(&(objectCategory=person)(objectClass=user))"

' Comma delimited list of attribute values to retrieve.
strAttributes = "sAMAccountName,mail,telephoneNumber,distinguishedName"

' Construct the LDAP syntax query.
strQuery = strBase & ";" & strFilter & ";" & strAttributes & ";subtree"
adoCommand.CommandText = strQuery
adoCommand.Properties("Page Size") = 100
adoCommand.Properties("Timeout") = 30
adoCommand.Properties("Cache Results") = False

' Run the query.
Set adoRecordset = adoCommand.Execute

' Enumerate the resulting recordset.
Do Until adoRecordset.EOF
  ' Retrieve values and display.
  strName = adoRecordset.Fields("sAMAccountName").Value
  strMail = adoRecordset.Fields("mail").value
  strPhone = adoRecordset.Fields("telephoneNumber").value
  strdistinguishedName = adoRecordset.Fields("distinguishedName").value
  strdistinguishedName1=Replace(strdistinguishedName, ",", "#")
  Wscript.Echo strName & ";" & strMail & ";" & strPhone & ";" & strdistinguishedName1
  ' Move to the next record in the recordset.
  adoRecordset.MoveNext
Loop

' Clean up.
adoRecordset.Close
adoConnection.Close
 
