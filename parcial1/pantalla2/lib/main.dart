import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kFondo = Colors.white;
const kTexto = Colors.black;
const kGrisClaro = Color(0xFFF3F3F3);
const kGrisIcono = Color(0xFF9E9E9E);
const kBorde = Color(0xFFE0E0E0);
const kVerdeTarjeta = Color(0xFFC8F54E);
const kNegroTarjeta = Colors.black87;
const kOscuroTarjeta = Color(0xFF2A3222);

const kTituloSeccion = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add Money',
      theme: ThemeData(scaffoldBackgroundColor: kFondo),
      home: const AddMoneyScreen(),
    );
  }
}

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kFondo,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: kBorde),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: kTexto),
              onPressed: () {},
            ),
          ),
        ),
        title: const Text('Add money', style: TextStyle(color: kTexto)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Select card', style: kTituloSeccion),
          const SizedBox(height: 12),

          SizedBox(
            height: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                creditCard('Debit card', '4568', kVerdeTarjeta, textColor: kTexto, selected: true),
                creditCard('Credit card', '2478', kNegroTarjeta, textColor: Colors.white, showVisa: true),
                creditCard('Bank card', '1234', kOscuroTarjeta, textColor: Colors.white),
              ],
            ),
          ),

          const SizedBox(height: 28),
          const Text('Add money to Neobank', style: kTituloSeccion),
          const SizedBox(height: 8),

          menuListTile(Icons.savings, 'Move your direct deposit'),
          menuListTile(Icons.swap_horiz, 'Transfer from other banks'),
          menuListTile(Icons.apple, 'Apple Pay'),
          menuListTile(Icons.credit_card, 'Debit / Credit Card'),
        ],
      ),
    );
  }
}

Widget creditCard(
  String label,
  String number,
  Color bgColor, {
  required Color textColor,
  bool selected = false,
  bool showVisa = false,
}) {
  return Container(
    width: 140,
    margin: const EdgeInsets.only(right: 12),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(18),
      border: selected ? Border.all(color: kTexto, width: 3) : null,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.circle, color: textColor, size: 16),
            if (showVisa)
              Text('VISA', style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 12)),
          ],
        ),
        const Spacer(),
        Text(label, style: TextStyle(color: textColor, fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          '•••• $number',
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

Widget menuListTile(IconData icon, String title) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      color: kGrisClaro,
      borderRadius: BorderRadius.circular(16),
    ),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(icon, color: kGrisIcono, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right, color: kGrisIcono),
    ),
  );
}