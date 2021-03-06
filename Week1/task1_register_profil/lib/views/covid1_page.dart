import 'package:flutter/material.dart';

class Covid1Page extends StatefulWidget {
  @override
  _Covid1PageState createState() => _Covid1PageState();
}

class _Covid1PageState extends State<Covid1Page> {
  var _borderDecor = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 3),
  );
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'COVID 19 NEWS',
                style: TextStyle(color: Colors.red[800], fontSize: 20),
              ),
              SizedBox(height: 125),
              Container(
                child: Column(
                  children: [
                    _info('All Cases', 272691, Colors.black),
                    _info('All Death', 11310, Colors.red),
                    _info('All Recovered', 90618, Colors.green),
                    _info('All Active Cases', 170763, Colors.orange),
                  ],
                ),
              ),
              SizedBox(height: 125),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Input a Country',
                        border: _borderDecor,
                        enabledBorder: _borderDecor,
                        focusedBorder: _borderDecor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                            color: Colors.red[300],
                            child: Text(
                              'Search',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: RaisedButton(
                            color: Colors.red[900],
                            child: Text(
                              'All Information',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                            color: Colors.red[900],
                            onPressed: () {},
                            child: Text(
                              'Updates of Sri Lanka',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'IMPORTANT',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                    Text(
                      'Search "South Korea" as "Korea"',
                      style: TextStyle(
                        fontSize: 18,
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

  Padding _info(String title, int value, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$title : $value',
        style: TextStyle(fontSize: 25, color: color),
      ),
    );
  }
}
