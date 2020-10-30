import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HasilBagun extends StatelessWidget {
  final String bangun;
  final num luas;
  final num keliling;
  final String data;

  HasilBagun({Key key, this.bangun, this.luas, this.keliling, this.data})
      : super(key: key);

  String _images() {
    if (bangun == 'Persegi Panjang')
      return 'persegi.png';
    else if (bangun == 'Segitiga')
      return 'segitiga.png';
    else if (bangun == 'Lingkaran')
      return 'lingkaran.png';
    else
      return 'persegi.png';
  }

  final f = new NumberFormat("###.0#", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil $bangun'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Image.asset('assets/images/${_images()}'),
            SizedBox(height: 30),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${data.replaceAll(',', '\n\n')}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Luas = ${f.format(luas).toString()}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Keliling = ${f.format(keliling).toString()}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
