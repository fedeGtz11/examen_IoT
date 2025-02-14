import 'package:flutter/material.dart';

class Viaje extends StatefulWidget {
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

  @override
  State<Viaje> createState() => _ViajeState();
}

class _ViajeState extends State<Viaje> {
  String selectedDate = "Hoy";

  void _validarYAvanzar() {
    int? numPasajeros = int.tryParse(widget.pasajerosController.text);

    if (numPasajeros == null || numPasajeros < 1) {
      widget.setError('Debes ingresar al menos 1 pasajero.');
    } else if (numPasajeros > 6) {
      widget.setError('No pueden ser más de 6 pasajeros.');
    } else {
      widget.setError(null);
      widget.changePage(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => widget.changePage(0),
          ),
          TextField(
              controller: widget.origenController,
              decoration: const InputDecoration(labelText: 'Origen')),
          TextField(
              controller: widget.destinoController,
              decoration: const InputDecoration(labelText: 'Destino')),
          const SizedBox(height: 20),
          const Text('Fecha',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChoiceChip(
                label: const Text('Hoy'),
                selected: selectedDate == "Hoy",
                onSelected: (selected) {
                  setState(() {
                    selectedDate = "Hoy";
                  });
                },
              ),
              ChoiceChip(
                label: const Text('Mañana'),
                selected: selectedDate == "Mañana",
                onSelected: (selected) {
                  setState(() {
                    selectedDate = "Mañana";
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
              controller: widget.pasajerosController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Número de pasajeros')),
          if (widget.errorMensaje != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(widget.errorMensaje!,
                  style: const TextStyle(color: Colors.red, fontSize: 14)),
            ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: _validarYAvanzar,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Buscar Viaje'),
            ),
          ),
        ],
      ),
    );
  }
}
