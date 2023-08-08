import 'package:flutter/material.dart';

class CreditosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Créditos"),
      ),
      body: const Center(
        child: Text(
          "Desenvolvido por Beatriz Santos e Maria Eduarda Ramalho",
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
