import 'package:flutter/material.dart';

class KullaniciEtkilesimiSayfa extends StatefulWidget {
  const KullaniciEtkilesimiSayfa({super.key});

  @override
  State<KullaniciEtkilesimiSayfa> createState() => _KullaniciEtkilesimiSayfaState();
}

class _KullaniciEtkilesimiSayfaState extends State<KullaniciEtkilesimiSayfa> {
  var tfControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kullanıcı Etkileşimi")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Silmek ister misiniz"),
                    action: SnackBarAction(
                      label: "Evet",
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Silindi")));
                      },
                    ),
                  ),
                );
              },
              child: Text("Snackbar"),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Silmek ister misiniz"),
                    action: SnackBarAction(
                      label: "Evet",
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Silindi")));
                      },
                    ),
                  ),
                );
              },
              child: Text("Snackbar Özel"),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Başlık"),
                      content: TextField(
                        controller: tfControl,
                        decoration: InputDecoration(hintText: "Veri"),
                      ),
                      backgroundColor: Colors.grey,
                      actions: [
                        TextButton(
                          onPressed: () {
                            print("İptal secildi");
                            Navigator.of(context).pop();
                          },
                          child: Text("İptal"),
                        ),
                        TextButton(
                          onPressed: () {
                            print("Kaydedilern veri ${tfControl.text}");
                            Navigator.of(context).pop();
                          },
                          child: Text("Tamam"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Alert"),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Alert (Özel)")),
          ],
        ),
      ),
    );
  }
}
