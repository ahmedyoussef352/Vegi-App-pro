import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuyuyuy/sreens/admin/admin_panel/admin_home.dart';

import '../../Home/Home.dart';
import '../../Widget/app_scaffold.dart';

class SplashAdmin extends StatefulWidget {
  const SplashAdmin({Key? key}) : super(key: key);

  @override
  _SplashAdminState createState() => _SplashAdminState();
}

class _SplashAdminState extends State<SplashAdmin> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2500 ), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => AppScaffold(child: AdminPanelHome()),
          ),
          (route) => false);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Image.asset(
            "assets/successfully.gif",
            height: 600,
            
          ),
        ),
      ),
    );
  }
}
