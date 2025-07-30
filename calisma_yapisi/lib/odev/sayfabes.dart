import 'package:calisma_yapisi/odev/anasayfa.dart';
import 'package:flutter/material.dart';

class Sayfabes extends StatefulWidget {
  const Sayfabes({super.key});

  @override
  State<Sayfabes> createState() => _SayfabesState();
}

class _SayfabesState extends State<Sayfabes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sayfa 5"),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
          },
          icon: Icon(Icons.backspace),
        ),
      ),

      body: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Anasayfa()));
        },
        child: const Icon(Icons.next_week),
      ),
    );
  }
}
