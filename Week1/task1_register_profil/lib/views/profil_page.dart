import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.edit),
      ),
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: TextField(
                  textAlign: TextAlign.center,
                ),
              ),
              _textField('Username'),
              _textField('Email'),
              _checkList('Available to mentor'),
              _checkList('Needs mentoring'),
              _textField('Bio'),
              _textField('Slack username'),
              _textField('Location'),
              _textField('Occupation'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: TextField(
          decoration: InputDecoration(
        labelText: label,
      )),
    );
  }

  Widget _checkList(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: CheckboxListTile(
        value: true,
        activeColor: Colors.lightBlue,
        onChanged: (v) {},
        title: Text(title),
      ),
    );
  }
}
