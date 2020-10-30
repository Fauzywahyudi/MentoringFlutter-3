import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:task_week2/views/hasil_umur.dart';

class HitungUmur extends StatefulWidget {
  static const routeName = '/hitungUmur';
  @override
  _HitungUmurState createState() => _HitungUmurState();
}

class _HitungUmurState extends State<HitungUmur> {
  final format = DateFormat("yyyy-MM-dd");
  TextEditingController _tecTglLahir = TextEditingController();
  TextEditingController _tecNama = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Umur'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  controller: _tecNama,
                  decoration: InputDecoration(
                    hintText: 'Nama Anda',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person, color: Colors.black38),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: DateTimeField(
                  controller: _tecTglLahir,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    hintText: 'Tanggal Lahir',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.date_range, color: Colors.black38),
                  ),
                  format: format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: onHitung,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Hitung',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        color: Colors.blue[200],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onHitung() {
    String nama = _tecNama.text;
    String lahir = _tecTglLahir.text;
    if (validasi(nama) && validasi(lahir)) {
      DateTime now = DateTime.now();
      String tglLahir = _tecTglLahir.text;
      DateTime dateLahir = DateTime.parse(tglLahir);
      print(now.toString() + '-' + dateLahir.toString());
      if ('${now.year}-${now.month}-${now.day}' == tglLahir) {
        showToast('Tanggal lahir tidak boleh hari ini');
      } else {
        DateTime umur = DateTime(now.year - dateLahir.year,
            now.month - dateLahir.month, now.day - dateLahir.day);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HasilUmur(
                      umur: umur,
                      nama: nama,
                    ),
                fullscreenDialog: true));
      }
    } else {
      showToast('Harap isi semua data');
    }
  }

  bool validasi(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.red,
    );
  }
}
