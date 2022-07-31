
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:uuyuyuy/sreens/Home/Home.dart';

import '../Widget/app_scaffold.dart';



class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => AppScaffold(child: Home()),
          ),
          (route) => false);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset(
              "assets/logo.png",
              height: 150,
            ),
            SizedBox(
              height: 40,
            ),
            LoadingAnimationWidget.twistingDots(
              leftDotColor: Colors.red,
              rightDotColor: Colors.green,
              size: 60,
            ),
          ],
        ),
      ),
    );
  }
}
