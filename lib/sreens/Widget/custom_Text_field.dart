// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';

class CostomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labText;
  final TextInputType? keyboardType;
   // ignore: use_key_in_widget_constructors
   const CostomTextField({required  this.controller,
  required this.labText,
   this.keyboardType}) ;

  @override
  State<CostomTextField> createState() => _CostomTextFieldState();
}

class _CostomTextFieldState extends State<CostomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: InputDecoration(hintText: widget.labText),
    );
  }
}