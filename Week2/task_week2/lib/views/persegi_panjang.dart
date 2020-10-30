import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_week2/views/hasil_bangun.dart';

class PersegiPanjang extends StatefulWidget {
  @override
  _PersegiPanjangState createState() => _PersegiPanjangState();
}

class _PersegiPanjangState extends State<PersegiPanjang> {
  TextEditingController controllerP = TextEditingController();

  TextEditingController controllerL = TextEditingController();

  String bangun = 'Persegi Panjang';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          TextField(
            controller: controllerP,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Panjang',
            ),
          ),
          TextField(
            controller: controllerL,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Lebar',
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
    if (controllerP.text.isEmpty || controllerL.text.isEmpty) {
      showToast('Nilai tidak boleh kosong');
    } else if (controllerP.text.contains(',') ||
        controllerL.text.contains(',')) {
      showToast('Mohon gunakan titik pengganti koma');
    } else {
      try {
        double p = double.parse(controllerP.text);
        double l = double.parse(controllerL.text);
        var luas = hitungLuas(p, l);
        var kel = hitungKeliling(p, l);
        String data = 'Panjang = $p,Lebar = $l';
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

  num hitungLuas(num p, num l) => p * l;

  num hitungKeliling(num p, num l) => 2 * (p + l);

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.red,
    );
  }
}
