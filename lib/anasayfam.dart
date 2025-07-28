import 'package:flutter/material.dart';

class Anasayfam extends StatefulWidget {
  const Anasayfam({super.key});

  @override
  State<Anasayfam> createState() => _AnasayfamState();
}

class _AnasayfamState extends State<Anasayfam> {
  var tfController = TextEditingController();
  String alinanVeri = '';
  String resimAdi = "kofte.png";
  bool switchKontrol = false;
  bool checkBoxKontrol = false;
  int radioDeger = 0;
  bool progressKontrol = false;
  double ilerleme = 30.00;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widgets")),
      body: Center(
        child: Column(
          children: [
            Text(alinanVeri),
            TextField(
              controller: tfController,
              decoration: InputDecoration(hintText: "Veri giriniz"),
              keyboardType: TextInputType.number,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  alinanVeri = tfController.text;
                });
              },
              child: Text("Veriyi al "),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      resimAdi = "baklava.png";
                    });
                  },
                  child: Text("Resim1"),
                ),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/$resimAdi"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      resimAdi = "kofte.png";
                    });
                  },
                  child: Text("Resim2 "),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 200,
                  child: SwitchListTile(
                    title: Text('Dart'),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: switchKontrol,
                    onChanged: (veri) {
                      setState(() {
                        switchKontrol = veri;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: CheckboxListTile(
                    title: Text('Flutter'),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: checkBoxKontrol,
                    onChanged: (veri) {
                      setState(() {
                        checkBoxKontrol = veri!;
                      });
                    },
                  ),
                ),
              ],
            ),
            /*Row(
              children: [
                SizedBox(
                  width: 200,
                  child: RadioListTile(
                    title: Text('Real Madrid'),

                    value: 2,
                    groupValue: radioDeger,
                    onChanged: (veri) {
                      setState(() {});
                      radioDeger = veri!;
                    },
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: RadioListTile(
                    title: Text('Barcelona'),
                    value: 1,
                    groupValue: radioDeger,
                    onChanged: (veri) {
                      setState(() {});
                      radioDeger = veri!;
                    },
                  ),
                ),
              ],
            ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      progressKontrol = true;
                    });
                  },
                  child: Text("Basla"),
                ),
                SizedBox(width: 48, height: 48),
                Visibility(visible: progressKontrol, child: CircularProgressIndicator()),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      progressKontrol = false;
                    });
                  },
                  child: Text('Dur'),
                ),
              ],
            ),
            Text(ilerleme.toInt().toString()),
            Slider(
              max: 100.0,
              min: 0.0,
              value: ilerleme,
              onChanged: (veri) {
                setState(() {
                  ilerleme = veri;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: tfSaat,
                    decoration: InputDecoration(hintText: "Saat"),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now())).then((value) {
                      tfSaat.text = "${value!.hour}: ${value.minute} ";
                    });
                  },
                  icon: Icon(Icons.access_time),
                ),
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: tfTarih,
                    decoration: InputDecoration(hintText: "Tarih"),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                    );
                  },
                  icon: Icon(Icons.date_range),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                print("Switch Kontrol $switchKontrol");
                print("Checkbox Kontrol $checkBoxKontrol");
                print("RadioContro: $radioDeger");
                print("Slider durum: $ilerleme");
              },
              child: Text("Göster"),
            ),
          ],
        ),
      ),
    );
  }
}
