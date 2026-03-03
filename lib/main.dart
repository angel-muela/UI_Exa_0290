// lib/main.dart
import 'package:flutter/material.dart';
import 'pantallas/prodsuc.dart'; 
import 'pantallas/buscar.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  Widget buildNavBar(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      color: Colors.orange[800],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navButton('buscar', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BuscarPage()),
            );
          }),
          const Text('|', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          _navButton('sucursales', () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MainMenu()),
              (route) => false,
            );
          }),
          const Text('|', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          _navButton('carrito', () {}),
          const Text('|', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          _navButton('iniciar', () {}),
        ],
      ),
    );
  }

  Widget _navButton(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text, 
        style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double singleCardWidth = 320.0;
    final Color naranjaFuerte = Colors.orange[800]!;
    const Color fondoOscuro = Color(0xFF1A1A1A);
    final Color colorCuadros = Colors.blueGrey[50]!;

    // Lista de sucursales con sus respectivas imágenes
    final List<Map<String, String>> sucursales = [
      {
        "nombre": "Sucursal 1", 
        "tel": "656 692 1697", 
        "direccion": "Av. Vicente Guerrero #120, Col. Centro",
        "imagen": "https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/f1.jpg"
      },
      {
        "nombre": "Sucursal 2", 
        "tel": "656 341 23 09", 
        "direccion": "Av. de las Torres #1450, Cd. Juárez",
        "imagen": "https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/f2.jpg"
      },
      {
        "nombre": "Sucursal 3", 
        "tel": "656 611 45 22", 
        "direccion": "Anillo Envolvente #321, Zona Pronaf",
        "imagen": "https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/f3.jpg"
      },
      {
        "nombre": "Sucursal 4", 
        "tel": "656 220 11 44", 
        "direccion": "Blvd. Gómez Morín #900, Cd. Juárez",
        "imagen": "https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/f4.jpg"
      },
    ];

    return Scaffold(
      backgroundColor: fondoOscuro,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: naranjaFuerte,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ferreteria', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black)),
                      Text('el patito', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
            Container(height: 10, color: fondoOscuro),
            buildNavBar(context),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text("SUCURSALES", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                spacing: 20,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: sucursales.map((suc) {
                  return BranchCard(
                    width: singleCardWidth,
                    btnColor: naranjaFuerte,
                    cardColor: colorCuadros,
                    name: suc['nombre']!,
                    phone: suc['tel']!,
                    address: suc['direccion']!,
                    imageUrl: suc['imagen']!, // Pasamos la imagen
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class BranchCard extends StatelessWidget {
  final String name, phone, address, imageUrl;
  final double width;
  final Color btnColor, cardColor;

  const BranchCard({
    super.key, 
    required this.name, 
    required this.phone, 
    required this.address, 
    required this.imageUrl, 
    required this.width, 
    required this.btnColor, 
    required this.cardColor
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle estiloInfoSucursal = TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: cardColor, 
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 8)]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CONTENEDOR DE LA IMAGEN
          Container(
            height: 200, 
            width: double.infinity, 
            margin: const EdgeInsets.fromLTRB(20, 15, 20, 15), 
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[800]!, width: 3),
            ),
            child: Image.network(
              imageUrl, 
              fit: BoxFit.cover, // Para que la imagen cubra el espacio del cuadro
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: estiloInfoSucursal),
                const SizedBox(height: 4),
                Text("Teléfono: $phone", style: estiloInfoSucursal),
                const SizedBox(height: 4),
                Text("Dirección: $address", style: estiloInfoSucursal),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProdSucPage(nombreSucursal: name, telefono: phone, direccion: address)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: btnColor, 
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), 
                  elevation: 4
                ),
                child: const Text("ver sucursal", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}