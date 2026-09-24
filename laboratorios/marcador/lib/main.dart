import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcador',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Marcador'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _counterb = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _incrementCounterb() {
    setState(() {
      _counterb++;
    });
  }

  void _decrementCounterb() {
    setState(() {
      if (_counterb > 0) {
        _counterb--;
      }
    });
  }

  void _reiniciar() {
    setState(() {
      _counter = 0;
      _counterb = 0;
    });
  }

  String _resultado() {
    if (_counter > _counterb) {
      return 'Va ganando Equipo A';
    } else if (_counterb > _counter) {
      return 'Va ganando Equipo B';
    } else {
      return 'Empate';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              'MARCADOR',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: _counter > _counterb
                      ? Colors.green
                      : Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Equipo A',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: _counter > _counterb
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          '$_counter',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: _counter > _counterb
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: _decrementCounter,
                              child: const Text('-1'),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: _incrementCounter,
                              child: const Text('+1'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Card(
                  color: _counterb > _counter
                      ? Colors.green
                      : Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Equipo B',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: _counterb > _counter
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          '$_counterb',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: _counterb > _counter
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: _decrementCounterb,
                              child: const Text('-1'),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: _incrementCounterb,
                              child: const Text('+1'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            Text(
              _resultado(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton.icon(
              onPressed: _reiniciar,
              icon: const Icon(Icons.refresh),
              label: const Text('Reiniciar'),
            ),
          ],
        ),
      ),
    );
  }
}