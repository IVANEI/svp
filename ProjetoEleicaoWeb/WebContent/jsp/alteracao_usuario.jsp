<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="fbv.com.servlets.ServletPerfilUsuario"%>
<%@page import="fbv.com.negocio.PerfilUsuario"%><%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Altera��o Usu�rio</title>
</head>
<%
	try{
		//Pegando par�metros do request
		String cpfUsuario = "";
		String nomeUsuario = "";
		String loginUsuario = "";
		String senhaUsuario = "";
		Integer perfilUsuario = null;
		
		ArrayList<PerfilUsuario> perfil = null;
		//Pegando par�metros do request
		perfil = (ArrayList<PerfilUsuario>) request.getAttribute(ServletPerfilUsuario.ID_REQ_OBJETO_PERFIL_USUARIO);

		Usuario usuario =(Usuario) request.getAttribute(ServletPerfilUsuario.ID_REQ_OBJETO_USUARIO);
		cpfUsuario = usuario.getCpf();
		nomeUsuario = usuario.getNome();
		loginUsuario = usuario.getLogin();
		senhaUsuario = usuario.getSenha();
		perfilUsuario = usuario.getPerfilUsuario().getId();
		
		
%>
<script type="text/javascript">

function eventoProcessarAlteracao(){
	document.forms.form_principal.<%=ServletUsuario.ID_REQ_EVENTO%>.value = "<%=ServletUsuario.ID_REQ_EVENTO_PROCESSAR_ALTERACAO%>";
	document.forms.form_principal.submit();
}
function VerificaCPF () {
	if (!vercpf(document.forms.form_principal.cpf.value)) {
	  
		errors="1";
		if (errors) 
		alert('CPF N�O V�LIDO');
			document.forms.form_principal.cpf.value = "";
			document.retorno = (errors == '');
	}
}
function vercpf (cpf) {
	if (cpf.length != 11 || cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" || cpf == "33333333333" || cpf == "44444444444" || cpf == "55555555555" || cpf == "66666666666" || cpf == "77777777777" || cpf == "88888888888" || cpf == "99999999999")
		return false;
		add = 0;
		for (i=0; i < 9; i ++)
			add += parseInt(cpf.charAt(i)) * (10 - i);
			rev = 11 - (add % 11);
			if (rev == 10 || rev == 11)
				rev = 0;
			if (rev != parseInt(cpf.charAt(9)))
				return false;
				add = 0;
			for (i = 0; i < 10; i ++)
				add += parseInt(cpf.charAt(i)) * (11 - i);
				rev = 11 - (add % 11);
			if (rev == 10 || rev == 11)
				rev = 0;
			if (rev != parseInt(cpf.charAt(10)))
				return false;
				document.retorno = (errors == '');
				return true;
}

</script>
<body>
	<form action="/ProjetoEleicaoWeb/ServletUsuario" method="post" id="form_principal">
	<table width="100%">
		<tr>
			<td>
				<input type="hidden" id="<%=ServletUsuario.ID_REQ_EVENTO%>" name="<%=ServletUsuario.ID_REQ_EVENTO%>" value="">
				Altera��o de Usu�rio
			</td>
		</tr>
		<tr>
			<td width="25%">
				CPF do Usu�rio:
			</td>
			<td>
				<input type="text" id="<%=ServletUsuario.ID_REQ_CPF_USUARIO%>" name="<%=ServletUsuario.ID_REQ_CPF_USUARIO%>" value="<%=cpfUsuario%>" onchange="VerificaCPF();" readonly="readonly" ></input>
			</td>
		</tr>
		<tr>
			<td width="25%">
				Nome do Usu�rio:
			</td>
			<td>
				<input type="text" id="<%=ServletUsuario.ID_REQ_NOME_USUARIO%>" name="<%=ServletUsuario.ID_REQ_NOME_USUARIO%>" value="<%=nomeUsuario%>" ></input>
			</td>
		</tr>
		<tr>
			<td width="25%">
				Login do Usu�rio:
			</td>
			<td>
				<input type="text" id="<%=ServletUsuario.ID_REQ_LOGIN_USUARIO%>" name="<%=ServletUsuario.ID_REQ_LOGIN_USUARIO%>" value="<%=loginUsuario%>" ></input>
			</td>
		</tr>
		<tr>
			<td width="25%">
				Senha do Usu�rio:
			</td>
			<td>
				<input type="password" id="<%=ServletUsuario.ID_REQ_SENHA_USUARIO%>" name="<%=ServletUsuario.ID_REQ_SENHA_USUARIO%>" value="<%=senhaUsuario%>" ></input>
			</td>
		</tr>
		<tr>
			<td width="25%">
				Perfil do Usu�rio:
			</td>
			<td> 
				<select name="<%=ServletUsuario.ID_REQ_ID_PERFIL_USUARIO%>">  	
					<% 
						Iterator iterator = null;
						iterator = perfil.iterator(); 
					
						while(iterator.hasNext()){
							Object perfilUsuarioGenerico = iterator.next();
							PerfilUsuario perfilUsu = (PerfilUsuario) perfilUsuarioGenerico;
							
							String descPerfilUsuario = perfilUsu.getDescricao();
							Integer id = perfilUsu.getId();
							
							if(perfilUsuario.equals(id)){
					%>
								<option id="<%=ServletUsuario.ID_REQ_ID_PERFIL_USUARIO%>"  value="<%= id %>" selected="selected"><%= descPerfilUsuario%></option> <% 
							} else {					
						%>
								<option id="<%=ServletUsuario.ID_REQ_ID_PERFIL_USUARIO%>"  value="<%= id %>"><%= descPerfilUsuario%></option> 
						<%
							}
						}
						%>                                      
           		</select> 
			</td>
	</table>
	<table width="100%">
		<tr>
			<td align="center"><input type="button" id="botaoVoltar" name="botaoVoltar" onclick="history.back()" value="Voltar"></td>
			<td align="center"><input type="button" id="botaoConfirmar" name="botaoConfirmar" onclick="eventoProcessarAlteracao()" value="Confirmar"> </td>
		</tr>
	
	</table>
	</form>
<% }catch(Exception e){
	e.printStackTrace();
}
%>
</body>

<%@page import="fbv.com.servlets.ServletUsuario"%>
<%@page import="fbv.com.negocio.Usuario"%>
</html>