import 'package:calisma_yapisi/filmler_app/data/entity/filmler.dart';
import 'package:flutter/material.dart';

class FilmDetaysayfa extends StatefulWidget {
  FilmDetaysayfa({super.key, required this.fms2});
  Filmler fms2;

  @override
  State<FilmDetaysayfa> createState() => _FilmDetaysayfaState();
}

class _FilmDetaysayfaState extends State<FilmDetaysayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.fms2.ad}")),
      body: Center(
        child: Column(
          children: [
            Image.asset("resimler/${widget.fms2.resim}"),
            SizedBox(height: 50, width: 50),
            Text("${widget.fms2.fiyat} ₺", style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
