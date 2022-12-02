import 'package:flutter/material.dart';

class RatingReview extends StatefulWidget {
  const RatingReview({super.key});

  @override
  State<RatingReview> createState() => _RatingReviewState();
}

class _RatingReviewState extends State<RatingReview> {
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
          'Rating & Review',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: SafeArea(child: Center(child: Container(
        child: Icon(Icons.star_outline,size: 100,
        color: Colors.grey,),
      ),))

    );
  }
}