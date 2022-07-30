import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/reviewcartmodel.dart';

class OrderItem extends StatefulWidget {
  //  final ReviewCartModel e;
  // const OrderItem({Key? key}) : super(key: key);

  final ReviewCartModel e;
  OrderItem({required this.e});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(widget.e.cartImage,
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
           widget.e.cartName,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            widget.e.cartUnit,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            widget.e.cartPrice.toString(),
            
          ),
        ],
      ),
      subtitle: Text(widget.e.cartQuantity.toString()),
    );
  }
}
