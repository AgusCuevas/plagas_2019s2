import Elementos.*

class TienenEnComun{
	var property poblacion 
	var property pesoPromedio 
	
	method nivelDeDanio(){
		return poblacion 
	}
	
	method transmitenEnfermedades() {
		return poblacion > 10 
	}
	
	method ataqueA_(elemento){
		elemento.ataqueDe_(self)
		poblacion *= 1.10
	}
}

//*****************************************************

class Cucarachas inherits TienenEnComun {
	
	override  method nivelDeDanio(){
		return super() / 2
	}
	
	override  method transmitenEnfermedades(){
		return super() or pesoPromedio > 10
	}
	
	override method ataqueA_(elemento){
		elemento.ataqueDe_(self)
		poblacion *= 1.10
		pesoPromedio = pesoPromedio + 2
	}
}

class Pulgas inherits TienenEnComun {
	
	override  method nivelDeDanio(){
		return super() * 2
	}
}

class Garrapatas inherits Cucarachas{
	override method ataqueA_(elemento){
		elemento.ataqueDe_(self)
		poblacion *= 1.20	
	}
}

class Mosquitos inherits TienenEnComun{
	override method transmitenEnfermedades(){
		return super() or return poblacion % 3 == 0 
	}
}


