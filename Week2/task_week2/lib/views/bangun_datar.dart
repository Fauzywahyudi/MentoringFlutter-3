import 'package:flutter/material.dart';
import 'package:task_week2/views/lingkaran.dart';
import 'package:task_week2/views/persegi_panjang.dart';
import 'package:task_week2/views/segitiga.dart';

class BangunDatar extends StatefulWidget {
  static const routeName = '/bangunDatar';
  @override
  _BangunDatarState createState() => _BangunDatarState();
}

class _BangunDatarState extends State<BangunDatar> {
  String _selectedBangun = 'Persegi Panjang';
  List _bangun = ['Persegi Panjang', 'Segitiga', 'Lingkaran'];

  String _images() {
    if (_selectedBangun == 'Persegi Panjang')
      return 'persegi.png';
    else if (_selectedBangun == 'Segitiga')
      return 'segitiga.png';
    else if (_selectedBangun == 'Lingkaran')
      return 'lingkaran.png';
    else
      return 'persegi.png';
  }

  Widget formInput() {
    switch (_selectedBangun) {
      case 'Persegi Panjang':
        return PersegiPanjang();
        break;
      case 'Segitiga':
        return Segitiga();
        break;
      case 'Lingkaran':
        return Lingkaran();
        break;
      default:
        return PersegiPanjang();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedBangun),
      ),
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Image.asset('assets/images/${_images()}'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Jenis Bangun Datar'),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text("Select Your Friends"),
                        value: _selectedBangun,
                        items: _bangun.map((value) {
                          return DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedBangun = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              formInput(),
            ],
          ),
        ),
      ),
    );
  }
}
