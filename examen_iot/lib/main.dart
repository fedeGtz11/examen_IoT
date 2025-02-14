import 'package:flutter/material.dart';
import 'home.dart';
import 'viaje.dart';
import 'summary.dart';
import 'viaje_recibido.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final TextEditingController origenController = TextEditingController();
  final TextEditingController destinoController = TextEditingController();
  final TextEditingController pasajerosController = TextEditingController();
  String? errorMensaje;

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Home(changePage: _changePage),
      Viaje(
        changePage: _changePage,
        origenController: origenController,
        destinoController: destinoController,
        pasajerosController: pasajerosController,
        errorMensaje: errorMensaje,
        setError: (String? message) {
          setState(() {
            errorMensaje = message;
          });
        },
      ),
      Summary(
        changePage: _changePage,
        origen: origenController.text,
        destino: destinoController.text,
        numPasajeros: pasajerosController.text,
      ),
      ViajeRecibido(
        changePage: _changePage,
        origen: origenController.text,
        destino: destinoController.text,
        numPasajeros: pasajerosController.text,
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CarPoolin App',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: pages[_selectedIndex],
      ),
    );
  }
}
