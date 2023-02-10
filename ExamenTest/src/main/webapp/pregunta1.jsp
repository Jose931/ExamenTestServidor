<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="Clases.Pregunta,Clases.CreaMapas,Clases.Examen , Scriptlets.*"
	import="java.util.ArrayList"%>
<!DOCTYPE html>
<%
HttpSession miSesion = request.getSession(true);

ArrayList<Pregunta> preguntas = (ArrayList<Pregunta>) miSesion.getAttribute("preguntas");

int contador = 0;
int size = 0;

for (int i = 0; i < preguntas.get(0).getRespuestas().size(); i++) {
	if (preguntas.get(0).getRespuestas().get(i).isMarcada() == true) {
		size++;
	}
}
int[] seleccionados = new int[size];

for (int i = 0; i < preguntas.get(0).getRespuestas().size(); i++) {
	if (preguntas.get(0).getRespuestas().get(i).isMarcada() == true) {
		seleccionados[contador] = i;
		contador++;
	}
}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Examen: Pregunta 1</title>
<link rel="stylesheet" href="styles/preguntas.css">
</head>
<body>
	<div class="card" id="numPregunta">
		<h2>1ª PREGUNTA</h2>
	</div>
	<div class="card" id="arriba">
		<p>
			<b> <%
 					out.print(preguntas.get(0).getEnunciado());
				 %>
			</b>
		</p>
	</div>


	<form action="Navegacion" method="post">
		<div class="card" id="respuestas">
			<%=Scriptlets.arrayCheckBox("elecciones1", CreaMapas.hazMapa(preguntas, 0), seleccionados)%>
		</div>
		<input type="hidden" name="pagina" value="1">
		<div class="botones1">
			<input type="submit" value="Siguiente" name="navegar">
		</div>
	</form>

	<div>
		<p>
			<%
			String salida = (String) miSesion.getAttribute("salida");
			if (salida == null || salida.equals("")) {
				salida = "";
				out.print(salida);
			} else {
				out.print(salida);
			}
			%>
		</p>
	</div>

</body>
</html>



