import 'package:flutter/material.dart';
import 'package:tasarim_calismasi/l10n/app_localizations.dart';
import 'package:tasarim_calismasi/renkler.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekrangenisligi = ekranBilgisi.size.width;
    print("Ekran yüksekligi: $ekranYuksekligi");
    print("Ekran genisliği: $ekrangenisligi");
    var d = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: anaRenk,
        title: Text(
          'Pizza',
          style: TextStyle(color: yaziRenk1, fontFamily: "Pacifico", fontSize: 22),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              d!.pizzaBaslik,
              style: TextStyle(fontSize: 36, color: anaRenk, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(padding: const EdgeInsets.only(top: 16.0), child: Image.asset("resimler/pizza_resim.png")),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(icerik: d!.peynirYazi),
                Chip(icerik: d!.sucukYazi),
                Chip(icerik: "Pepper"),
                Chip(icerik: "Olive"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "20 min",
                  style: TextStyle(fontSize: 22, color: yaziRenk2, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Delivery",
                    style: TextStyle(fontSize: 22, color: anaRenk, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Meat lover,get ready to meet your pizza !",
                  style: TextStyle(fontSize: 22, color: yaziRenk2, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  "\$ 5.98",
                  style: TextStyle(fontSize: 44, color: anaRenk, fontWeight: FontWeight.bold),
                ),
                Spacer(),

                TextButton(
                  onPressed: () {},
                  child: Text('Add to Chart', style: TextStyle(color: yaziRenk1, fontSize: 18)),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(5))),
                    backgroundColor: anaRenk,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Chip extends StatelessWidget {
  String icerik;
  Chip({required this.icerik});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(icerik, style: TextStyle(color: yaziRenk1)),
      style: TextButton.styleFrom(backgroundColor: anaRenk),
    );
  }
}
