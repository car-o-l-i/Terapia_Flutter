import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guía de Viajes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaPrincipal()),
                );
              },
              child: Text('Ir a la Guía de Viajes'),
            ),
            SizedBox(height: 16.0),
            FormularioRegistro(), // Agregar el formulario de registro
          ],
        ),
      ),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destinos Turísticos'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('París'),
            onTap: () {
              // Navegación a la pantalla de detalles de París
            },
          ),
          // Agrega más destinos aquí...
        ],
      ),
    );
  }
}

class FormularioRegistro extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            key: ValueKey('nombre_field'), // Key para identificar el campo de nombre
            decoration: InputDecoration(labelText: 'Nombre'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Por favor, ingresa tu nombre';
              }
              return null;
            },
          ),
          TextFormField(
            key: ValueKey('destino_field'), // Key para identificar el campo de destino
            decoration: InputDecoration(labelText: 'Destino'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Por favor, ingresa el destino de tu viaje';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Registro exitoso')),
                );
              }
            },
            child: Text('Registrar'),
          ),
        ],
      ),
    );
  }
}


