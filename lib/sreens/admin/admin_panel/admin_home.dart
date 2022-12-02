import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:uuyuyuy/sreens/models/productmodel.dart';

import '../../../providers/product_providers.dart';
import '../../../providers/user_providers.dart';
import '../../Home/Drawer.dart';
import '../../Home/SingleProduct.dart';
import '../../Widget/app_scaffold.dart';
import '../addproduct/add_product.dart';
import '../splash/splash_admin.dart';

class AdminPanelHome extends StatefulWidget {
  const AdminPanelHome({super.key});

  @override
  State<AdminPanelHome> createState() => _AdminPanelHomeState();
}

class _AdminPanelHomeState extends State<AdminPanelHome> {
  late ProductProvider productProvider;
  late UserProvider userProvider;
  void initState() {
    ProductProvider initproductProvider = Provider.of(context, listen: false);

    initproductProvider.fashionProductData();
    initproductProvider.fatchFreshProductData();
    initproductProvider.fatchPhonesProductData();
    initproductProvider.fatchTabletsProductData();
    initproductProvider.fatchCosmeticsProductData();
    // userProvider = Provider.of(context);
    // userProvider.getUserData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(
      context,
    );
    userProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 238, 238),
      drawer: DrawerSide(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 195, 160, 4),
        title: Text(
          'Admin',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return AppScaffold(child: AdminPanelHome());
                    }));
                  },
                  child: Icon(Icons.refresh)
                  //  Text('refresh',style: TextStyle(
                  //   fontSize: 20
                  // ),),
                  ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Xg-k622Sbztlrb-L1o1CAla3zCbVc2lUw&usqp=CAU'),
              ),
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 55,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 237, 204, 71),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(70),
                                bottomRight: Radius.circular(70),
                              )),
                          child: Center(
                              child: Text(
                            'Vegi',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                shadows: [
                                  BoxShadow(
                                    color: Colors.green.shade700,
                                    offset: Offset(3, 3),
                                    blurRadius: 3,
                                  )
                                ]),
                          )),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          _superMarket(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: productProvider.getFreshProductDataList.map(
                (freshProductData) {
                  return InkWell(
                    onTap: () {},
                    child: SingleProduct(
                      productUnit: freshProductData,
                      productImage: freshProductData.productImage,
                      productName: freshProductData.productName,
                      productPrice: freshProductData.productPrice,
                      productId: freshProductData.productId,
                      unit: true,
                      onDelete: () {
                        superMarketDataDelete(context, freshProductData);
                      },
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          _buildFashonProduct(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: productProvider.getfashionProductDataList.map(
                (fashionProductData) {
                  return InkWell(
                    onTap: () {},
                    child: SingleProduct(
                      productUnit: fashionProductData,
                      productImage: fashionProductData.productImage,
                      productName: fashionProductData.productName,
                      productPrice: fashionProductData.productPrice,
                      productId: fashionProductData.productId,
                      onDelete: () {
                        fashionDataDelete(context, fashionProductData);
                      },
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          _buildPhonesProduct(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: productProvider.getPhonesProductDataList.map(
                (phonesProductData) {
                  return InkWell(
                    onTap: () {},
                    child: SingleProduct(
                      productUnit: phonesProductData,
                      productImage: phonesProductData.productImage,
                      productName: phonesProductData.productName,
                      productPrice: phonesProductData.productPrice,
                      productId: phonesProductData.productId,
                      onDelete: () {
                        phonesDataDelete(context, phonesProductData);
                      },
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          _buildTabletsProduct(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: productProvider.getTabletsProductDataList.map(
                (tabletsProduct) {
                  return InkWell(
                    onTap: () {},
                    child: SingleProduct(
                      productUnit: tabletsProduct,
                      productImage: tabletsProduct.productImage,
                      productName: tabletsProduct.productName,
                      productPrice: tabletsProduct.productPrice,
                      productId: tabletsProduct.productId,
                      onDelete: () {
                        tabletsDataDelete(context, tabletsProduct);
                      },
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          _buildCosmeticsProduct(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: productProvider.getCosmeticsProductDataList.map(
                (cosmeticsProductData) {
                  return InkWell(
                    onTap: () {},
                    child: SingleProduct(
                      productUnit: cosmeticsProductData,
                      productImage: cosmeticsProductData.productImage,
                      productName: cosmeticsProductData.productName,
                      productPrice: cosmeticsProductData.productPrice,
                      productId: cosmeticsProductData.productId,
                      onDelete: () {
                        cosmeticsDataDelete(context, cosmeticsProductData);
                      },
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ]),
      ),
    );
  }

  superMarketDataDelete(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        productProvider.superMarketDataDelete(delete.productId);

        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Product"),
      content: Text("Are you delete product"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  fashionDataDelete(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        productProvider.fashionDataDelete(delete.productId);

        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Product"),
      content: Text("Are you delete product"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  phonesDataDelete(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        productProvider.phonesDataDelete(delete.productId);

        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Product"),
      content: Text("Are you delete product"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  tabletsDataDelete(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        productProvider.tabletsDataDelete(delete.productId);

        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Product"),
      content: Text("Are you delete product"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  cosmeticsDataDelete(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        productProvider.cosmeticsDataDelete(delete.productId);

        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Product"),
      content: Text("Are you delete product"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _superMarket() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'SuberMarket',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            width: 85,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextButton(
                // splashColor: Colors.black,
                // color: Colors.orange,
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return AppScaffold(child: AddProductAdmin(collection: "Freshproduct",));
                  }));
                },
                child: Expanded(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildFashonProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Fashion',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            width: 85,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextButton(
                // splashColor: Colors.black,
                // color: Colors.orange,
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return AppScaffold(child: AddProductAdmin(collection: "Fashionproduct",));
                  }));
                },
                child: Expanded(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildPhonesProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Phones',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            width: 85,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextButton(
                // splashColor: Colors.black,
                // color: Colors.orange,
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return AppScaffold(child: AddProductAdmin(collection: "Phonesproduct",));
                  }));
                },
                child: Expanded(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletsProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Tablets',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            width: 85,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextButton(
                // splashColor: Colors.black,
                // color: Colors.orange,
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return AppScaffold(child: AddProductAdmin(collection: "Tabletsproduct",));
                  }));
                },
                child: Expanded(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildCosmeticsProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Cosmetics',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            width: 85,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextButton(
                // splashColor: Colors.black,
                // color: Colors.orange,
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return AppScaffold(child: AddProductAdmin(collection: "Cosmeticsproduct",));
                  }));
                },
                child: Expanded(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
