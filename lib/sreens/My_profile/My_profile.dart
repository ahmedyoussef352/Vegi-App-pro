import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_providers.dart';
import '../Home/Drawer.dart';
import '../Widget/app_scaffold.dart';
import '../authitication/Sign in.dart';
import '../check_out/add_delivery.address/add_deliveryadress.dart';
import '../models/delivery_address_model.dart';
import '../models/usermodel.dart';
import '../reviewcart/reviewcart.dart';

class MyProfile extends StatefulWidget {
  // UserProvider userProvider ;
  // MyProfile({required this.userProvider}) ;

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late DeliveryAddressModel value;

  Widget _Listtile(
      {required String title, required iconData, required Function onTap}) {
    return InkWell(
      onTap: () {
        setState(() {
          onTap();
        });
      },
      child: Column(
        children: [
          Divider(),
          ListTile(
            leading: Icon(iconData),
            title: Text(title),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 204, 71),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 237, 204, 71),
        elevation: 0,
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      drawer: DrawerSide(
          // userprovider: userProvider,
          ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 120,
                color: Color.fromARGB(255, 237, 204, 71),
                width: double.infinity,
              ),
              Expanded(
                  child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Ahmed youssef",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "ay3220155@gmail.com",
                                    style: TextStyle(),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 237, 204, 71),
                                radius: 15,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    color: Color.fromARGB(255, 237, 204, 71),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              )
                            ],
                          ),
                          _Listtile(
                              iconData: Icons.shop_outlined,
                              title: "My Orders",
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AppScaffold(child: ReviewCart()),
                                  ),
                                );
                              }),
                          _Listtile(
                              iconData: Icons.location_on_outlined,
                              title: "My Delivery Address",
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AppScaffold(
                                        child: AddDeliveryAddress()),
                                  ),
                                );
                              }),
                          _Listtile(
                              iconData: Icons.person_outline,
                              title: "Refer A Friends",
                              onTap: () {}),
                          _Listtile(
                              iconData: Icons.file_copy_outlined,
                              title: "Terms & Conditions",
                              onTap: () {}),
                          _Listtile(
                              iconData: Icons.policy_outlined,
                              title: "Privacy Policy",
                              onTap: () {}),
                          _Listtile(
                              iconData: Icons.add_chart,
                              title: "About",
                              onTap: () {}),
                          _Listtile(
                              iconData: Icons.exit_to_app_outlined,
                              title: "Log Out",
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AppScaffold(child: SignIn()),
                                  ),
                                );
                              })
                        ],
                      ))
                  // :Center(
                  //   child: Text('No Data'),

                  // ),
                  ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 68, left: 45),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color.fromARGB(255, 237, 204, 71),
              child: CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(
                  "https://s3.envato.com/files/328957910/vegi_thumb.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
