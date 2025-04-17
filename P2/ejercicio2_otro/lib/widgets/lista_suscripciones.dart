import 'package:flutter/material.dart';
import '../suscripcion.dart';

class ListaSuscripciones extends StatelessWidget {
  final List<Suscripcion> suscripciones;
  final Function(int) onEliminar;

  const ListaSuscripciones({
    Key? key,
    required this.suscripciones,
    required this.onEliminar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (suscripciones.isEmpty) {
      return const Center(
        child: Text(
          'No hay suscripciones registradas',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      itemCount: suscripciones.length,
      itemBuilder: (context, index) {
        final suscripcion = suscripciones[index];
        return ListTile(
          title: Text(suscripcion.descripcion),
          subtitle: Text(
            'Precio mensual: \$${suscripcion.precioMensual.toStringAsFixed(2)}',
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => onEliminar(index),
          ),
        );
      },
    );
  }
}