import 'package:calisma_yapisi/urunler_app/data/entity/urunler.dart';
import 'package:flutter/material.dart';

class UrunDetaySayfa extends StatefulWidget {
  Urunler urun;

  UrunDetaySayfa({required this.urun});

  @override
  State<UrunDetaySayfa> createState() => _UrunDetaySayfaState();
}

class _UrunDetaySayfaState extends State<UrunDetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.urun.ad)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("${widget.urun.resim}"),
            Text("${widget.urun.fiyat} ₺", style: TextStyle(fontSize: 50)),
          ],
        ),
      ),
    );
  }
}
