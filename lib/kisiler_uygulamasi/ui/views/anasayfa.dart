import 'package:calisma_yapisi/kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:calisma_yapisi/kisiler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:calisma_yapisi/kisiler_uygulamasi/ui/views/kayit_sayfa.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  Future<void> ara(String aramaKelimesi) async {
    print("Kişi Ara : $aramaKelimesi");
  }

  Future<List<Kisiler>> kisileriYukle() async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_ad: "Ahmet", kisi_id: 1, kisi_tel: "11");
    var k2 = Kisiler(kisi_ad: "Furkan", kisi_id: 2, kisi_tel: "121");

    var k3 = Kisiler(kisi_ad: "Zeynep", kisi_id: 3, kisi_tel: "1231");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    return kisilerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu
            ? TextField(
                decoration: InputDecoration(hintText: "Ara"),
                onChanged: (aramaSonuc) {
                  ara(aramaSonuc);
                },
              )
            : Text('Kisiler'),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                    });
                  },
                  icon: Icon(Icons.clear),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                  icon: Icon(Icons.search),
                ),
        ],
      ),
      body: FutureBuilder<List<Kisiler>>(
        future: kisileriYukle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var kisilerListesi = snapshot.data;
            return ListView.builder(
              itemCount: kisilerListesi!.length,
              itemBuilder: (context, index) {
                var kisi = kisilerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi))).then((
                      value,
                    ) {
                      print("Anasayfaya Dönüldü");
                    });
                  },
                  child: Card(
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(kisi.kisi_ad, style: TextStyle(fontSize: 20)),
                                Text(kisi.kisi_tel),
                              ],
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                aramaYapiliyorMu = true;
                              });
                            },
                            icon: Icon(Icons.clear),
                          ),
                        ],
                      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa())).then((value) {
            print("Anasayfaya Dönüldü");
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
