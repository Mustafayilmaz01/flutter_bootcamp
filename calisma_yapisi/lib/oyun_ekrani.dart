import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/sonuc_ekrani.dart';
import 'package:flutter/material.dart';

class OyunEkrani extends StatefulWidget {
  Kisiler kisi;

  OyunEkrani({required this.kisi});

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  Future<bool> geriDonusTusu(BuildContext context) async {
    print("Navigation geri tusu secildi");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oyun Ekrani'),
        leading: IconButton(
          onPressed: () {
            print("Appar Geri tuşu seçildi");
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: WillPopScope(
        onWillPop: () => geriDonusTusu(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${widget.kisi.ad} - ${widget.kisi.yas} -  ${widget.kisi.boy}  -${widget.kisi.bekar}"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SonucEkrani()));
                },
                child: Text("Sonuc Ekranına git"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
