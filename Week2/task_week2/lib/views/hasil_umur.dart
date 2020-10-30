import 'package:flutter/material.dart';

class HasilUmur extends StatelessWidget {
  final DateTime umur;
  final String nama;

  const HasilUmur({Key key, this.umur, this.nama}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Umur'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Center(
                child: Text(
                  nama,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Umur anda sekarang',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: '',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${umur.year < 0 ? 0 : umur.year} ',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'tahun ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${umur.month == 12 ? 0 : umur.month} ',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'bulan ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${umur.day} ',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'hari',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Anda adalah seorang \n${keterangan(umur)}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ),
      ),
    );
  }

  String keterangan(DateTime umur) {
    if (umur.year <= 2) {
      return 'Bayi';
    } else if (umur.year > 2 && umur.year <= 10) {
      return 'Anak-anak';
    } else if (umur.year > 10 && umur.year <= 17) {
      return 'Remaja';
    } else if (umur.year > 17 && umur.year <= 59) {
      return 'Dewasa';
    } else if (umur.year > 59) {
      return 'Lanjut Usia';
    } else {
      return '';
    }
  }
}
