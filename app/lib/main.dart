import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Inicio(),
    );
  }
}

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guía de Viajes'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.pexels.com/photos/9207080/pexels-photo-9207080.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PantallaPrincipal()),
              );
            },
            child: Text('Ir a la Guía de Viajes'),
          ),
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.pexels.com/photos/1612351/pexels-photo-1612351.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DestinoTile(
                nombre: 'París',
                imagenUrl: 'https://images.pexels.com/photos/8430474/pexels-photo-8430474.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                onTap: () {
                  _navigateToRegistro(context);
                },
              ),
              DestinoTile(
                nombre: 'Nueva York',
                imagenUrl: 'https://images.pexels.com/photos/3586966/pexels-photo-3586966.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                onTap: () {
                  _navigateToRegistro(context);
                },
              ),
              DestinoTile(
                nombre: 'Roma',
                imagenUrl: 'https://images.pexels.com/photos/11097746/pexels-photo-11097746.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                onTap: () {
                  _navigateToRegistro(context);
                },
              ),
              DestinoTile(
                nombre: 'Tokio',
                imagenUrl: 'https://images.pexels.com/photos/4962833/pexels-photo-4962833.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                onTap: () {
                  _navigateToRegistro(context);
                },
              ),
              DestinoTile(
                nombre: 'Peru',
                imagenUrl: 'https://images.pexels.com/photos/259967/pexels-photo-259967.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                onTap: () {
                  _navigateToRegistro(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToRegistro(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormularioRegistro()),
    );
  }
}

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
      title: Text(nombre, style: TextStyle(color: Colors.white)),
      leading: Image.network(imagenUrl),
      onTap: onTap,
    );
  }
}


class RegistroExitoso extends StatelessWidget {
  final String nombre;
  final String destino;
  final String fecha;
  final String duracion;

  RegistroExitoso({
    required this.nombre,
    required this.destino,
    required this.fecha,
    required this.duracion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.pexels.com/photos/351283/pexels-photo-351283.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'), // Reemplaza con la URL de tu imagen de fondo
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¡Registro Exitoso!',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                Card(
                  color: Colors.black.withOpacity(0.7),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetalleViaje(
                          titulo: 'Nombre:',
                          valor: nombre,
                        ),
                        DetalleViaje(
                          titulo: 'Destino:',
                          valor: destino,
                        ),
                        DetalleViaje(
                          titulo: 'Fecha de salida:',
                          valor: fecha,
                        ),
                        DetalleViaje(
                          titulo: 'Duración:',
                          valor: '$duracion días',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    _navigateToAgradecimiento(context);
                  },
                  child: Text('Agradecimiento'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToAgradecimiento(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Agradecimiento()),
    );
  }
}


class DetalleViaje extends StatelessWidget {
  final String titulo;
  final String valor;

  DetalleViaje({
    required this.titulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titulo,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            valor,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}


class FormularioRegistro extends StatefulWidget {
  @override
  _FormularioRegistroState createState() => _FormularioRegistroState();
}

class _FormularioRegistroState extends State<FormularioRegistro> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _destinoController = TextEditingController();
  TextEditingController _fechaController = TextEditingController();
  TextEditingController _duracionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Viaje'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.pexels.com/photos/11369178/pexels-photo-11369178.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 150.0),
                  TextFormField(
                    controller: _nombreController,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Por favor, ingresa tu nombre';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: _destinoController,
                    decoration: InputDecoration(
                      labelText: 'Destino',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Por favor, ingresa el destino de tu viaje';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: _fechaController,
                    decoration: InputDecoration(
                      labelText: 'Fecha de salida',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Por favor, ingresa la fecha de salida';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: _duracionController,
                    decoration: InputDecoration(
                      labelText: 'Duración (días)',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Por favor, ingresa la duración del viaje';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _registrarViaje();
                    },
                    child: Text('Registrar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _registrarViaje() {
    if (_formKey.currentState?.validate() ?? false) {
      String nombre = _nombreController.text;
      String destino = _destinoController.text;
      String fecha = _fechaController.text;
      String duracion = _duracionController.text;

      // Muestra el SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registro exitoso: $nombre va a $destino el $fecha por $duracion días'),
        ),
      );

      // Navega a la pantalla RegistroExitoso
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegistroExitoso(
            nombre: nombre,
            destino: destino,
            fecha: fecha,
            duracion: duracion,
          ),
        ),
      );

      // Limpia los controladores
      _nombreController.clear();
      _destinoController.clear();
      _fechaController.clear();
      _duracionController.clear();
    }
  }
}

class Agradecimiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gracias por usar nuestros servicios'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¡Gracias por confiar en nuestra guía de viajes!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Text(
                'Estamos encantados de ayudarte a planificar tus aventuras. Esperamos que disfrutes al máximo tus próximos viajes y que vuelvas pronto para explorar más destinos con nosotros.',
                style: TextStyle(
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



