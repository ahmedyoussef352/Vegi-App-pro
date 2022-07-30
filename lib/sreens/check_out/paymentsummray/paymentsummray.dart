import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/reviewcart_providers.dart';
import '../../models/delivery_address_model.dart';
import '../delivery_details/single_delivery.dart';
import 'Order_item.dart';
import 'my_google._payment.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel deliverAddressList;
  // const PaymentSummary({Key? key}) : super(key: key);
  PaymentSummary({required this.deliverAddressList});

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Home;

  get discounValue => null;

  get total => null;
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    double discount = 30;
    double shipingValue = 40;
    double totalPrice = reviewCartProvider.getTotalPrice();
    double discounValue;
    double newtotalPrice;

    if (totalPrice > 300) {
      discounValue = (totalPrice * (discount/100));
      newtotalPrice =  totalPrice - discounValue+shipingValue;

      newtotalPrice;
    }
    else{
       newtotalPrice = reviewCartProvider.getTotalPrice()+shipingValue;
       discounValue = 0;
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
      color: Colors.black,),
          elevation: 0,
          title: Text(
            'PaymentSummary',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color.fromARGB(255, 237, 204, 71),
        ),
        bottomNavigationBar: ListTile(
          title: Text('Total Amount'),
          subtitle: Container(
            width: 30,
            child: Text(
              // ignore: unnecessary_null_comparison
              '${newtotalPrice}',
              style: TextStyle(
                color: Colors.green[900],
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          trailing: Container(
            width: 160,
            child: MaterialButton(
              onPressed: () {
                myType == AddressTypes.OnlinePayment
                    ? Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                        return MyGooglePay(
                          total: total,
                        );
                      }))
                    : Container();
              },
              child: Text(
                'please Oreder',
                style: TextStyle(
                
              ),
              ),
              color: Color.fromARGB(255, 237, 204, 71),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  SingleDeliveryItem(
                    address:
                        "aera, ${widget.deliverAddressList.aera}, street, ${widget.deliverAddressList.street}, society ${widget.deliverAddressList.scoiety}, pincode ${widget.deliverAddressList.pincode}",
                    title:
                        "${widget.deliverAddressList.firstName} ${widget.deliverAddressList.lastName}",
                    number: widget.deliverAddressList.mobileNo,
                    addressType: widget.deliverAddressList.addressType ==
                            "AddressTypes.Home"
                        ? "Home"
                        : widget.deliverAddressList.addressType ==
                                "AddressTypes.Other"
                            ? "Other"
                            : "Work",
                  ),
                  Divider(),
                  ExpansionTile(
                    children: reviewCartProvider.getReviewCartDataList.map((e) {
                      return OrderItem(
                        e: e,
                      );
                    }).toList(),
                    title: Text(
                        'Order Item ${reviewCartProvider.getReviewCartDataList.length}'),
                  ),
                  Divider(),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      'Sub Total',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900]),
                    ),
                    trailing: Text(
                      totalPrice.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Shiping Value",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900]),
                    ),
                    trailing: Text(
                      shipingValue.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Discount Value",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900]),
                    ),
                    trailing: Text(
                      '$discounValue',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text('Payment Options'),
                  ),
                  RadioListTile(
                    activeColor: Colors.green,
                    value: AddressTypes.Home,
                    groupValue: myType,
                    title: Text('Home'),
                    onChanged: (AddressTypes? value) {
                      setState(() {
                        myType = value!;
                      });
                    },
                    secondary: Icon(
                      Icons.home,
                      color: Color.fromARGB(255, 237, 204, 71),
                    ),
                  ),
                  RadioListTile(
                    activeColor: Colors.green,
                    value: AddressTypes.OnlinePayment,
                    groupValue: myType,
                    title: Text('OnlinePayment'),
                    onChanged: (AddressTypes? value) {
                      setState(() {
                        myType = value!;
                      });
                    },
                    secondary: Icon(
                      Icons.devices_other,
                      color: Color.fromARGB(255, 237, 204, 71),
                    ),
                  )
                ],
              );
            }),
          ),
        ));
  }
}
