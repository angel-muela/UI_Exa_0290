// lib/pantallas/buscar.dart
import 'package:flutter/material.dart';
import '../main.dart';
import 'prodsuc.dart'; 

class BuscarPage extends StatelessWidget {
  const BuscarPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double singleCardWidth = 320.0;
    final Color naranjaFuerte = Colors.orange[800]!;
    const Color fondoOscuro = Color(0xFF1A1A1A);
    final Color colorCuadros = Colors.blueGrey[50]!;

    return Scaffold(
      backgroundColor: fondoOscuro,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- ENCABEZADO ---
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

            // --- BARRA DE NAVEGACIÓN ---
            Container(
              height: 35,
              width: double.infinity,
              color: naranjaFuerte,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _navText('buscar', () {}),
                  const Text('|', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  _navText('sucursales', () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainMenu()), (route) => false);
                  }),
                  const Text('|', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  _navText('carrito', () {}),
                  const Text('|', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  _navText('iniciar', () {}),
                ],
              ),
            ),

            // --- TÍTULO BUSCAR (Alineado a la izquierda con margen) ---
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20, left: 20), // Se agregó left: 20
              child: Align(
                alignment: Alignment.centerLeft, // Alineación a la izquierda
                child: const Text(
                  "BUSCAR",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),

            // --- CUADRO DE BÚSQUEDA ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 50,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "escribe aqui",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.search, color: Colors.black, size: 28),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // --- BOTONES DE FILTRO REDONDEADOS ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _filtroButton("todo", Colors.blue),
                  const SizedBox(width: 10),
                  _filtroButton("herramientas", Colors.white),
                  const SizedBox(width: 10),
                  _filtroButton("material", Colors.white),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // --- LISTADO DE PRODUCTOS ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                spacing: 20,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  ProductCard(
                    width: singleCardWidth, 
                    btnColor: naranjaFuerte, 
                    cardColor: colorCuadros, 
                    name: "Serrucho", 
                    price: 158.00, 
                    imageUrl: "https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/serrucho.jpg", 
                    nombreSucursal: "Sucursal General"
                  ),
                  ProductCard(
                    width: singleCardWidth, 
                    btnColor: naranjaFuerte, 
                    cardColor: colorCuadros, 
                    name: "Martillo", 
                    price: 85.50, 
                    imageUrl: "https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/martillo.png", 
                    nombreSucursal: "Sucursal General"
                  ),
                  ProductCard(
                    width: singleCardWidth, 
                    btnColor: naranjaFuerte, 
                    cardColor: colorCuadros, 
                    name: "Taladro", 
                    price: 1250.00, 
                    imageUrl: "https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/taladro.jpg", 
                    nombreSucursal: "Sucursal General"
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _navText(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(label, style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
    );
  }

  Widget _filtroButton(String text, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}