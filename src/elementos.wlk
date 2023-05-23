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
		capacidadProd -= plaga.nivelDanio() * 0.1
		if(plaga.transEnfermedades()){
			capacidadProd -= 10
		}
		plaga.realizoAtaque()
	}	
}

class Mascota{
	var nivelSalud
	
	method esBueno() = nivelSalud > 250
	method recibirAtaque(plaga) {
		if(plaga.transEnfermedades()) {
			nivelSalud -= plaga.nivelDanio()
		}  
		plaga.realizoAtaque()
	}
}

class Barrio{
	const elementos = []
	
	method agregarElemento(elem){
		elementos.add(elem)
	}
	method verElementos() = elementos
	method esCopado() = self.cantElementosBuenos() > self.cantElementosNoBuenos()
	method cantElementosBuenos() = elementos.count({e => e.esBueno()})
	method cantElementosNoBuenos() = elementos.count({e => not e.esBueno()})
	method recibirAtaque(plaga) { elementos.forEach{e => e.recibirAtaque(plaga)} } 	
}
