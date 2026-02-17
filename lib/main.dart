import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const double singleCardWidth = 320.0; 
    final Color naranjaFuerte = Colors.orange[800]!;
    const Color fondoOscuro = Color(0xFF1A1A1A); 
    final Color colorCuadros = Colors.blueGrey[50]!; 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: fondoOscuro,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // --- ENCABEZADO CON TÍTULO CASI CENTRADO ---
              Container(
                width: double.infinity,
                color: naranjaFuerte,
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  // El Padding a la derecha lo empuja sutilmente a la izquierda del centro
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50), 
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children: const [
                        Text('Ferreteria', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('el patito', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              
              Container(height: 10, color: fondoOscuro),

              // --- BARRA DE NAVEGACIÓN (INCLUYE INICIAR) ---
              Container(
                height: 35,
                width: double.infinity,
                color: naranjaFuerte,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('buscar', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                    Text('|', style: TextStyle(color: Colors.white)),
                    Text('sucursales', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                    Text('|', style: TextStyle(color: Colors.white)),
                    Text('carrito', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                    Text('|', style: TextStyle(color: Colors.white)),
                    Text('iniciar', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),

              // --- CUADRO PRINCIPAL ADAPTABLE ---
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20), 
                child: IntrinsicWidth( // Hace que el cuadro se ajuste al contenido o al ancho de los productos
                  child: Container(
                    constraints: const BoxConstraints(minWidth: singleCardWidth, maxWidth: 1000),
                    decoration: BoxDecoration(
                      color: colorCuadros,
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("productos sucursal sur", 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blueGrey[900])),
                        const Text("telefono: 656 341 23 09", style: TextStyle(color: Colors.black87)),
                        const Text("direccion: Av. de las Torres #1450, Cd. Juárez", style: TextStyle(color: Colors.black87)),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
                          label: const Text("volver a sucursales", style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1976D2),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // --- WRAP DE PRODUCTOS ---
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
                      name: "Pala", 
                      price: 150.00, 
                      imageUrl: "https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/pala.jpg"
                    ),
                    ProductCard(
                      width: singleCardWidth,
                      btnColor: naranjaFuerte,
                      cardColor: colorCuadros,
                      name: "Martillo", 
                      price: 85.50, 
                      imageUrl: "https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/martillo.png"
                    ),
                    ProductCard(
                      width: singleCardWidth,
                      btnColor: naranjaFuerte,
                      cardColor: colorCuadros,
                      name: "Taladro", 
                      price: 1250.00, 
                      imageUrl: "https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/taladro.jpg"
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50), 
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String imageUrl;
  final double width;
  final Color btnColor;
  final Color cardColor;

  const ProductCard({
    super.key, 
    required this.name, 
    required this.price, 
    required this.imageUrl,
    required this.width,
    required this.btnColor,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, 
      decoration: BoxDecoration(
        color: cardColor,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200, 
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            color: Colors.white, 
            child: Image.network(
              imageUrl, 
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(Icons.broken_image, size: 50, color: Colors.grey)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey[900])),
                Text("precio: \$${price.toStringAsFixed(2)}", style: const TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20), 
            child: SizedBox(
              width: 140,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: btnColor,
                  elevation: 2,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                child: const Text("ver producto", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}