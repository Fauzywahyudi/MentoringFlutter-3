import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_week2/views/hasil_bangun.dart';

class Lingkaran extends StatefulWidget {
  @override
  _LingkaranState createState() => _LingkaranState();
}

class _LingkaranState extends State<Lingkaran> {
  TextEditingController controllerR = TextEditingController();

  String bangun = 'Lingkaran';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          TextField(
            controller: controllerR,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Jari-jari',
            ),
          ),
          SizedBox(height: 30),
          MaterialButton(
            onPressed: () => onHitung(),
            child: Text('Hitung'),
            color: Colors.blue[300],
          )
        ],
      ),
    );
  }

  void onHitung() {
    if (controllerR.text.isEmpty) {
      showToast('Nilai tidak boleh kosong');
    } else if (controllerR.text.contains(',')) {
      showToast('Mohon gunakan titik pengganti koma');
    } else {
      try {
        double r = double.parse(controllerR.text);
        double pi = 3.14;
        var luas = hitungLuas(r, pi);
        var kel = hitungKeliling(r, pi);
        String data = 'Jari-jari = $r';
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HasilBagun(
              bangun: bangun,
              luas: luas,
              keliling: kel,
              data: data,
            ),
          ),
        );
      } catch (e) {
        showToast('Perhatikan Format Angka');
      }
    }
  }

  num hitungLuas(num r, num pi) => pi * r * r;

  num hitungKeliling(num r, num pi) => 2 * pi * r;

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.red,
    );
  }
}
