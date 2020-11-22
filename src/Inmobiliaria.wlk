class Inmobiliaria {

	const empleados = #{}
	var property criterioDeMejores

	method mejorEmpleado() {
		var mejorEmpleado = empleados.get(0)
		empleados.forEach({ empleado =>
			if (criterioDeMejores.condicion(mejorEmpleado, empleado)) {
				mejorEmpleado = empleado
			}
		})
		return mejorEmpleado
	}

}

class CriterioDeMejores {

	method condicion(empleado1, empleado2)

}

object masComisiones inherits CriterioDeMejores {

	override method condicion(empleado1, empleado2) = empleado1.totalComisiones() < empleado2.totalComisiones()

}

object masOperaciones inherits CriterioDeMejores {

	override method condicion(empleado1, empleado2) = empleado1.cantidadCerradas() < empleado2.cantidadCerradas()

}

object masReservas inherits CriterioDeMejores {

	override method condicion(empleado1, empleado2) = empleado1.cantidadReservas() < empleado2.cantidadReservas()

}

