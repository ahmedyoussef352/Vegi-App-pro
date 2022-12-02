import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FaQs extends StatelessWidget {
  const FaQs({super.key});

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
          'FAQs',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: SafeArea(child: Center(child: Container(
        child: Icon(Icons.format_quote_outlined,size: 100,
        color: Colors.grey,),
      ),))

    );
  }
}