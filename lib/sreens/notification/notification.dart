import 'package:flutter/material.dart';

class Noti extends StatefulWidget {
  const Noti({super.key});

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Color.fromARGB(255, 237, 204, 71),
        title: Text(
          'Notification',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: SafeArea(child: Center(child: Container(
        child: Icon(Icons.notifications_outlined,size: 100,
        color: Colors.grey,),
      ),))

    );
  }
}