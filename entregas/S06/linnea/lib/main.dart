import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Colores de Linnea
const kFondo = Color(0xFFFFF7FA);
const kSuperficie = Color(0xFFFFE8F0);
const kBorde = Color(0xFFF5C6D6);
const kTexto = Color(0xFF4A3039);
const kMuted = Color(0xFF9B7884);
const kRosa = Color(0xFFEFA7BC);
const kRosaOscuro = Color(0xFFD87D9B);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Linnea',
      theme: ThemeData(
        scaffoldBackgroundColor: kFondo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kRosa,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 20),

            // Título principal
            const Text(
              'Hola, bienvenida a Linnea',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: kTexto,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Vamos a conocer tu rutina para ayudarte a organizar tus comidas.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: kMuted,
              ),
            ),

            const SizedBox(height: 35),

            // Presupuesto
            const Text(
              '¿Cuál es tu presupuesto semanal?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kTexto,
              ),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: kSuperficie,
                foregroundColor: kTexto,
                padding: const EdgeInsets.all(18),
                elevation: 0,
                side: const BorderSide(color: kBorde),
              ),
              child: const Row(
                children: [
                  Icon(Icons.attach_money),
                  SizedBox(width: 12),
                  Text('Ingresar presupuesto'),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Horario
            const Text(
              '¿Cuál es tu horario semanal?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kTexto,
              ),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: kSuperficie,
                foregroundColor: kTexto,
                padding: const EdgeInsets.all(18),
                elevation: 0,
                side: const BorderSide(color: kBorde),
              ),
              child: const Row(
                children: [
                  Icon(Icons.calendar_month),
                  SizedBox(width: 12),
                  Text('Ingresar horario semanal'),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Tiempo disponible
            const Text(
              '¿Tienes tiempo para preparar comida?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kTexto,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kRosa,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(18),
                      elevation: 0,
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.thumb_up, size: 30),
                        SizedBox(height: 8),
                        Text('Sí, tengo tiempo'),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kSuperficie,
                      foregroundColor: kTexto,
                      padding: const EdgeInsets.all(18),
                      elevation: 0,
                      side: const BorderSide(color: kBorde),
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.thumb_down, size: 30),
                        SizedBox(height: 8),
                        Text('No tengo tiempo'),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Mensaje
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: kSuperficie,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: kRosaOscuro,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Con tus respuestas crearemos una opción que se adapte a tu semana.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kTexto,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Barra de navegación
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: kRosaOscuro,
        unselectedItemColor: kMuted,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Recetas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Restaurantes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Horario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}