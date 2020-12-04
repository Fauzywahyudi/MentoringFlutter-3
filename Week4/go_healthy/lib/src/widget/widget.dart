import 'package:go_healthy/src/theme/decoration.dart';
import 'package:flutter/material.dart';

class InfoCash extends StatelessWidget {
  const InfoCash({
    @required this.size,
    @required this.onPressed,
    this.uang,
  });

  final Size size;
  final VoidCallback onPressed;
  final String uang;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      height: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Cash', style: textTitle),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(uang, style: textValue),
                    ],
                  )
                ],
              ),
              FloatingActionButton(
                onPressed: onPressed,
                child: Icon(Icons.add),
                mini: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
