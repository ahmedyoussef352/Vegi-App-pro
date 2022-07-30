import 'package:flutter/material.dart';

class ProductUnit extends StatefulWidget {
  final Function onTap;
  final String title;
  const ProductUnit({
    required this.onTap,
    required this.title,
  });

  @override
  State<ProductUnit> createState() => _ProductUnitState();
}

class _ProductUnitState extends State<ProductUnit> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(widget.onTap());
      },
      child: Container(
        padding: const EdgeInsets.only(left: 1),
        
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: Text(
              widget.title,
              style: TextStyle(fontSize: 13),
            ),
                )),
            Center(
              child: Icon(
                Icons.arrow_drop_down,
                size: 20,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
