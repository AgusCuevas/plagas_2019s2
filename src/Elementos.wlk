import Plagas.*

class Hogar {
	var property mugre = 0
	var property confort = 0

	
	method esBueno(){
		return mugre <= confort / 2 
	}
	
	method ataqueDe_(plaga){ 
		  mugre += plaga.poblacion()
	}
}

class Huerta {
	var property capacidadDeProduccion = 0
	var property nivel = 20
	
	method esBueno(){
		return capacidadDeProduccion > nivel
	}
		
	method ataqueDe_(plaga){
		if (not plaga.transmitenEnfermedades()){
			capacidadDeProduccion = 0.max(capacidadDeProduccion - plaga.nivelDeDanio() * 0.10)
		}
		else{
			capacidadDeProduccion =  0.max((capacidadDeProduccion - plaga.nivelDeDanio() * 0.10) - 10)
		}
	}
}

class Mascota {
	var property salud = 0
	
	method esBueno(){
		return salud > 250
	}
	
	method ataqueDe_(plaga){
		if (plaga.transmitenEnfermedades()){
			salud = 0.max(salud - plaga.nivelDeDanio())
		}
	}
}

class Barrios {
	var elementosDelBarrio = []
	
	method agregarElementos(elemento) {
		elementosDelBarrio.add(elemento)
	}
	
	method cantidadDeElementosBuenos(){
		return elementosDelBarrio.filter({ g => g.esBueno()}).size()
	}
	
	method cantidadDeElementosMalos(){
		return elementosDelBarrio.filter({ g => not g.esBueno()}).size()
	}
	
	method barrioCopado(){
		return self.cantidadDeElementosBuenos() > self.cantidadDeElementosMalos()
	}
	
}

