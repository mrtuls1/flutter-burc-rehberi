import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/utils/strings.dart';

import 'models/burc.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();

    return Scaffold(
      appBar: AppBar(
        title: Text("Burc Rehberi"),
      ),
      body: ListeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];

    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() +
          "${i + 1}.png"; //Koc -> koc1.png
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      burclar.add(eklenecekBurc);
    }

    return burclar;
  }

  Widget ListeyiHazirla() {
    return ListView.builder(
      itemBuilder: (context, int index) {
        return TekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget TekSatirBurc(BuildContext context, int index) {
    Burc oanListeyeEklenenBurc = tumBurclar[index];

    return Card(
      elevation: 4,
      child: ListTile(
        onTap: ()=> Navigator.pushNamed(context, "/burcDetay/$index"),
        leading: Image.asset(
          "images/" + oanListeyeEklenenBurc.burcKucukResim,
          width: 64,
          height: 64,
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            oanListeyeEklenenBurc.burcAdi,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.pink.shade500),
          ),
        ),
        subtitle:Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            oanListeyeEklenenBurc.burcTarihi,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios,color: Colors.pink,),
      ),
    );
  }
}
