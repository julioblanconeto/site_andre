<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Contato</title>
        
</head>
<body>

<!--#include file="../captcha/recaptcha.asp"-->

<%
Function ValidaEmail(email) 


    Dim objRegEx, retorno 

    Set objRegEx = CreateObject("VBScript.RegExp") 

    With objRegEx 
          .Pattern = "^\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$" 
          .IgnoreCase = True 
    End With 

    retorno = objRegEx.Test(email) 

    Set objRegEx = Nothing 

    ValidaEmail = retorno 

End Function

'=== início captcha ===
if newCaptcha = False then
    'verificou a resposta do captcha    
    
    if server_response <> "" then
        'resposta incorreta
        %>
            <script type="text/javascript">alert('Captcha incorreto!')</script>
        <%
        response.End()
            
    end if
end if
'=== fim captcha ===


strNome = left(request.Form("nome"),20)
strSobrenome = left(request.Form("sobrenome"),20)

strDDI = left(trim(request.Form("regiao")),3)
strDDI = replace(strDDI,"+","")

if not isnumeric(strDDI) and len(strDDI)>0 then
    %>
        <script type="text/javascript">alert('No campo DDI utilize somente numérico ')</script>
    <%
    response.End()
end if
strDDI = "+"&strDDI 

strDDD = left(trim(request.Form("local")),3)
if not isnumeric(strDDD) and len(strDDD)>0 then
    %>
        <script type="text/javascript">alert('No campo DDD utilize somente numérico ')</script>
    <%
    response.End()
end if

strfone = left(trim(request.Form("telefone")),10)
if not isnumeric(strfone) and len(strfone)>0  then
    %>
        <script type="text/javascript">alert('No campo Telefone utilize somente numérico ')</script>
    <%
    response.End()
end if


stremail = left(trim(request.Form("email")),30)
if  len(stremail) = 0 then
    %>
        <script type="text/javascript"> alert('O campo e-mail obrigatório ')</script>
    <%
    response.End()

else

   if ValidaEmail(stremail) = false then
        %>
          <script type="text/javascript">  alert('O campo e-mail está inválido')</script>
        <%  
        response.End()  
   end if     

end if 

strmensagem = left(request.Form("mensagem"),1000)

if len(trim(strmensagem)) = 0 then
    %>
        <script type="text/javascript"> alert('O campo Mensagem é obrigatório')</script>
    <%
    response.End()
    
end if

        strSmtpServer = "mail14.redehost.com.br"
        strServerPort = 587 '25, 465 or 587
        strUserName   = "forzamm"
        strPassWord   = "Null4h&M4i4"
        strTimeout    = 60

		'cria o objeto para o envio de e-mail 
		Set objCDOSYSMail = Server.CreateObject("CDO.Message") 

		'cria o objeto para configuração do SMTP 
		Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration") 

		'SMTP 
		objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = strSmtpServer
		
		'porta do SMTP 
		objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = strServerPort 
		
		'porta do CDO 
		objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 

        'com usuario e senha
        'autenticate
		objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 

        'usuário
		objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername") = strUserName

        'senha
		objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword") = strPassWord
		
		'timeout 
		objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = strTimeout 

		
		objCDOSYSCon.Fields.update 
		
		'atualiza a configuração do CDOSYS para o envio do e-mail 
		Set objCDOSYSMail.Configuration = objCDOSYSCon 


        'e-mail do remetente 
		objCDOSYSMail.From = "contato@forzamm.com.br"
		
		'e-mail do destinatário 
		objCDOSYSMail.To =  "contato@forzamm.com.br"
		
		'copia de e-mail 
		objCDOSYSMail.Cc = "andre@forzamm.com.br"
		
		'copia de e-mail oculta
		'objCDOSYSMail.Bcc = "emailqualquer"
		
		'assunto da mensagem 
		objCDOSYSMail.Subject =  "Contato Forza Motors "& strNome &" "& strSobrenome
		
        HTML = "<!DOCTYPE HTML PUBLIC ""-//IETF//DTD HTML//EN"">" 
		HTML = HTML & "<html>"
		HTML = HTML & "<head>"
		HTML = HTML & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"" />"
        HTML = HTML & "</head>"
		
		HTML = HTML & "<body>"

        HTML = HTML & "Nome: "& strNome &" <br>"
        HTML = HTML & "Sobrenome: "& strSobrenome &"<br>"
        HTML = HTML & "Telefone: "& strDDI &" "& strDDD &" "& strfone &"<br>"
        HTML = HTML & "E-mail: "& stremail &"<br><br>"
        HTML = HTML & "Mensagem:<br>"& replace(strmensagem,vbcrlf,"<br>")   

        HTML = HTML & "</body>"
        HTML = HTML & "</html>"

		'conteúdo da mensagem 
		objCDOSYSMail.HTMLBody = HTML 
		'para envio da mensagem no formato html altere o TextBody para HtmlBody 
        
        'envia o e-mail 
		objCDOSYSMail.Send 
	
		'destrói os objetos 
		Set objCDOSYSMail = Nothing 
		Set objCDOSYSCon = Nothing 

         %>
        <script type="text/javascript">
            alert('O e-mail foi enviado com sucesso em breve responderemos seu contato');
        </script>

</body>
</html>