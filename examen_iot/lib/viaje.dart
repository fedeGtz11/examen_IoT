import 'package:flutter/material.dart';

class Viaje extends StatelessWidget {
  final Function(int) changePage;
  final TextEditingController origenController;
  final TextEditingController destinoController;
  final TextEditingController pasajerosController;
  final String? errorMensaje;
  final Function(String?) setError;

  const Viaje({
    super.key,
    required this.changePage,
    required this.origenController,
    required this.destinoController,
    required this.pasajerosController,
    required this.errorMensaje,
    required this.setError,
  });

  void _validarYAvanzar() {
    int? numPasajeros = int.tryParse(pasajerosController.text);

    if (numPasajeros == null || numPasajeros < 1) {
      setError('Debes ingresar al menos 1 pasajero.');
    } else if (numPasajeros > 6) {
      setError('No pueden ser más de 6 pasajeros.');
    } else {
      setError(null);
      changePage(2); // Navegar a Summary
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
              controller: origenController,
              decoration: const InputDecoration(labelText: 'Origen')),
          TextField(
              controller: destinoController,
              decoration: const InputDecoration(labelText: 'Destino')),
          const SizedBox(height: 20),
          TextField(
              controller: pasajerosController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Número de pasajeros')),
          if (errorMensaje != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(errorMensaje!,
                  style: const TextStyle(color: Colors.red, fontSize: 14)),
            ),
          const SizedBox(height: 20),
          Center(
              child: ElevatedButton(
                  onPressed: _validarYAvanzar,
                  child: const Text('Buscar viaje'))),
        ],
      ),
    );
  }
}
