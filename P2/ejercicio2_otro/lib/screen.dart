import 'package:flutter/material.dart';
import 'suscripcion.dart';
import 'gestor_suscripciones.dart';
import 'widgets/agregar_suscripcion.dart';
import 'widgets/lista_suscripciones.dart';
import 'widgets/total_mensual.dart';

class SuscripcionesScreen extends StatefulWidget {
  const SuscripcionesScreen({Key? key}) : super(key: key);

  @override
  _SuscripcionesScreenState createState() => _SuscripcionesScreenState();
}

class _SuscripcionesScreenState extends State<SuscripcionesScreen> {
  // Instancia del gestor de suscripciones
  final GestorSuscripciones _gestor = GestorSuscripciones(); // _gestor comienza con lista vacía de suscripciones

  void _agregarSuscripcion(Suscripcion nuevaSuscripcion) {
    setState(() {
      _gestor.agregarSuscripcion(nuevaSuscripcion); // si los datos son validos, se crea un objeto suscripcion con los datos ingresados
    });
  }

  void _eliminarSuscripcion(int index) {
    setState(() {
      _gestor.eliminarSuscripcion(index);
    });
  }

  void _mostrarDialogoAgregarSuscripcion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AgregarSuscripcionDialog(
          onAgregarSuscripcion: _agregarSuscripcion,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) { // se construye scaffold con un app bar (titulo), body con total mensual y la lista, y un boton para gregar
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestor de Suscripciones'),
      ),
      body: Column(
        children: [
          TotalMensualWidget(costoTotal: _gestor.calcularCostoTotal()),
          Expanded(
            child: ListaSuscripciones(
              suscripciones: _gestor.suscripciones,
              onEliminar: _eliminarSuscripcion,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAgregarSuscripcion, //mostrar dialogo y se ingresa descripcion y precio mensual
        tooltip: 'Agregar Suscripción',
        child: const Icon(Icons.add),
      ),
    );
  }
}