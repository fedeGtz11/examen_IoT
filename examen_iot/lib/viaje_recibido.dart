import 'package:flutter/material.dart';

class ViajeRecibido extends StatelessWidget {
  final Function(int) changePage;
  final String origen;
  final String destino;
  final String numPasajeros;

  const ViajeRecibido({
    super.key,
    required this.changePage,
    required this.origen,
    required this.destino,
    required this.numPasajeros,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => changePage(2),
          ),
          Center(
            child: Column(
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 80),
                const SizedBox(height: 20),
                const Text(
                  '¡Viaje solicitado con éxito!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'El conductor te contactará pronto.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Detalles del Viaje:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Origen: $origen',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'Destino: $destino',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'Número de pasajeros: $numPasajeros',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Conductor:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('images/conductor.png'),
            ),
            title: const Text('Panfilo'),
            subtitle: const Text('4.99 ⭐ (347 reviews)'),
          ),
          const SizedBox(height: 10),
          const Text(
            'Auto: Trokon macizo',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () => changePage(0),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Volver a Inicio'),
            ),
          ),
        ],
      ),
    );
  }
}
