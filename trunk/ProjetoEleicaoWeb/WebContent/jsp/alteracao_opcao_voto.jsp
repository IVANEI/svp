<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="fbv.com.servlets.ServletOpcaoVoto"%>
<%@page import="fbv.com.negocio.OpcaoVoto"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./estilo/estilo.css">
<title>Altera��o de Op��o de Voto</title>
</head>
<%
try {
	//Pegando par�metros do request
	OpcaoVoto opcaoVoto =(OpcaoVoto) request.getAttribute(ServletOpcaoVoto.ID_REQ_OBJETO_OPCAO_VOTO);
		
%>
<script type="text/javascript">

function eventoProcessarAlteracao(){
	if (document.forms.form_principal.<%=ServletOpcaoVoto.ID_REQ_DESCRICAO_OPCAO_VOTO%>.value == "") {
		alert("Campo Obrigat�rio - Descri��o da Op��o de Voto!");
		return false;
	}

	if (document.forms.form_principal.<%=ServletOpcaoVoto.ID_REQ_CODIGO_ELEICAO%>.value == "") {
		alert("Campo Obrigat�rio - C�digo da Elei��o!");
		return false;
	}
	
	document.forms.form_principal.<%=ServletOpcaoVoto.ID_REQ_EVENTO%>.value = "<%=ServletOpcaoVoto.ID_REQ_EVENTO_PROCESSAR_ALTERACAO%>";
	document.forms.form_principal.submit();
}

</script>

<body>
<form action="/ProjetoEleicaoWeb/ServletOpcaoVoto" method="post" id="form_principal">
	<input type="hidden" id="<%=ServletOpcaoVoto.ID_REQ_EVENTO%>" name="<%=ServletOpcaoVoto.ID_REQ_EVENTO%>" value="">
	<table width="100%">
		<tr>
			<th class="titulopagina">Altera��o de Op��o de Voto</th>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<th class="rotulodado" width="12%">C�digo:</th>
			<td class="valordado"><input type="text" id="<%=ServletOpcaoVoto.ID_REQ_CODIGO_OPCAO_VOTO%>" name="<%=ServletOpcaoVoto.ID_REQ_CODIGO_OPCAO_VOTO%>" class="camporeadonly" value="<%=opcaoVoto.getId()%>" size="8" readonly="readonly" ></td>
		</tr>
		<tr>
			<th class="rotulodado" width="12%">Descri��o:</th>
			<td class="valordado"><input type="text" id="<%=ServletOpcaoVoto.ID_REQ_DESCRICAO_OPCAO_VOTO%>" name="<%=ServletOpcaoVoto.ID_REQ_DESCRICAO_OPCAO_VOTO%>" value="<%=opcaoVoto.getDescricao()%>" size="50" maxlength="45"></td>
		</tr>
		<tr>
			<th class="rotulodado" width="12%">C�digo da Elei��o:</th>
			<td class="valordado"><input type="text" id="<%=ServletOpcaoVoto.ID_REQ_CODIGO_ELEICAO%>" name="<%=ServletOpcaoVoto.ID_REQ_CODIGO_ELEICAO%>" value="<%=opcaoVoto.getIdEleicao()%>" size="8" maxlength="10"></td>
		</tr>
		<tr>
			<th class="rotulodado" width="12%">Foto:</th>
			<td class="valordado">
				<% 
					String pathFoto = "";
				
				    if ((opcaoVoto.getPath_foto() != null) && (!opcaoVoto.getPath_foto().equals("null"))) {
				        pathFoto = opcaoVoto.getPath_foto();
				    }
				%>
				<input type="text" id="<%=ServletOpcaoVoto.ID_REQ_PATH_FOTO%>" name="<%=ServletOpcaoVoto.ID_REQ_PATH_FOTO%>" value="<%=pathFoto%>" size="40" maxlength="45"></input>
			</td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<th class="footer" colspan="2">&nbsp;</th>
		</tr>
		<tr>
			<td class="linhabotao"><input type="button" id="botaoVoltar" name="botaoVoltar" onclick="history.back()" value="Voltar"></td>
			<td class="linhabotao"><input type="button" id="botaoConfirmar" name="botaoConfirmar" onclick="eventoProcessarAlteracao()" value="Confirmar"> </td>
		</tr>
	</table>
</form>
<% 
} catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>