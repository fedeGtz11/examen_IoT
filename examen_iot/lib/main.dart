import 'package:flutter/material.dart';
import 'home.dart'; // Importar Home
import 'viaje.dart'; // Importar Viaje
import 'summary.dart'; // Importar Summary
import 'viaje_recibido.dart'; // Importar ViajeRecibido

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0; // Índice de la pantalla actual

  // Controladores para los inputs de la pantalla "Viaje"
  final TextEditingController origenController = TextEditingController();
  final TextEditingController destinoController = TextEditingController();
  final TextEditingController pasajerosController = TextEditingController();
  String? errorMensaje;

  // Función para cambiar la pantalla dentro del mismo Scaffold
  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Lista de pantallas sin Scaffold, solo el contenido
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
      ),
      ViajeRecibido(changePage: _changePage),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CarPoolin App',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: pages[_selectedIndex], // Muestra solo la pantalla actual
      ),
    );
  }
}
