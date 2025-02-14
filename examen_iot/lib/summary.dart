import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  final Function(int) changePage;
  final String origen;
  final String destino;

  const Summary(
      {super.key,
      required this.changePage,
      required this.origen,
      required this.destino});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Resultados para: $origen → $destino',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ListTile(
              title: const Text('16:30 - 17:20'),
              subtitle: Text('De $origen a $destino')),
          const ListTile(
              leading: CircleAvatar(),
              title: Text('Panfilo'),
              subtitle: Text('4.99 ⭐ (347 reviews)')),
          Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () => changePage(3),
                    child: const Text('Solicitar Viaje')),
                const SizedBox(height: 10),
                const Text(
                    'Al solicitar el viaje, aceptas los términos y condiciones de CarPoolin.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
