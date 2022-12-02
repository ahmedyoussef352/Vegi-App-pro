import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuyuyuy/sreens/check_out/delivery_details/delivery_details.dart';
import '../../../providers/check_out_provider.dart';
import '../../Widget/app_scaffold.dart';
import '../../Widget/custom_Text_field.dart';
import '../google_map/google.dart';

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({Key? key}) : super(key: key);

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

enum AddressTypes {
  // ignore: constant_identifier_names
  Home,
  // ignore: constant_identifier_names
  Work,
  // ignore: constant_identifier_names
  Other,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    // var addressType =AddressTypes.Home=="";
    CheckoutProvider checkoutProvider = Provider.of(context);
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
          'Add Delivery',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 48,
          child: checkoutProvider.isloadding == false
              ? MaterialButton(
                  onPressed: () {
                    checkoutProvider.validator(context, myType);
                  //   Navigator.of(context)
                  //     .pushReplacement(MaterialPageRoute(builder: (context) {
                  //   return AppScaffold(child: DeliveryDetails());
                  // }));

                  },
                  child: Text(
                    'Add Adress',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  color: Color.fromARGB(255, 237, 204, 71),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(children: [
          CostomTextField(
            labText: "First name",
            controller: checkoutProvider.firstName,
          ),
          CostomTextField(
            labText: "Last name",
            controller: checkoutProvider.lastName,
          ),
          CostomTextField(
            labText: "Mobile No",
            controller: checkoutProvider.mobileNo,
            keyboardType: TextInputType.number,
          ),
          CostomTextField(
            labText: "Alternate Mobile No",
            controller: checkoutProvider.alternateMobileNo,
            keyboardType: TextInputType.number,
          ),
          CostomTextField(
            labText: "Scoiety",
            controller: checkoutProvider.scoiety,
          ),
          CostomTextField(
            labText: "Street",
            controller: checkoutProvider.street,
          ),
          CostomTextField(
            labText: "Landmark",
            controller: checkoutProvider.landmark,
          ),
          CostomTextField(
            labText: "City",
            controller: checkoutProvider.city,
          ),
          CostomTextField(
            labText: "Aera",
            controller: checkoutProvider.aera,
          ),
          CostomTextField(
            labText: "Pincode",
            controller: checkoutProvider.pincode,
            keyboardType: TextInputType.number,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AppScaffold(child: CostumGoogleMap());
              }));
            },
            child: Container(
              height: 47,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //checkoutProvider.setLoaction == null?
                  Text('Enter tour loacation')
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Text('Address Type*'),
          ),
          RadioListTile(
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
            value: AddressTypes.Work,
            groupValue: myType,
            title: Text('Work'),
            onChanged: (AddressTypes? value) {
              setState(() {
                myType = value!;
              });
            },
            secondary: Icon(
              Icons.work,
              color: Color.fromARGB(255, 237, 204, 71),
            ),
          ),
          RadioListTile(
            value: AddressTypes.Other,
            groupValue: myType,
            title: Text('Other'),
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
        ]),
      ),
    );
  }
}
