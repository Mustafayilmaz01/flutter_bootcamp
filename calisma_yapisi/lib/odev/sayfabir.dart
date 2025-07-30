import 'package:calisma_yapisi/odev/sayfaiki.dart';
import 'package:flutter/material.dart';

class Sayfabir extends StatefulWidget {
  const Sayfabir({super.key});

  @override
  State<Sayfabir> createState() => _SayfabirState();
}

class _SayfabirState extends State<Sayfabir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SayfaBir', style: TextStyle(color: Colors.black)),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Sayfaiki()));
        },
        child: Icon(Icons.next_plan_sharp),
      ),
    );
  }
}
