import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_providers.dart';
import '../My_profile/My_profile.dart';
import '../WishList/WishList.dart';
import '../reviewcart/reviewcart.dart';
import 'Home.dart';

class DrawerSide extends StatefulWidget {
  // UserProvider userprovider;
  // DrawerSide({required this.userprovider});
  @override
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  late UserProvider user;
  Widget listTile(
      {required String title,
      required IconData iconData,
      required Function onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            height: 35,
            child: ListTile(
              onTap: () {
                setState(() {
                  onTap();
                });
              },
              leading: Icon(
                iconData,
                size: 28,
              ),
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // var userData = widget.userprovider.currentUserData;

    return Drawer(
      child: Container(
          color: Color.fromARGB(255, 237, 204, 71),
          child: ListView(children: [
            Column(
              children: [
                DrawerHeader(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 43,
                          backgroundColor: Colors.white54,
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 237, 204, 71),
                            backgroundImage: NetworkImage(
                              "https://s3.envato.com/files/328957910/vegi_thumb.png",
                            ),
                            radius: 40,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Ahmed youssef'),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "ay322065.gmail.com",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                listTile(
                  iconData: Icons.home_outlined,
                  title: "Home",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                ),
                listTile(
                  iconData: Icons.shop_outlined,
                  title: "Review Cart",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ReviewCart(),
                      ),
                    );
                  },
                ),
                listTile(
                  iconData: Icons.person_outlined,
                  title: "My Profile",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyProfile(
                            // userProvider:widget.userProvider
                            ),
                      ),
                    );
                  },
                ),
                listTile(
                    iconData: Icons.notifications_outlined,
                    title: "Notificatio",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WishList(),
                        ),
                      );
                    }),
                listTile(
                    iconData: Icons.star_outline,
                    title: "Rating & Review",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WishList(),
                        ),
                      );
                    }),
                listTile(
                    iconData: Icons.favorite_outline,
                    title: "Wishlist",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WishList(),
                        ),
                      );
                    }),
                listTile(
                    iconData: Icons.copy_outlined,
                    title: "Raise a Complaint",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WishList(),
                        ),
                      );
                    }),
                listTile(
                    iconData: Icons.format_quote_outlined,
                    title: "FAQs",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WishList(),
                        ),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Divider(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                Container(
                  height: 350,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Contact Support"),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Call us:"),
                          SizedBox(
                            width: 10,
                          ),
                          Text("+923352580282"),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text("Mail us:"),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "assarbaloch5@gmail.com",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ])),
    );
  }
}
