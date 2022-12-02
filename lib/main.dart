import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';
import 'package:uuyuyuy/service/network_service.dart';
import 'package:uuyuyuy/sreens/Home/Home.dart';
import 'package:uuyuyuy/sreens/Widget/app_scaffold.dart';
import 'package:uuyuyuy/sreens/admin/addproduct/add_product.dart';
import 'package:uuyuyuy/sreens/admin/admin_panel/admin_home.dart';
import 'package:uuyuyuy/sreens/authitication/Sign%20in.dart';
import 'package:uuyuyuy/sreens/check_out/add_delivery.address/add_deliveryadress.dart';
import 'package:uuyuyuy/sreens/welcome/welcome.dart';
import 'firebase_options.dart';
import 'providers/check_out_provider.dart';
import 'providers/product_providers.dart';
import 'providers/reviewcart_providers.dart';
import 'providers/user_providers.dart';
import 'providers/wish_List_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);
  static const String _title = 'Food';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<CheckoutProvider>(
      create: (context) => CheckoutProvider(),
    ),
      ChangeNotifierProvider<WishListProvider>(
      create: (context) => WishListProvider(),
    ),
      ChangeNotifierProvider<ReviewCartProvider>(
      create: (context) => ReviewCartProvider(),
    ),
      ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
    ),
    ChangeNotifierProvider<UserProvider>(
      create: (context) => UserProvider(),
    ),
    StreamProvider(
          create: (context) =>
              NetworkService().controller.stream,
          initialData: NetworkStatus.Online,
        ),],
      child: MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        home: AppScaffold(child: Welcome()),
      ),
    );
  }
}