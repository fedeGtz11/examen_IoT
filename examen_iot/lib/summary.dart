import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  final Function(int) changePage;
  final String origen;
  final String destino;
  final String numPasajeros;

  const Summary(
      {super.key,
      required this.changePage,
      required this.origen,
      required this.destino,
      required this.numPasajeros});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => changePage(1),
          ),
          Text(
            'Resultados para: $origen → $destino',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    key: ValueKey(index),
                    title: Text('16:30 $origen - 17:20 $destino'),
                    subtitle: Text(
                        'De $origen a $destino, con un total de $numPasajeros pasajeros'),
                    onTap: () {},
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
                  const Text('Auto: Trokon macizo'),
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => changePage(3),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Solicitar Viaje'),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Al solicitar el viaje, aceptas los términos y condiciones del uso de CarPoolin.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
