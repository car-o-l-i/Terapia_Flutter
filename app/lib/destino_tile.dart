import 'package:flutter/material.dart';

class DestinoTile extends StatelessWidget {
  final String nombre;
  final String imagenUrl;
  final VoidCallback onTap;

  DestinoTile({
    required this.nombre,
    required this.imagenUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nombre),
      leading: Image.network(imagenUrl),
      onTap: onTap,
    );
  }
}

