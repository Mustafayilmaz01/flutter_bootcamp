import 'package:calisma_yapisi/bottom_nav_kullanimi/sayfa_bir.dart';
import 'package:calisma_yapisi/bottom_nav_kullanimi/sayfa_iki.dart';
import 'package:calisma_yapisi/bottom_nav_kullanimi/sayfa_uc.dart';
import 'package:flutter/material.dart';

class BottomNavSayfa extends StatefulWidget {
  const BottomNavSayfa({super.key});

  @override
  State<BottomNavSayfa> createState() => _BottomNavSayfaState();
}

class _BottomNavSayfaState extends State<BottomNavSayfa> {
  int secilenIndeks = 2;

  var sayfalar = [SayfaBir(), SayfaIki(), SayfaUc()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Bottom navigation Bar", style: TextStyle(color: Colors.black)),
      ),
      body: sayfalar[secilenIndeks],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one_outlined), label: "One"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two_outlined), label: "Two"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_3_outlined), label: "Three"),
        ],
        currentIndex: secilenIndeks,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black,
        onTap: (indeks) {
          setState(() {
            secilenIndeks = indeks;
          });
        },
      ),
    );
  }
}
