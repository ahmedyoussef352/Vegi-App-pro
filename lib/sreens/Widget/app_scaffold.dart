import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuyuyuy/service/network_service.dart';
import 'package:flutter/material.dart';
class AppScaffold extends StatefulWidget {
  final Widget child;

  const AppScaffold({Key? key, required this.child}) : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
  var networkStatus = Provider.of<NetworkStatus>(context);
    return Scaffold(
        // ignore: unrelated_type_equality_checks
        body: networkStatus == NetworkStatus.Online
            ? widget.child
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Icon(Icons.wifi_off_outlined
                      ,size: 150,
                      color: Colors.black,),
                    ),

                  SizedBox(
                      height: 20,
                    ),
                               Container(child: Text('You are Offline',style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                               ),)),
                  ],
                ),
              ));
  }
}
