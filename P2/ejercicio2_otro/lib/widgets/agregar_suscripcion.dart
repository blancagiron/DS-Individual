import 'package:flutter/material.dart';
import '../suscripcion.dart';

class AgregarSuscripcionDialog extends StatefulWidget {
  final Function(Suscripcion) onAgregarSuscripcion;

  const AgregarSuscripcionDialog({
    Key? key,
    required this.onAgregarSuscripcion,
  }) : super(key: key);

  @override
  _AgregarSuscripcionDialogState createState() => _AgregarSuscripcionDialogState();
}

class _AgregarSuscripcionDialogState extends State<AgregarSuscripcionDialog> {
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();

  @override
  void dispose() {
    _descripcionController.dispose();
    _precioController.dispose();
    super.dispose();
  }

  void _agregarSuscripcion() {
    final String descripcion = _descripcionController.text.trim();
    final String precioText = _precioController.text.trim();

    if (descripcion.isNotEmpty && precioText.isNotEmpty) {
      try {
        final double precio = double.parse(precioText);

        widget.onAgregarSuscripcion(
          Suscripcion(descripcion: descripcion, precioMensual: precio),
        );

        _descripcionController.clear();
        _precioController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor ingrese un precio válido')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor complete todos los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Agregar Suscripción'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _descripcionController,
              decoration: const InputDecoration(
                labelText: 'Descripción',
                hintText: 'Ej: Netflix, Spotify, etc.',
              ),
            ),
            TextField(
              controller: _precioController,
              decoration: const InputDecoration(
                labelText: 'Precio Mensual',
                hintText: 'Ej: 9.99',
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            _agregarSuscripcion();
            Navigator.of(context).pop();
          },
          child: const Text('Agregar'),
        ),
      ],
    );
  }
}