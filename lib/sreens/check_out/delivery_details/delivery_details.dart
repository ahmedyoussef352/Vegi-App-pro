import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuyuyuy/sreens/check_out/delivery_details/single_delivery.dart';
import '../../../providers/check_out_provider.dart';
import '../../Widget/app_scaffold.dart';
import '../../models/delivery_address_model.dart';
import '../add_delivery.address/add_deliveryadress.dart';
import '../paymentsummray/paymentsummray.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({Key? key}) : super(key: key);

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  late DeliveryAddressModel value;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 237, 204, 71),
        title: Text(
          "Delivery Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 237, 204, 71),
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AppScaffold(
                child: AppScaffold(child: AddDeliveryAddress()),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        // width: 160,
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Text(
                  "Add new Address",
                  style: TextStyle(),
                )
              : Text(
                  "Payment Summary",
                  style: TextStyle(),
                ),
          onPressed: () {
            deliveryAddressProvider.getDeliveryAddressList.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AppScaffold(
                        child: AppScaffold(child: AddDeliveryAddress()),
                      ),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AppScaffold(
                          child: PaymentSummary(
                        deliverAddressList: value,
                      )),
                    ),
                  );
          },
          color: Color.fromARGB(255, 237, 204, 71),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Deliver To"),
          ),
          Divider(
            height: 1,
          ),
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Center(
                  child: Container(
                    child: Center(
                      child: Text("No Data"),
                    ),
                  ),
                )
              : Column(
                  children: deliveryAddressProvider.getDeliveryAddressList
                      .map<Widget>((e) {
                    setState(() {
                      value = e;
                    });
                    return SingleDeliveryItem(
                      address:
                          "aera, ${e.aera}, street, ${e.street}, society ${e.scoiety}, pincode ${e.pincode}",
                      title: "${e.firstName} ${e.lastName}",
                      number: e.mobileNo,
                      addressType: e.addressType == "AddressTypes.Home"
                          ? "Home"
                          : e.addressType == "AddressTypes.Other"
                              ? "Other"
                              : "Work",
                    );
                  }).toList(),
                )
        ],
      ),
    );
  }
}
