import 'package:calisma_yapisi/kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  Kisiler kisi;

  DetaySayfa({required this.kisi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  Future<void> guncelle(int kisi_id, String kisi_ad, String kisi_tel) async {
    print("Kisi Guncelle:$kisi_id $kisi_ad - $kisi_tel");
  }

  @override
  void initState() {
    // TODO: implement initState

    var kisi = widget.kisi;
    tfKisiAdi.text = kisi.kisi_ad;
    tfKisiTel.text = kisi.kisi_tel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detay Sayfa")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfKisiAdi,
                decoration: InputDecoration(hintText: "Kisi Adi"),
              ),
              TextField(
                controller: tfKisiTel,

                decoration: InputDecoration(hintText: "Telefon No"),
              ),
              ElevatedButton(
                onPressed: () {
                  guncelle(widget.kisi.kisi_id, tfKisiAdi.text, tfKisiTel.text);
                },
                child: Text("Guncelle"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
