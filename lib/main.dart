// lib/main.dart
import 'package:flutter/material.dart';
// Importamos las pantallas apuntando a la subcarpeta pantallas
import 'pantallas/sucursales.dart';
import 'pantallas/buscar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ferreteria el patito',
      // Definimos la ruta inicial (Sucursales)
      initialRoute: '/',
      // Definimos el mapa de rutas
      routes: {
        '/': (context) => const SucursalesPage(),
        '/buscar': (context) => const BuscarPage(),
        // Nota: prodsuc no se agrega aquí porque requiere parámetros obligatorios 
        // en su constructor (nombre, tel, direccion).
      },
    );
  }
}