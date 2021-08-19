import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'models/burc.dart';

class BurcDetayi extends StatefulWidget {
  int gelenIdex;

  BurcDetayi(this.gelenIdex);

  @override
  _BurcDetayiState createState() => _BurcDetayiState();
}

class _BurcDetayiState extends State<BurcDetayi> {
  Burc secilenBurc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.gelenIdex];
  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      primary: true,
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(secilenBurc.burcAdi + " Burcu ve Özellikleri"),
              centerTitle: true,
              background: Image.asset(
                "images/" + secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  secilenBurc.burcDetay,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
