import 'package:flutter/material.dart';
import 'factory.dart';
import 'botones.dart';
import 'desplegable_operaciones.dart';
import 'contenedor_resultado.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _inputText = '';
  String _resultado = '';
  String _operacionSeleccionada = 'Media';
  final List<String> _operaciones = ['Media', 'Mediana', 'Moda', 'Varianza', 'Desviacion', 'Rango'];

  void _addNumber(String number) {
    setState(() {
      if (_inputText.isEmpty && number == ',') {
        _inputText = '0,';
      } else {
        _inputText += number;
      }
    });
  }

  void _deleteLastCharacter() {
    if (_inputText.isNotEmpty) {
      setState(() {
        _inputText = _inputText.substring(0, _inputText.length - 1); //
      });
    }
  }

  void _clearInput() {
    setState(() {
      _inputText = '';
    });
  }

  List<double> _obtenerDatos() {
    return _inputText.split(',').map((e) => double.tryParse(e.trim()) ?? 0).toList();
  }

  void _calcular() {
    List<double> datos = _obtenerDatos();
    if (datos.isEmpty || _inputText.isEmpty) { // introducir los datos
      setState(() => _resultado = 'Error: Ingresa datos válidos.');
      return;
    }

    OperacionEstadistica? operacion = Factory.obtenerOperacion(_operacionSeleccionada); // se obtiene operación de la factoría
    setState(() => _resultado = operacion != null
        ? operacion.calcular(datos).toStringAsFixed(3) // cálculo del resultado y lo pone a 3 decimales
        : 'Operación no válida.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Estadística'),
        backgroundColor: const Color(0xFFF9B6E5),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Sección del título con fondo rosa


          // Desplegable para seleccionar operación
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DesplegableOperaciones(
              value: _operacionSeleccionada,
              items: _operaciones,
              onChanged: (value) {
                if (value != null) {
                  setState(() => _operacionSeleccionada = value); // con setstate se va actualizando lo que se ve
                }
              },
            ),
          ),

          // Visualización de resultados
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ContenedorResultado(
              text: _inputText.isEmpty ? 'Introduce números' : _inputText,
            ),
          ),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ContenedorResultado(
              text: _resultado.isEmpty ? 'Resultado' : _resultado,
              color: const Color(0xFFE6F7FF), // azul para diferenciar
              borderColor: const Color(0xFF90CAF9), // Borde azul
            ),
          ),

          const SizedBox(height: 16),



          // Teclado numérico
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Primera fila: / <- 0
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BotonNumero(
                        text: ',',
                        onPressed: () => _addNumber(','),
                      ),
                      BotonNumero(
                        text: '<-',
                        onPressed: _deleteLastCharacter,
                      ),
                      BotonNumero(
                        text: '0',
                        onPressed: () => _addNumber('0'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Segunda fila: 1 2 3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BotonNumero(
                        text: '1',
                        onPressed: () => _addNumber('1'),
                      ),
                      BotonNumero(
                        text: '2',
                        onPressed: () => _addNumber('2'),
                      ),
                      BotonNumero(
                        text: '3',
                        onPressed: () => _addNumber('3'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Tercera fila: 4 5 6
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BotonNumero(
                        text: '4',
                        onPressed: () => _addNumber('4'),
                      ),
                      BotonNumero(
                        text: '5',
                        onPressed: () => _addNumber('5'),
                      ),
                      BotonNumero(
                        text: '6',
                        onPressed: () => _addNumber('6'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Cuarta fila: 7 8 9
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BotonNumero(
                        text: '7',
                        onPressed: () => _addNumber('7'),
                      ),
                      BotonNumero(
                        text: '8',
                        onPressed: () => _addNumber('8'),
                      ),
                      BotonNumero(
                        text: '9',
                        onPressed: () => _addNumber('9'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Botón de calcular
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF9B6E5),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        onPressed: _calcular,
                        child: const Text(
                          'CALCULAR',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}