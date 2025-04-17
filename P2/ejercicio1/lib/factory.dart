// Factory Method -> Creación de las diferentes operaciones estadísticas
// Media, moda, varianza, desviación estandar

import 'dart:math';

abstract class OperacionEstadistica {
  double calcular(List<double> datos);
}

class Media implements OperacionEstadistica{
  @override
  double calcular(List<double> datos) {
    double suma = 0;
    double media = 0;
    if(datos.isNotEmpty) {
      for (double dato in datos) {
        suma += dato;
      }
      media = suma / datos.length;
    }
    return media;
  }
}

class Mediana implements OperacionEstadistica{
  @override
  double calcular(List<double> datos) {
    datos.sort();
    int tam = datos.length;
    double mediana = 0;

    if (tam != 0) {
      if (tam % 2 != 0){
        mediana = datos[tam ~/ 2]; // ~/ es el operador de división entera
      } else {
        mediana = (datos[tam ~/ 2 - 1] + datos[tam ~/ 2]) / 2;
      }
    }
    return mediana;
  }
}

class Moda implements OperacionEstadistica{
  @override
  double calcular(List<double> datos){
    Map<double, int> frecuencia = {};
    if (datos.isEmpty) return 0;
    for (double dato in datos) {
      frecuencia[dato] = (frecuencia[dato] ?? 0) + 1;
    }

    double moda = datos[0];
    int maxFrecuencia = 0;

    frecuencia.forEach((valor, frec) {
      if (frec > maxFrecuencia) {
        maxFrecuencia = frec;
        moda = valor;
      }
    });

    return moda;
  }
}

class Varianza implements OperacionEstadistica{
  @override
  double calcular(List<double>datos){

    double sumaCuadrados = 0;
    double varianza = 0;

    if(datos.isNotEmpty) {
      double media = Media().calcular(datos);
      for (double dato in datos) {
        sumaCuadrados += (dato - media) * (dato - media);
      }
      varianza = sumaCuadrados / (datos.length - 1);
    }
    return varianza;
  }
}

class DesviacionEstandar implements OperacionEstadistica{
  @override
  double calcular(List<double>datos){
    double varianza = Varianza().calcular(datos);
    return sqrt(varianza);
  }
}

class Rango implements OperacionEstadistica{
  @override
  double calcular(List<double> datos) {
    if (datos.isEmpty) return 0;
    double max = datos.reduce((a, b) => a > b ? a : b);
    double min = datos.reduce((a, b) => a < b ? a : b);
    return max - min;
  }
}

class Factory{
  static OperacionEstadistica? obtenerOperacion(String tipo) {
    switch (tipo.toLowerCase()) {
      case "media":
        return Media();
      case "mediana":
        return Mediana();
      case "moda":
        return Moda();
      case "varianza":
        return Varianza();
      case "desviación":
        return DesviacionEstandar();
      case "rango":
        return Rango();
      default:
        return null;
    }
  }
}

