import 'package:calisma_yapisi/anasayfa.dart';
import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  const SonucEkrani({super.key});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sonuc Ekrani')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Geri dön"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
              },
              child: Text("Ana ekrana dön"),
            ),
          ],
        ),
      ),
    );
  }
}
