import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/oyun_ekrani.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int sayac = 0;
  bool kontrol = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Anasayfa')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sonuc: $sayac"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  sayac = sayac + 1;
                });
              },
              child: Text("Tıkla"),
            ),
            ElevatedButton(
              onPressed: () {
                var kisi = Kisiler(ad: "Ali", yas: 22, boy: 175.00, bekar: true);

                Navigator.push(context, MaterialPageRoute(builder: (context) => OyunEkrani(kisi: kisi)));
              },
              child: Text("Oyun ekranına git"),
            ),
            Text("Merhaba"),
            Visibility(child: Text("Merhaba"), visible: kontrol),
            Text(kontrol ? "Merhaba" : "Gule gule"),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  kontrol = true;
                });
              },
              child: Text("Durum 1: (true)"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  kontrol = false;
                });
              },
              child: Text("Durum 2: (false)"),
            ),
          ],
        ),
      ),
    );
  }
}
