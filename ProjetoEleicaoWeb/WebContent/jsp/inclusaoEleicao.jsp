<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="fbv.com.servlets.ServletEleicao"%>
<%@page import="fbv.com.util.TipoEleicao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fbv.com.negocio.EleicaoEscolhaUnica"%><html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Inclus�o Perfil Usu�rio</title>
	<script src="./js/jquery.js" type="text/javascript" language="javascript"></script>
</head>
<%
	try{
%>
	
	<script type="text/javascript">
	
	function eventoProcessarInclusao(){
	
		var msg = '';

		$('input[obrigatorio]').each(function(){
			if ($(this).val() == ''){
				msg += ' - ' + $(this).attr('title') + '\n';
			}
		});
	
		if (msg != ''){
			alert('Os seguintes campos devem ser preenchidos:\n' + msg);
			return false;
		}
		document.forms.form_principal.<%=ServletEleicao.ID_REQ_EVENTO%>.value = "<%=ServletEleicao.ID_REQ_EVENTO_PROCESSAR_INCLUSAO%>";
		document.forms.form_principal.submit();
	}

	function exibirCampos(tipo){
		if (tipo == '1'){
			$('#trEscolhaUnica').show();
			$('#trPontuacao').hide();
			$('input[pontuacao]').each(function(){
				$(this).removeAttr('obrigatorio');
			});
			$('input[escolhaunica]').each(function(){
				$(this).attr('obrigatorio', '1');
			});
		}
		else{
			$('#trEscolhaUnica').hide();
			$('#trPontuacao').show();
			$('input[escolhaunica]').each(function(){
				$(this).removeAttr('obrigatorio');
			});
			$('input[pontuacao]').each(function(){
				$(this).attr('obrigatorio', '1');
			});
		}
	}
	
	</script>
<body>
	<form action="/ProjetoEleicaoWeb/<%= request.getAttribute(ServletEleicao.ID_REQ_NOME_SERVLET) %>" method="post" id="form_principal">
	<table width="100%">
		<tr>
			<td align="center" colspan="2">
				<input type="hidden" id="<%=ServletEleicao.ID_REQ_EVENTO%>" name="<%=ServletEleicao.ID_REQ_EVENTO%>" value="">
				<b>Incluir Elei��o</b>
			</td>
		</tr>
		<tr>
			<td width="25%">
				Tipo:
			</td>
			<td>
				<select id="<%= ServletEleicao.ID_REQ_TIPO_ELEICAO %>" name="<%= ServletEleicao.ID_REQ_TIPO_ELEICAO %>" obrigatorio="1" onchange="exibirCampos(this.value)">
					<option value="<%= TipoEleicao.ESCOLHA_UNICA.value() %>" <%= request.getParameter(ServletEleicao.ID_REQ_TIPO_ELEICAO).equals(TipoEleicao.ESCOLHA_UNICA.value())? "selected": "" %>>Escolha �nica</option>
					<option value="<%= TipoEleicao.PONTUACAO.value() %>" <%= request.getParameter(ServletEleicao.ID_REQ_TIPO_ELEICAO).equals(TipoEleicao.PONTUACAO.value())? "selected": "" %>>Pontua��o</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="25%">
				Descri��o:
			</td>
			<td>
				<input type="text" id="<%=ServletEleicao.ID_REQ_DESCRICAO_ELEICAO%>" name="<%=ServletEleicao.ID_REQ_DESCRICAO_ELEICAO%>" value="" title="Descri��o" obrigatorio="1"></input>
			</td>
		</tr>
		<tr>
			<td>
				P�blica?
			</td>
			<td>
				<input type="radio" id="<%= ServletEleicao.ID_REQ_IN_PUBLICA_ELEICAO %>_Sim" name="<%= ServletEleicao.ID_REQ_IN_PUBLICA_ELEICAO %>" value="1" title="P�blica" obrigatorio="1">Sim&nbsp;
				<input type="radio" id="<%= ServletEleicao.ID_REQ_IN_PUBLICA_ELEICAO %>_Nao" name="<%= ServletEleicao.ID_REQ_IN_PUBLICA_ELEICAO %>" value="0" title="P�blica" obrigatorio="1">N�o
			</td>
		</tr>
		<tr>
			<td>
				Voto Aberto?
			</td>
			<td>
				<input type="radio" id="<%= ServletEleicao.ID_REQ_IN_VISIBILIDADE_ABERTA_ELEICAO %>_Sim" name="<%= ServletEleicao.ID_REQ_IN_VISIBILIDADE_ABERTA_ELEICAO %>" value="1" title="Voto Aberto" obrigatorio="1">Sim&nbsp;
				<input type="radio" id="<%= ServletEleicao.ID_REQ_IN_VISIBILIDADE_ABERTA_ELEICAO %>_Nao" name="<%= ServletEleicao.ID_REQ_IN_VISIBILIDADE_ABERTA_ELEICAO %>" value="0" title="Voto Aberto" obrigatorio="1">N�o
			</td>
		</tr>
		<tr>
			<td>
				M�ltiplos Votos?
			</td>
			<td>
				<input type="radio" id="<%= ServletEleicao.ID_REQ_IN_VOTO_MULTIPLO_ELEICAO %>_Sim" name="<%= ServletEleicao.ID_REQ_IN_VOTO_MULTIPLO_ELEICAO %>" value="1" title="M�ltiplos Votos" obrigatorio="1">Sim&nbsp;
				<input type="radio" id="<%= ServletEleicao.ID_REQ_IN_VOTO_MULTIPLO_ELEICAO %>_Nao" name="<%= ServletEleicao.ID_REQ_IN_VOTO_MULTIPLO_ELEICAO %>" value="0" title="M�ltiplos Votos" obrigatorio="1">N�o
			</td>
		</tr>
		<tr>
			<td width="25%">
				Data Abertura:
			</td>
			<td>
				<input type="text" id="<%=ServletEleicao.ID_REQ_DATA_INICIO_ELEICAO%>" name="<%=ServletEleicao.ID_REQ_DATA_INICIO_ELEICAO%>" value="" title="Data Abertura"  obrigatorio="1"></input>
			</td>
		</tr>
		<tr>
			<td width="25%">
				Data Encerramento:
			</td>
			<td>
				<input type="text" id="<%=ServletEleicao.ID_REQ_DATA_FIM_ELEICAO%>" name="<%=ServletEleicao.ID_REQ_DATA_FIM_ELEICAO%>" value="" title="Data Encerramento" obrigatorio="1"></input>
			</td>
		</tr>
		<tbody id="trEscolhaUnica">
			<tr>
				<td>
					Elei��o Associada:
				</td>
				<td>
					<select id="<%= ServletEleicao.ID_REQ_CODIGO_ELEICAO_PAI %>" name="<%= ServletEleicao.ID_REQ_CODIGO_ELEICAO_PAI %>">
						<option value="0"></option>
					<%
					@SuppressWarnings("unchecked")
					ArrayList<EleicaoEscolhaUnica> eleicoes = (ArrayList<EleicaoEscolhaUnica>)request.getAttribute(ServletEleicao.ID_REQ_ARRAY_LIST_ELEICAO);
					for(EleicaoEscolhaUnica eleicao : eleicoes){
					%>
						<option value="<%= eleicao.getId() %>"><%= eleicao.getDescricao() %></option>
					<%
					}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					Existe Voto Nulo/Branco?
				</td>
				<td>
					<input type="radio" id="<%= ServletEleicao.ID_REQ_IN_CAMPO_NULO_ELEICAO %>_Sim" name="<%= ServletEleicao.ID_REQ_IN_CAMPO_NULO_ELEICAO %>" value="1" title="Voto Nulo/Branco" obrigatorio="1" escolhaunica="1">Sim&nbsp;
					<input type="radio" id="<%= ServletEleicao.ID_REQ_IN_CAMPO_NULO_ELEICAO %>_Nao" name="<%= ServletEleicao.ID_REQ_IN_CAMPO_NULO_ELEICAO %>" value="0" title="Voto Nulo/Branco" obrigatorio="1" escolhaunica="1">N�o
				</td>
			</tr>
			<tr>
				<td>
					Percentual para Vit�ria:
				</td>
				<td>
					<input type="text" id="<%= ServletEleicao.ID_REQ_PERCENTUAL_VITORIA_ELEICAO %>" name="<%=ServletEleicao.ID_REQ_PERCENTUAL_VITORIA_ELEICAO %>" title="Percentual para Vit�ria" obrigatorio="1" escolhaunica="1">
				</td>
			</tr>
		</tbody>
		<tbody id="trPontuacao" style="display: none">
			<tr>
				<td>
					Pontua��o M�nima:
				</td>
				<td>
					<input type="text" id="<%= ServletEleicao.ID_REQ_PONTUACAO_MINIMA_ELEICAO %>" name="<%=ServletEleicao.ID_REQ_PONTUACAO_MINIMA_ELEICAO %>" title="Pontua��o M�nima" pontuacao="1">
				</td>
			</tr>
			<tr>
				<td>
					Pontua��o M�xima:
				</td>
				<td>
					<input type="text" id="<%= ServletEleicao.ID_REQ_PONTUACAO_MAXIMA_ELEICAO %>" name="<%=ServletEleicao.ID_REQ_PONTUACAO_MAXIMA_ELEICAO %>" title="Pontua��o M�xima" pontuacao="1">
				</td>
			</tr>
			<tr>
				<td>
					Intervalo da Pontua��o:
				</td>
				<td>
					<input type="text" id="<%= ServletEleicao.ID_REQ_INTERVALO_PONTUACAO_ELEICAO %>" name="<%=ServletEleicao.ID_REQ_INTERVALO_PONTUACAO_ELEICAO %>" title="Intervalo da Pontua��o" pontuacao="1">
				</td>
			</tr>
		</tbody>
	</table>
	<table width="100%">
		<tr>
			<td align="center"><input type="button" id="botaoVoltar" name="botaoVoltar" onclick="history.back()" value="Voltar"></td>
			<td align="center"><input type="button" id="botaoConfirmar" name="botaoConfirmar" onclick="eventoProcessarInclusao()" value="Confirmar"> </td>
		</tr>
	
	</table>
	</form>
<% }catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>