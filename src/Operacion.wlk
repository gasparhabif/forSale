class Operacion {

	const property inmueble

	method comision()

}

class Alquiler inherits Operacion {

	const mesesDeContrato = 1

	override method comision() = (inmueble.valor() * mesesDeContrato) / 50000

}

class Venta inherits Operacion {

	var property porcentajeDeComision = 1.5

	override method comision() = inmueble.valor() * porcentajeDeComision / 100

}

class Reserva {

	const property inmueble
	const property cliente

}

