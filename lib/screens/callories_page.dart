import 'package:flutter/material.dart';

class CalPage extends StatelessWidget {
  const CalPage({super.key});
  static TextStyle styleTxt = const TextStyle(color: Colors.white, fontSize: 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Callories today:', style: styleTxt),
            Text('80kJ', style: styleTxt),
            const SizedBox(height: 20),
            Text('Callories This month:', style: styleTxt),
            Text('90kJ', style: styleTxt),
          ],
        ),
      ),
    );
  }
}
