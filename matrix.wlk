object neo {
    const esElegido = true
    var energia = 100
    var vitalidad = energia / 10

    method energia() {return energia}

    method saltar() {
        energia = energia / 2
    }

    method vitalidad() {return vitalidad}

    method esElegido() {return esElegido}

}

object morfeo {
    const esElegido = false
    var vitalidad = 8
    var estaCansado = false
    
    method estaCansado() {return estaCansado}

    method saltar() {
        if (estaCansado == false) {
            estaCansado = true
        }
        else {
            estaCansado = false
        }

        vitalidad = vitalidad - 1
    }

    method vitalidad() {return vitalidad}

    method esElegido() {return esElegido}

}

object trinity {
    const esElegido = false
    const vitalidad = 0

    method vitalidad() {return vitalidad}

    method esElegido() {return esElegido}

    method saltar() {}

}

object nave {
    var pasajeros = []

    method subirPasajero(pasajero) {
        pasajeros.add(pasajero)
    }
    
    method bajarPasajero(pasajero) {
        pasajeros.remove(pasajero)
    }

    method cantidadPasajeros() {
        return pasajeros.size()
    }

    method estaElElegido() {
      return pasajeros.any({pasajero => pasajero.esElegido()})
    }

    method mayorVitalidad() {
        return pasajeros.max({pasajero => pasajero.vitalidad()})
    }

    method naveEquilibrada() {
        const vitalidades = pasajeros.map({pasajeros => pasajeros.vitalidad()})
        const vitalidadMaxima = vitalidades.max()
        const vitalidadMinima = vitalidades.min()
        
        return vitalidadMaxima <= 2 * vitalidadMinima
    }

    method naveChoca() {
        pasajeros.forEach({pasajero => pasajero.saltar()})

        pasajeros.clear()
    }

    method naveAcelera() {
        const pasajerosMenosElegido = pasajeros.filter({pasajero => not pasajero.esElegido()})
        
        pasajerosMenosElegido.forEach({pasajero => pasajero.saltar()})
    }

}