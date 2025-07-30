import 'package:calisma_yapisi/odev/sayfabes.dart';
import 'package:flutter/material.dart';

class Sayfaiki extends StatefulWidget {
  const Sayfaiki({super.key});

  @override
  State<Sayfaiki> createState() => _SayfaikiState();
}

class _SayfaikiState extends State<Sayfaiki> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sayfa İki", style: TextStyle(color: Colors.black)),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Sayfabes()));
        },
        child: Icon(Icons.backpack),
      ),
    );
  }
}
