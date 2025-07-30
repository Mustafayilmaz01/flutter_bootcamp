import 'package:calisma_yapisi/filmler_app/data/entity/filmler.dart';
import 'package:calisma_yapisi/filmler_app/ui/views/film_detaysayfa.dart';

import 'package:flutter/material.dart';

class FilmAnasayfa extends StatefulWidget {
  const FilmAnasayfa({super.key});

  @override
  State<FilmAnasayfa> createState() => _FilmAnasayfaState();
}

class _FilmAnasayfaState extends State<FilmAnasayfa> {
  Future<List<Filmler>> filmyukle() async {
    var filmlistesi = <Filmler>[];

    var f1 = Filmler(id: 1, ad: "Django", fiyat: 24, resim: "django.png");
    var f2 = Filmler(id: 2, ad: "Interstellar", fiyat: 32, resim: "interstellar.png");
    var f3 = Filmler(id: 3, ad: "Inception", fiyat: 16, resim: "inception.png");
    var f4 = Filmler(id: 4, ad: "The Hateful Eight", fiyat: 28, resim: "thehatefuleight.png");
    var f5 = Filmler(id: 5, ad: "The Pianist", fiyat: 18, resim: "thepianist.png");
    var f6 = Filmler(id: 6, ad: "Anadoluda", fiyat: 10, resim: "anadoluda.png");

    filmlistesi.add(f1);
    filmlistesi.add(f2);
    filmlistesi.add(f3);
    filmlistesi.add(f4);
    filmlistesi.add(f5);
    filmlistesi.add(f6);
    return filmlistesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filmler")),
      body: FutureBuilder<List<Filmler>>(
        future: filmyukle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var fimlerListesi = snapshot.data;
            return GridView.builder(
              itemCount: fimlerListesi!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 1.8),
              itemBuilder: (context, indeks) {
                var film = fimlerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FilmDetaysayfa(fms2: film)));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset("resimler/${film.resim}"),
                        Row(
                          children: [
                            Text("${film.fiyat} ₺", style: TextStyle(fontSize: 24)),
                            ElevatedButton(
                              onPressed: () {
                                print("Sepet: ${film.ad}");
                              },
                              child: Text("Sepet"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
