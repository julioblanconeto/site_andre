// JavaScript Document

function valida_email()
{
	var obj = eval("document.forms[0].email");
	var txt = obj.value;

	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

	if (txt.length != 0) {

	    if (!re.test(txt)) {
	        document.getElementById("msgErro").innerHTML = ('O Campo E-mail está incorreto!');
	        document.getElementById("email").style.backgroundColor = "#FFAAAA";

	        document.getElementById("botao_salvar").disabled = true;
	    }
	    else {
	        salvar_dados()
	    }

	}

}

function limpa_msn_erro()
{
	document.getElementById("msgErro").innerHTML='';
	document.getElementById("email").value='';
	document.getElementById("email").style.backgroundColor="#FFFFFF";
}

function limpar_dados()
{

	document.getElementById("nome").value='';
	document.getElementById("sobrenome").value='';
	document.getElementById("ddi").value='+55';
	document.getElementById("ddd").value = '';
	document.getElementById("telefone").value = '';
	document.getElementById("email").value = '';
	document.getElementById("mensagem").value = '';
	document.getElementById("qtd").innerHTML = '1000';

	if (document.getElementById("recaptcha_response_field")) {
	    document.getElementById("recaptcha_response_field").value = '';
	}

	//document.getElementById("botao_salvar").disabled=true;
}

function salvar_dados()//criar função de salvar homepage
{
	var obj = eval("document.forms[0].mensagem");
	var txt_mensagem = obj.value;
	
	var obj = eval("document.forms[0].email");
	var txt_email = obj.value;


	if ((txt_mensagem.length != 0) && (txt_email.length != 0))
	{
	    document.getElementById("botao_salvar").disabled = false;
	    return true;	
	}
	else
	{
	    document.getElementById("botao_salvar").disabled = true;
	    return false;
	}
}


function Contar(Campo)
{
	var TamMax = 1000;
		
    document.getElementById("qtd").innerHTML = TamMax - Campo.value.length
	
	if (Campo.value.length >= TamMax) {
		document.getElementById("qtd").innerHTML = '0';
		Campo.value = Campo.value.substring(0, TamMax);

		alert('Atenção, você atingiu o limite máximo de caracteres!');
	}
		
}





