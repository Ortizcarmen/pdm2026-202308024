import 'package:flutter/material.dart';

void main() {
  runApp(const MiPedidoApp());
}

class MiPedidoApp extends StatelessWidget {
  const MiPedidoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi pedido',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.brown,
      ),
      home: const MiPedido(),
    );
  }
}

class MiPedido extends StatefulWidget {
  const MiPedido({super.key});

  @override
  State<MiPedido> createState() => _MiPedidoState();
}

class _MiPedidoState extends State<MiPedido> {
  final nombres = [
    'Café',
    'Sándwich',
    'Jugo',
    'Pastel',
    'Croissant',
  ];

  final precios = [10.0, 25.0, 12.0, 18.0, 15.0];

  final iconos = [
    Icons.coffee,
    Icons.fastfood,
    Icons.local_drink,
    Icons.cake,
    Icons.breakfast_dining,
  ];

  final cantidades = [0, 0, 0, 0, 0];

  double get total {
    double resultado = 0;

    for (int i = 0; i < precios.length; i++) {
      resultado += precios[i] * cantidades[i];
    }

    return resultado;
  }

  void cambiarCantidad(int indice, int cambio) {
    setState(() {
      if (cantidades[indice] + cambio >= 0) {
        cantidades[indice] += cambio;
      }
    });
  }

  void vaciarPedido() {
    setState(() {
      for (int i = 0; i < cantidades.length; i++) {
        cantidades[i] = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              'Mi pedido',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Cafetería',
              style: TextStyle(
                fontSize: 14,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
        child: Column(
          children: [
            const Text(
              'Revise su producto antes de pagar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),
            for (int i = 0; i < nombres.length; i++)
              ProductoPedido(
                nombre: nombres[i],
                precio: precios[i],
                icono: iconos[i],
                cantidad: cantidades[i],
                sumar: () => cambiarCantidad(i, 1),
                restar: () => cambiarCantidad(i, -1),
              ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Q${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: vaciarPedido,
                child: const Text('Vaciar pedido'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductoPedido extends StatelessWidget {
  final String nombre;
  final double precio;
  final IconData icono;
  final int cantidad;
  final VoidCallback sumar;
  final VoidCallback restar;

  const ProductoPedido({
    super.key,
    required this.nombre,
    required this.precio,
    required this.icono,
    required this.cantidad,
    required this.sumar,
    required this.restar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          icono,
          color: Colors.brown,
          size: 28,
        ),
        title: Text(
          nombre,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Q${precio.toStringAsFixed(2)}',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: restar,
              icon: const Icon(Icons.remove),
            ),
            Text(
              '$cantidad',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: sumar,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}