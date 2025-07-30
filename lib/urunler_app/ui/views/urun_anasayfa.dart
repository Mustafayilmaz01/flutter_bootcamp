import 'package:calisma_yapisi/urunler_app/data/entity/urunler.dart';
import 'package:calisma_yapisi/urunler_app/ui/views/urun_detay_sayfa.dart';
import 'package:flutter/material.dart';

class UrunAnasayfa extends StatefulWidget {
  const UrunAnasayfa({super.key});

  @override
  State<UrunAnasayfa> createState() => _UrunAnasayfaState();
}

class _UrunAnasayfaState extends State<UrunAnasayfa> {
  Future<List<Urunler>> urunleriYukle() async {
    var urunlerListesi = <Urunler>[];
    var u1 = Urunler(id: 1, ad: "Rayban Club Master", fiyat: 2500, resim: "resimler/gozluk.png");
    var u2 = Urunler(id: 2, ad: "Sony ZX Series", fiyat: 40000, resim: "resimler/kulaklik.png");
    var u3 = Urunler(id: 3, ad: "Gio Armani", fiyat: 2000, resim: "resimler/parfum.png");
    var u4 = Urunler(id: 4, ad: "Macbook Pro 14", fiyat: 43000, resim: "resimler/bilgisayar.png");
    var u5 = Urunler(id: 5, ad: "Casio X Series", fiyat: 8000, resim: "resimler/saat.png");
    var u6 = Urunler(id: 6, ad: "Dyson V8", fiyat: 18000, resim: "resimler/supurge.png");
    var u7 = Urunler(id: 7, ad: "İphone 13", fiyat: 32000, resim: "resimler/telefon.png");

    urunlerListesi.add(u1);
    urunlerListesi.add(u2);
    urunlerListesi.add(u3);
    urunlerListesi.add(u4);
    urunlerListesi.add(u5);
    urunlerListesi.add(u6);
    urunlerListesi.add(u7);

    return urunlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(title: Text("Urunler")),
      body: FutureBuilder<List<Urunler>>(
        future: urunleriYukle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var urunlerListesi = snapshot.data!;
            return ListView.builder(
              itemCount: urunlerListesi.length,
              itemBuilder: (context, index) {
                var urun = urunlerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UrunDetaySayfa(urun: urun)));
                  },
                  child: Card(
                    color: Colors.pink[50],
                    child: Row(
                      children: [
                        SizedBox(width: 128, height: 128, child: Image.asset(urun.resim)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(urun.ad, style: TextStyle(fontSize: 14)),
                            Text(urun.fiyat.toString() + "₺", style: TextStyle(fontSize: 25)),
                            ElevatedButton(
                              onPressed: () {
                                print("${urun.ad} : Sepete Eklendi");
                              },
                              child: Text("Sepete Ekle"),
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
            return const Center();
          }
        },
      ),
    );
  }
}
