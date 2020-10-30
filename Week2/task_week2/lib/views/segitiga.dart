import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_week2/views/hasil_bangun.dart';

class Segitiga extends StatefulWidget {
  @override
  _SegitigaState createState() => _SegitigaState();
}

class _SegitigaState extends State<Segitiga> {
  TextEditingController controllerA = TextEditingController();

  TextEditingController controllerB = TextEditingController();
  TextEditingController controllerC = TextEditingController();
  TextEditingController controllerT = TextEditingController();

  String bangun = 'Segitiga';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          TextField(
            controller: controllerA,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Sisi A',
            ),
          ),
          TextField(
            controller: controllerB,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Sisi B',
            ),
          ),
          TextField(
            controller: controllerC,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Sisi C',
            ),
          ),
          TextField(
            controller: controllerT,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Tinggi',
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
    if (controllerA.text.isEmpty ||
        controllerB.text.isEmpty ||
        controllerC.text.isEmpty ||
        controllerT.text.isEmpty) {
      showToast('Nilai tidak boleh kosong');
    } else if (controllerA.text.contains(',') ||
        controllerB.text.contains(',') ||
        controllerC.text.contains(',') ||
        controllerT.text.contains(',')) {
      showToast('Mohon gunakan titik pengganti koma');
    } else {
      try {
        double a = double.parse(controllerA.text);
        double b = double.parse(controllerB.text);
        double c = double.parse(controllerC.text);
        double t = double.parse(controllerT.text);
        var luas = hitungLuas(a, t);
        var kel = hitungKeliling(a, b, c);
        String data = 'Sisi A = $a,Sisi B = $b,Sisi C = $c,Tinggi = $t';
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
        print(e);
        showToast('Perhatikan Format Angka');
      }
    }
  }

  num hitungLuas(num a, num t) => 1 / 2 * (a * t);

  num hitungKeliling(num a, num b, num c) => a + b + c;

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.red,
    );
  }
}
