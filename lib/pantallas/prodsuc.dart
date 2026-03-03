// lib/pantallas/prodsuc.dart
import 'package:flutter/material.dart';
import 'sucursales.dart'; // Importamos la nueva pantalla
import 'buscar.dart'; 

class ProdSucPage extends StatelessWidget {
  final String nombreSucursal, telefono, direccion;

  const ProdSucPage({super.key, required this.nombreSucursal, required this.telefono, required this.direccion});

  @override
  Widget build(BuildContext context) {
    const double singleCardWidth = 320.0;
    final Color naranjaFuerte = Colors.orange[800]!;
    const Color fondoOscuro = Color(0xFF1A1A1A);
    final Color colorCuadros = Colors.blueGrey[50]!;

    const TextStyle estiloInfoSucursal = TextStyle(
      fontSize: 16, 
      color: Colors.black, 
      fontWeight: FontWeight.bold
    );

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
            
            Container(
              height: 35, width: double.infinity, color: naranjaFuerte,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _navText('buscar', () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BuscarPage()));
                  }),
                  const Text('|', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), 
                  _navText('sucursales', () {
                    // CORREGIDO: Navegación a SucursalesPage
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SucursalesPage()), (route) => false);
                  }),
                  const Text('|', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), 
                  _navText('carrito', () {}),
                  const Text('|', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), 
                  _navText('iniciar', () {}),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: IntrinsicWidth( 
                child: Container(
                  constraints: const BoxConstraints(minWidth: singleCardWidth, maxWidth: 1000),
                  decoration: BoxDecoration(
                    color: colorCuadros, 
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 5))]
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("productos $nombreSucursal".toLowerCase(), style: estiloInfoSucursal),
                      const SizedBox(height: 4),
                      Text("telefono: $telefono", style: estiloInfoSucursal),
                      const SizedBox(height: 4),
                      Text("direccion: $direccion", style: estiloInfoSucursal),
                      const SizedBox(height: 15),
                      
                      SizedBox(
                        width: 220, 
                        height: 45,
                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
                          label: const Text(
                            "Volver a sucursales", 
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFBBDEFB),
                            shape: const StadiumBorder(), 
                            elevation: 3,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                spacing: 20, runSpacing: 30, alignment: WrapAlignment.center,
                children: [
                  ProductCard(width: singleCardWidth, btnColor: naranjaFuerte, cardColor: colorCuadros, name: "Pala redonda", price: 50.0, imageUrl: "https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/pala.jpg", nombreSucursal: nombreSucursal),
                  ProductCard(width: singleCardWidth, btnColor: naranjaFuerte, cardColor: colorCuadros, name: "Martillo", price: 85.50, imageUrl: "https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/martillo.png", nombreSucursal: nombreSucursal),
                  ProductCard(width: singleCardWidth, btnColor: naranjaFuerte, cardColor: colorCuadros, name: "Taladro", price: 1250.00, imageUrl: "https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/taladro.jpg", nombreSucursal: nombreSucursal),
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
    return InkWell(onTap: onTap, child: Text(label, style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)));
  }
}

class ProductCard extends StatelessWidget {
  final String name, imageUrl, nombreSucursal;
  final double price, width;
  final Color btnColor, cardColor;

  const ProductCard({super.key, required this.name, required this.price, required this.imageUrl, required this.width, required this.btnColor, required this.cardColor, required this.nombreSucursal});

  @override
  Widget build(BuildContext context) {
    const TextStyle estiloInfoProducto = TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold);

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: cardColor, 
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 8, offset: const Offset(0, 4))]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200, width: double.infinity, 
            margin: const EdgeInsets.fromLTRB(20, 15, 20, 15), 
            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey[800]!, width: 3)),
            child: Image.network(imageUrl, fit: BoxFit.contain),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: estiloInfoProducto),
                const SizedBox(height: 4),
                Text("Precio: \$${price.toStringAsFixed(2)}", style: estiloInfoProducto),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity, height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: btnColor, elevation: 4, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                child: const Text("ver producto", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}