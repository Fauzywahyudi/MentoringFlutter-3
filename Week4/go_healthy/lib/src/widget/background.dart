import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  final String title;
  final String subTitle;
  final double height;

  const BackGround(
      {@required this.title, this.subTitle = '', this.height = 200});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Text(
                  subTitle,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
