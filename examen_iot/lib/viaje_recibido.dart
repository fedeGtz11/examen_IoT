import 'package:flutter/material.dart';

class ViajeRecibido extends StatelessWidget {
  final Function(int) changePage;
  const ViajeRecibido({super.key, required this.changePage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.check_circle, color: Colors.green, size: 80),
        const SizedBox(height: 20),
        const Text('¡Viaje solicitado con éxito!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ElevatedButton(
            onPressed: () => changePage(0),
            child: const Text('Volver a Inicio')),
      ]),
    );
  }
}
