<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="Clases.Pregunta,Clases.CreaMapas,Clases.Examen , Scriptlets.*"
	import="java.util.ArrayList"%>
<%
HttpSession miSesion = request.getSession(true);

ArrayList<Pregunta> preguntas = (ArrayList<Pregunta>) miSesion.getAttribute("preguntas");
int contador = 0;
int size = 0;

for (int i = 0; i < preguntas.get(1).getRespuestas().size(); i++) {
	if (preguntas.get(1).getRespuestas().get(i).isMarcada() == true) {
		size++;
	}
}
int[] seleccionados = new int[size];

for (int i = 0; i < preguntas.get(1).getRespuestas().size(); i++) {
	if (preguntas.get(1).getRespuestas().get(i).isMarcada() == true) {
		seleccionados[contador] = i;
		contador++;
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Examen: Pregunta 2</title>
<link rel="stylesheet" href="styles/preguntas.css">
</head>
<body>
	<div  class="card" id="numPregunta">
		<h2>2ª PREGUNTA</h2>
	</div>
	<div class="card" id="arriba">
		<p>
			<b> <%
 					out.print(preguntas.get(1).getEnunciado());
 				%>
			</b>
		</p>
	</div>
	<form action="Navegacion" method="post">
		<div class="card" id="respuestas">
			<%=Scriptlets.arrayCheckBox("elecciones2", CreaMapas.hazMapa(preguntas, 1), seleccionados)%>
		</div>
		<input type="hidden" name="pagina" value="2">
		<div class="botones">
			<input type="submit" value="Anterior" name="navegar"> 
			<input type="submit" value="Siguiente" name="navegar">
		</div>
	</form>
	<div>
		<p>
			<%
			String salida = (String) miSesion.getAttribute("salida2");
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