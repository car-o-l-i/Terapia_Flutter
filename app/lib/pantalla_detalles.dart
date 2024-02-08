import 'package:flutter/material.dart';

class PantallaDetalles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Destino'),
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset('assets/paris.jpg'),
            Text('París - La Ciudad del Amor'),
            // Agrega más detalles aquí...
          ],
        ),
      ),
    );
  }
}
