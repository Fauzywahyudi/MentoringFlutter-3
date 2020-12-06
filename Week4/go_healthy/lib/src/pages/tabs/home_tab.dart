import 'package:flutter/material.dart';
import 'package:go_healthy/src/config/router.gr.dart';
import 'package:go_healthy/src/theme/decoration.dart';
import 'package:go_healthy/src/widget/background.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.grey[200],
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              BackGround(
                title: 'Home',
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () =>
                            Router.navigator.pushNamed(Router.homePageBMI),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: borRad30,
                          ),
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                decoration: circleContainer.copyWith(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/icon_bmi.png'),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: borRad30,
                                    color: Colors.red[100]),
                                child: Text(
                                  'Kalkulator BMI',
                                  style: textMenu.copyWith(color: Colors.red),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: borRad30,
                          ),
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                decoration: circleContainer.copyWith(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/icon_kesehatan.png'),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: borRad30,
                                    color: Colors.red[100]),
                                child: Text(
                                  'Istilah',
                                  style: textMenu.copyWith(color: Colors.red),
                                ),
                              )
                            ],
                          ),
                        ),
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
}
