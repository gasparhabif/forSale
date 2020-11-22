import Operacion.*
import Inmueble.*
import Inmobiliaria.*

class Empleado {

	const property operacionesCerradas = #{}
	const property reservasHechas = #{}

	method comisionDeOperacion(operacion) = operacion.comision()

	method cantidadCerradas() = operacionesCerradas.size()

	method cantidadResrvas() = reservasHechas.size()

	method totalComisiones() = operacionesCerradas.sum({ operacion => operacion.comision() })

	method vaATenerProblemas(otroEmpleado) = self.cerroOperacionesEnBarrioComun(otroEmpleado.operacionesCerradas()) && self.concretoReservaRobada(otroEmpleado.reservasHechas())

	method cerroOperacionesEnBarrioComun(operaciones) = operaciones.any({ operacion => self.cerroOperacionesEn(operacion.inmueble().zona()) })

	method cerroOperacionesEn(zona) = operacionesCerradas.any({ operacion => operacion.inmueble().zona() })

	method concretoReservaRobada(reservas) = reservas.any({ reserva => self.cerroOperacionConInmueble(reserva.inmueble()) })

	method cerroOperacionConInmueble(inmueble) = operacionesCerradas.any({ operacion => operacion.inmueble() == inmueble })

	method cerrarOperacion(inmueble, operacion) {
		operacionesCerradas.add(operacion)
		inmueble.concretarOperacion(operacion.cliente())
	}

	method reservarInmueble(propiedad, cliente) {
		inmueble.reservar(cliente)
		reservasHechas.add(new Reserva(inmueble = propiedad, cliente = cliente))
	}

}

