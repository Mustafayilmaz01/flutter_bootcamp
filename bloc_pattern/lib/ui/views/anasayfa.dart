import 'package:bloc_pattern/ui/cubit/anasayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfsayi1 = TextEditingController();
  var tfsayi2 = TextEditingController();
  int sonuc = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bloc Kullanimi")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<AnasayfaCubit, int>(
                builder: (context, sonuc) {
                  return Text(sonuc.toString(), style: TextStyle(fontSize: 30));
                },
              ),

              TextField(
                controller: tfsayi1,
                decoration: InputDecoration(hintText: "sayi girin"),
              ),
              TextField(
                controller: tfsayi2,
                decoration: InputDecoration(hintText: "sayi girin"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<AnasayfaCubit>().toplamaYap(tfsayi1.text, tfsayi2.text);
                    },
                    child: Text("TOPLA"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AnasayfaCubit>().carpmaYap(tfsayi1.text, tfsayi2.text);
                    },
                    child: Text("CARP"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
