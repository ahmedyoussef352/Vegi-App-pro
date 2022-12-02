import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuyuyuy/sreens/admin/splash/splash_admin.dart';

import '../../Widget/app_scaffold.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({Key? key}) : super(key: key);
  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  TextEditingController username = TextEditingController();
  TextEditingController passsword = TextEditingController();
  var formstate = GlobalKey<FormState>();
  bool acess() {
    if (username.text == 'ay3220187' && passsword.text == '135791125515802') {
      return true;
    } else {
      return false;
    }
  }

  Object flutterError() {
    return Fluttertoast.showToast(
        msg: "you are not Admin",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  bool send() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: formstate,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                width: 450,
                height: 450,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://cdn.dribbble.com/users/104270/screenshots/2047079/fierce-logo-digital-dribbble.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(500),
                ),
              ),
              Container(
                width: 350,
                child: TextFormField(
                  controller: username,
                  onChanged: (text) {
                    print(text);
                  },
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Please enter the username';
                    } else if (text.length <= 4) {
                      return 'your username is very small';
                    } else if (text.length > 10) {
                      return 'your username is very long > 10';
                    } else {
                      return null;
                    }
                  },
                  cursorColor: Colors.orange,
                  cursorWidth: 2,
                  cursorHeight: 7,
                  enabled: true,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.orange,
                        width: 2,
                      )),
                      prefixIcon: Icon(
                        Icons.person_outline_outlined,
                        color: Colors.orange,
                        size: 30,
                      ),
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                child: TextFormField(
                  controller: passsword,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  onChanged: (text) {
                    print(text);
                  },
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Please enter your Password';
                    } else if (text.length <= 8) {
                      return 'the Password is very small';
                    } else if (text.length > 16) {
                      return 'the Password is very long';
                    } else {
                      return null;
                    }
                  },
                  cursorColor: Colors.orange,
                  cursorWidth: 2,
                  cursorHeight: 7,
                  enabled: true,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange,
                    fontStyle: FontStyle.normal,
                  ),
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.orange,
                        width: 2,
                      )),
                      prefixIcon: Icon(
                        Icons.https_outlined,
                        color: Colors.orange,
                        size: 30,
                      ),
                      hintText: 'Passwrod',
                      hintStyle: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                    // splashColor: Colors.black,
                    // color: Colors.orange,
                    onPressed: () {
                      if (send()) {
                        if (acess()) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return AppScaffold(child: SplashAdmin());
                          }));
                        } else {
                          flutterError();
                        }
                      }
                    },
                    child: Expanded(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
