import 'package:calisma_yapisi/getir_arayuz/data/entity/getir.dart';
import 'package:calisma_yapisi/getir_arayuz/ui/views/getir_detay.dart';
import 'package:flutter/material.dart';

class GetirAnasayfa extends StatefulWidget {
  const GetirAnasayfa({super.key});

  @override
  State<GetirAnasayfa> createState() => _GetirAnasayfaState();
}

class _GetirAnasayfaState extends State<GetirAnasayfa> {
  var adress = TextEditingController();

  Future<List<Getir>> getiryukle() async {
    var getirList = <Getir>[
      Getir(kategori: "İndirim", kresim: "indirim.png"),
      Getir(kategori: "Yeni Ürünler", kresim: "yeni.png"),
      Getir(kategori: "Su & İçeçek", kresim: "su.png"),
      Getir(kategori: "Fırından", kresim: "simit.png"),
      Getir(kategori: "Temel Gıda", kresim: "temel.png"),
      Getir(kategori: "Atıştırmalık", kresim: "cips.png"),
      Getir(kategori: "Meyve & Sebze", kresim: "dondurma.png"),
      Getir(kategori: "Meyve & Sebze", kresim: "sut.png"),
      Getir(kategori: "Meyve & Sebze", kresim: "yumurta.png"),
      Getir(kategori: "Meyve & Sebze", kresim: "yiyecek.png"),
      Getir(kategori: "Meyve & Sebze", kresim: "fit.png"),
      Getir(kategori: "Meyve & Sebze", kresim: "sebze.png"),
    ];

    return getirList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Ara"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
        ],
      ),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "getir",
          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.orange),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: adress,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(icon: Icon(Icons.home), hintText: "Ev: Begonya Sk. No: 24 Ataşehir "),
            ),
          ),
          Image.asset("resimler/getir.png"),
          Expanded(
            child: FutureBuilder<List<Getir>>(
              future: getiryukle(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Hata: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  var getirList = snapshot.data!;
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.8, // Görsel uyumu sağlar
                    ),
                    itemCount: getirList.length,
                    itemBuilder: (context, indeks) {
                      var getir = getirList[indeks];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GetirDetay(sf: getir)));
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("resimler/${getir.kresim}", height: 50),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  getir.kategori,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("Veri bulunamadı."));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
