import { ServicioLA } from "./ServicioLA";

// Adapter - Convertir millas a kilometros, 

// recibe instancia de ServicioLA y la adapta a un formato válido para el sistema español

export class Adaptador {
    constructor(servicioLA) {
        this.servicioLA = servicioLA;
    }

    getDistanciaKm() {
        return this.servicioLA.getDistanciaMillas() * 1.60934;
    }
}