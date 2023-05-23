import plagas.* 

object produccionMedia{
	var property nivel = 10
}

class Hogar{
	var nivelMugre
	var confort 
	
	method esBueno() = nivelMugre <= confort/2
	method nivelDeMugre() = nivelMugre
	method confort() = confort
	method recibirAtaque(plaga) {
		nivelMugre += plaga.nivelDanio()
		plaga.realizoAtaque()
	}
}

class Huerta{
	var capacidadProd
	
	method esBueno() = capacidadProd > produccionMedia.nivel()
	method recibirAtaque(plaga) {
		capacidadProd = 0.max(capacidadProd-plaga.nivelDanio() * 0.1)
		if(plaga.transEnfermedades()){
			capacidadProd = 0.max(capacidadProd-10)
		}
		plaga.realizoAtaque()
	}	
}

class Mascota{
	var nivelSalud
	
	method esBueno() = nivelSalud > 250
	method recibirAtaque(plaga) {
		if(plaga.transEnfermedades()) {
			nivelSalud = 0.max(nivelSalud-plaga.nivelDanio())
		}  
		plaga.realizoAtaque()
	}
}

class Barrio{
	const elementos = []
	
	method agregarElemento(elem){elementos.add(elem)}
	method eliminarElemento(elem){elementos.remove(elem)}
	method verElementos() = elementos
	method esCopado() = self.cantElementosBuenos() > self.cantElementosNoBuenos()
	method cantElementosBuenos() = elementos.count({e => e.esBueno()})
	method cantElementosNoBuenos() = elementos.count({e => not e.esBueno()})
	method recibirAtaque(plaga) { elementos.forEach{e => e.recibirAtaque(plaga)} } 	
}
