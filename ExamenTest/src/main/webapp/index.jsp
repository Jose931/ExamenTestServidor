<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inicio Examen</title>
<link rel="stylesheet" href="styles/inicio.css">
</head>
<body>
    <div class="container">
        <div class="card" >
            <p id="centrar">Bienvenido a tu examen de tipo test</p>
        </div>
        <div class="card">
            <p>Este examen constara de 3 preguntas de tipo test con cuatro
                respuestas en cada pregunta. Las preguntas pueden tener mas de una
                respuesta posible hasta el punto de que puedan ser todas las
                respuestas válidas. La puntuación se calculara a partir de la
                cantidad de respuestas validas en la totalidad del examen. Por
                ejemplo, si un examen tiene 9 respuestas válidas, la nota del examen
                se calculara sobre 9. Al finalizar el examen se mostrara la nota
                equivalente sobre 10.
            </p>
        </div>
        <div class="card" >
            <p id="centrar">¡MUCHA SUERTE!</p>
        </div>
    
        <form action="RecuperaExamen" method="post">
            <input type="submit" value="¿Emepzamos?" name=empezar>
        </form>
    
    </div>
</body>

</html>