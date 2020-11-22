class Inmueble {

	const property metrosCuadrados
	const property cantidadDeAmbientes
	const property operacionPublicada
	const property valorDePropiedad
	var property zona
	var quienReserva = null

	method valor() = zona.adicional() + self.valorPorTipoDeInmueble()

	method valorPorTipoDeInmueble()

	method concretarOperacion(comprador) {
		if (comprador != quienReserva) {
			self.error("El comprador no es el mismo Cliente que quien reservo la propiedad")
		}
	}

	method reservar(cliente) {
		quienReserva = cliente
	}

	method puedeVenderse() = true

}

class Casa inherits Inmueble {

	override method valorPorTipoDeInmueble() = valorDePropiedad

}

class Ph inherits Inmueble {

	method valorPorSuperficie() = 14000 * metrosCuadrados

	override method valorPorTipoDeInmueble() = 500000.max(self.valorPorSuperficie())

}

class Departamento inherits Inmueble {

	override method valorPorTipoDeInmueble() = 350000 * cantidadDeAmbientes

}

class Zona {

	var property adicional

}

class Local inherits Inmueble {

	override method puedeVenderse() = false

}

class Galpon inherits Local {

	override method valorPorTipoDeInmueble() = valorDePropiedad / 2

}

class ALaCalle inherits Local {

	const montoFijo

	override method valorPorTipoDeInmueble() = montoFijo

}

const palermo = new Zona(adicional = 500)

const belgrano = new Zona(adicional = 1000)

const unaCasa = new Casa(metrosCuadrados = 100, cantidadDeAmbientes = 3, operacionPublicada = "Venta", zona = belgrano, valorDePropiedad = 1000)

const unPh = new Ph(metrosCuadrados = 100, cantidadDeAmbientes = 3, operacionPublicada = "Venta", zona = belgrano, valorDePropiedad = 1000)

const unDepto = new Departamento(metrosCuadrados = 100, cantidadDeAmbientes = 3, operacionPublicada = "Venta", zona = belgrano, valorDePropiedad = 1000)

const unGalpon = new Galpon(metrosCuadrados = 100, cantidadDeAmbientes = 3, operacionPublicada = "Venta", zona = belgrano, valorDePropiedad = 1000)

const unLocal = new ALaCalle(metrosCuadrados = 100, cantidadDeAmbientes = 3, operacionPublicada = "Venta", zona = belgrano, valorDePropiedad = 1000, montoFijo = 100)

