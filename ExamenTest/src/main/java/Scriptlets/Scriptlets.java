package Scriptlets;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import Clases.Pregunta;

public class Scriptlets {
	
	
	
	public static String arrayCheckBox(String nombreControl, Map<Integer, String> arrayRespuestas,
			int[] seleccionados) {
		String salida = "";
		int contador = 0;
		int valoresSeleccionados = seleccionados.length;
		Iterator<Integer> iteradorClaves = arrayRespuestas.keySet().iterator();
		salida += "<div>";
		if (valoresSeleccionados > 0) {
			while (iteradorClaves.hasNext()) {
				String checked = "";
				int clave = iteradorClaves.next();
				String valor = arrayRespuestas.get(clave);
				if ((contador < valoresSeleccionados) && (seleccionados[contador] == clave)) {
					checked = "checked";
					contador++;
				}
				salida += "<div><input type='checkbox' name='" + nombreControl + "' value='" + clave + "' " + checked
						+ " /><label>" + valor + "</label></div><br>";
			}
		} else {
			while (iteradorClaves.hasNext()) {
				String checked = "";
				int clave = iteradorClaves.next();
				String valor = arrayRespuestas.get(clave);
				salida += "<div><input type='checkbox' name='" + nombreControl + "' value='" + clave + "' " + checked + " /><label>" + valor + "</label></div><br>";
			}
		}
		salida += "</div>";

		return salida;
	}
	
	
	
	public static String muestrExamen(ArrayList<Pregunta> examen) {
		String salida = "";
		
		for(int i = 0; i < examen.size(); i++) {
			salida += "<div class = 'card'><label>" + examen.get(i).getEnunciado() +"</label>";
			for(int j = 0; j < examen.get(i).getRespuestas().size(); j++) {
				
				if(examen.get(i).getRespuestas().get(j).isValida()) {
					if(examen.get(i).getRespuestas().get(j).isMarcada()) {
						salida += "<div class='opciones'><label class='buena'><mark>" + examen.get(i).getRespuestas().get(j).getTexto() +"</mark></label><label class='acierto'> Correcta</label><label class= 'acierto'>+1</label></div>";
					}else {
						salida += "<div class='opciones'><label class='buena'><mark>" + examen.get(i).getRespuestas().get(j).getTexto() +"</mark></label></div>";
					}
						
				}else if(examen.get(i).getRespuestas().get(j).isMarcada() && !examen.get(i).getRespuestas().get(j).isValida()) {
					
					salida += "<div class='opciones'><label>" + examen.get(i).getRespuestas().get(j).getTexto() +"</label><label class='error'> Incorrecta</label><label class= 'error'>-0,25</label></div>";
				}else {
					
					salida += "<div class='opciones'><label>" + examen.get(i).getRespuestas().get(j).getTexto() +"</label></div>";
				}
			}
			salida += "</div>";
		}
		
		return salida;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
