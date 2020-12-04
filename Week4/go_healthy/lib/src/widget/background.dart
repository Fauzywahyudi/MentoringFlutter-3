import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  final String title;

  const BackGround({@required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
