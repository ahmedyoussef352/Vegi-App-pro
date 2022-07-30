import 'package:flutter/material.dart';

class SingleDeliveryItem extends StatefulWidget {
  final String title;
  final String addressType;
  final String address;
  final String number;
  const SingleDeliveryItem({
    required this.number, 
    required this.addressType,
    required this.title,
    required this.address, 
   });

  @override
  State<SingleDeliveryItem> createState() => _SingleDeliveryItemState();
}

class _SingleDeliveryItemState extends State<SingleDeliveryItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title),
              Container(
                width: 60,
                padding:EdgeInsets.all(1),
                height: 20,
                decoration: BoxDecoration(
                  color:Color.fromARGB(255, 237, 204, 71),
                  borderRadius: BorderRadius.circular(10),),
                  child: Center(
                    child: Text(widget.addressType,style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),),
                  ),
                
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 8,
            backgroundColor: Color.fromARGB(255, 237, 204, 71),
          ),
          subtitle: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.address),
              SizedBox(height: 5,),
              Text(widget.number),

            ],
          ),
        ),
        Divider(height: 35,)
      ],
    );
  }
}