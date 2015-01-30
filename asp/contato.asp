html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Contato</title>
        <link href="../css/contato.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="../js/contatojs.js"></script>
</head>
<body>

    <!--#include file="../captcha/recaptcha.asp"-->
    
    <form action="envia_email.asp" method="post" onsubmit="return salvar_dados();" target="contato_acao">
        <div class="titulo">Fale Conosco</div>
        <div style="clear:both"></div>

		<div class="descricao">Nome:</div><br /> 
        <input id="nome" type="text" name="nome" maxlength="20" autofocus><br />

		<div class="descricao">Sobrenome:</div><br /> 
        <input id="sobrenome" type="text" name="sobrenome" maxlength="20"><br/>

   		<div class="descricao">Telefone:</div><br /> 
        <input id="ddi" class="tel_ddd_ddi" type="tel" name="regiao" value="+55" maxlength="3" ><input id="ddd" class="tel_ddd_ddi" type="tel" name="local" maxlength="3"><input id="telefone" class="telefone" type="tel" name="telefone" maxlength="10"><br />
       
    	<div class="descricao" >E-mail:</div><br />		
        <input  id="email" type="email" onFocus="limpa_msn_erro();" onBlur="valida_email();" name="email" maxlength="30" ><br />    
        <span id="msgErro" class="MsgErro"></span>
        
	<div class="descricao" style="width:240px;">Telefone de Contato (13) 3329-2713</div><br><br>

	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3645.1619217139755!2d-46.28848019999996!3d-23.990058599999983!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce02030481616d%3A0xfd11e4428ce43644!2sAv.+Antonio+Correia%2C+37+-+Vila+Ligya%2C+Guaruj%C3%A1+-+SP%2C+11430-030!5e0!3m2!1spt-BR!2sbr!4v1414521192222" width="250" height="150" frameborder="0" style="border:0; margin-left:10px;"></iframe>

        <aside>
            <div class="div_mensagem">mensagem</div><br />
            <textarea id="mensagem" name="mensagem" onKeyUp="Contar(this)" onblur="salvar_dados();" class="mensagem" rows ="10" cols="70" maxlength="1000"></textarea><br />
            <span style="float:right; color:#FFFFFF" id="qtd">1000</span>
           
            <div style="margin-left:10px;margin-top:10px;">
                <%=recaptcha_challenge_writer()%>        
            </div>

            <div style="clear:both"></div>
            <div style="width:200px;margin-top:10px;">
                <input id="botao_salvar" class="botao" type="submit" value="Enviar" disabled="true">
                <input id="botao_limpar" onClick="limpar_dados()" class="botao" type="button" value="Limpar">
            </div>    
            
        </aside>  
             
	</form>


    <iframe id="contato_acao" name="contato_acao" class="frame_conteudo" src="" width="0" height="0" frameborder="0"></iframe> 

</body>
</html>
