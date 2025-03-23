// Adaptee - lo que se quiere adaptar, en este caso el servicio de LA
// datos en un formato que queremos convertir

export class ServicioLA {
  constructor(distanciaMillas) {
    this.distanciaMillas = distanciaMillas;
  }

  getDistanciaMillas() {
    return this.distanciaMillas;
  }
}