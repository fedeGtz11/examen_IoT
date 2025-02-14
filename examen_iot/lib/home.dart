import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Function(int) changePage;
  const Home({super.key, required this.changePage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/image1.png'),
              const SizedBox(height: 20),
              const Text(
                'CarPoolin',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Drive & Save Money',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: FloatingActionButton(
              onPressed: () => changePage(1),
              tooltip: 'Siguiente',
              child: const Icon(Icons.arrow_forward),
            ),
          ),
        ),
      ],
    );
  }
}
