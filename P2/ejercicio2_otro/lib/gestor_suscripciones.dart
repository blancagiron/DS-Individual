import 'suscripcion.dart';

class GestorSuscripciones {
  List<Suscripcion> suscripciones = [];

  // Agregar una nueva suscripción
  void agregarSuscripcion(Suscripcion suscripcion) {
    suscripciones.add(suscripcion);
  }

  // Eliminar una suscripción
  void eliminarSuscripcion(int index) {
    suscripciones.removeAt(index);
  }

  // Calcular el costo total mensual
  double calcularCostoTotal() {
    double total = 0;
    for (var suscripcion in suscripciones) {
      total += suscripcion.precioMensual;
    }
    return total;
  }
}