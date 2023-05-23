class Plaga{
	var poblacion
	method transEnfermedades() = poblacion >= 10
	method realizoAtaque() {poblacion *=  1.1}
}

class Cucarachas inherits Plaga{
	var pesoPromedio
	override method transEnfermedades() = super() and pesoPromedio >= 10
	method nivelDanio() = poblacion*0.5
	override method realizoAtaque(){
		super()
		pesoPromedio += 2
	}
}

class Pulgas inherits Plaga{
	method nivelDanio() = poblacion*2
}

class Garrapatas inherits Pulgas{
	override method realizoAtaque(){
		poblacion *= 1.2
	}
}

class Mosquitos inherits Plaga{	
	override method transEnfermedades() = super() and poblacion % 3 == 0
	method nivelDanio() = poblacion
}

