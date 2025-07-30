import 'package:calisma_yapisi/getir_arayuz/data/entity/getir.dart';
import 'package:flutter/material.dart';

class GetirDetay extends StatefulWidget {
  GetirDetay({super.key, required this.sf});
  Getir sf;

  @override
  State<GetirDetay> createState() => _GetirDetayState();
}

class _GetirDetayState extends State<GetirDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.sf.kategori)),
      body: Center(
        child: Column(
          children: [
            Image.asset("resimler/${widget.sf.kresim}"),
            SizedBox(height: 50, width: 50),
            Text(widget.sf.kategori),
          ],
        ),
      ),
    );
  }
}
