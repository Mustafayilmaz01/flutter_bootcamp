import 'package:flutter/material.dart';

class Hesapmakinesi extends StatefulWidget {
  const Hesapmakinesi({super.key});

  @override
  State<Hesapmakinesi> createState() => _HesapmakinesiState();
}

class _HesapmakinesiState extends State<Hesapmakinesi> {
  String ekranYazisi = '';
  int toplam = 0;
  String geciciSayi = '';

  void rakamEkle(String rakam) {
    setState(() {
      ekranYazisi += rakam;
      geciciSayi += rakam;
    });
  }

  void artiEkle() {
    if (geciciSayi.isNotEmpty) {
      setState(() {
        toplam += int.parse(geciciSayi);
        ekranYazisi += ' + ';
        geciciSayi = '';
      });
    }
  }

  void esitlikHesapla() {
    if (geciciSayi.isNotEmpty) {
      setState(() {
        toplam += int.parse(geciciSayi);
        ekranYazisi = 'Sonuç: $toplam';
        geciciSayi = '';
        toplam = 0;
      });
    }
  }

  void temizle() {
    setState(() {
      ekranYazisi = '';
      toplam = 0;
      geciciSayi = '';
    });
  }

  Widget hesapButon(String yazi, VoidCallback tiklandiginda) {
    return ElevatedButton(
      onPressed: tiklandiginda,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[850],
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(22),
      ),
      child: Text(yazi, style: const TextStyle(fontSize: 22)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(title: const Text("Toplama Makinesi"), backgroundColor: Colors.black),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(ekranYazisi, style: const TextStyle(fontSize: 30, color: Colors.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (var i = 1; i <= 9; i++) hesapButon('$i', () => rakamEkle('$i')),
                hesapButon('0', () => rakamEkle('0')),
                hesapButon('+', artiEkle),
                hesapButon('=', esitlikHesapla),
                hesapButon('C', temizle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
