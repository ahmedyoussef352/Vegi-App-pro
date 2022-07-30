// ignore: file_names
// ignore_for_file: file_names
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:uuyuyuy/sreens/reviewcart/reviewcart.dart';

import '../../providers/product_providers.dart';
import '../../providers/user_providers.dart';
import '../product_overview/product_overview.dart';
import '../search/search.dart';
import 'Drawer.dart';
import 'SingleProduct.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ProductProvider productProvider;
 late UserProvider userProvider;

  Widget _buildHerbsProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Herbs Seasonings',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Search(
                    search: productProvider.getHerbsProductDataList,
                  ),
                ),
              );
            },
            child: Text(
              'Veiw all',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFreshProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Fresh Fruits',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Search(
                    search: productProvider.getHerbsProductDataList,
                  ),
                ),
              );
            },
            child: Text(
              'Veiw all',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRootProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Root',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Search(
                    search: productProvider.getHerbsProductDataList,
                  ),
                ),
              );
            },
            child: Text(
              'Veiw all',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    ProductProvider initproductProvider = Provider.of(context, listen: false);
    
    initproductProvider.fatchHerbsProductData();
    initproductProvider.fatchFreshProductData();
    initproductProvider.fatchRootProductData();
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
          'Home',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xffd6d382),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => Search(
                          search: productProvider.getAllProductSearch,
                        ))));
              },
              icon: Icon(
                Icons.search,
                size: 17,
                color: Colors.black,
              ),
            ),
            
          ),
          SizedBox(width: 7),
          CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xffd6d382),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => ReviewCart() )));
              },
              icon: Icon(
                Icons.shop,
                size: 17,
                color: Colors.black,
              ),
            ),
            
          ),
          SizedBox(width: 10),
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
          _buildHerbsProduct(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: productProvider.getHerbsProductDataList.map(
                (herbsProductData) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => ProductOverview(
                            ProductUnit: herbsProductData.productUnit,
                                productId: herbsProductData.productId,
                                productImage: herbsProductData.productImage,
                                productName: herbsProductData.productName,
                                productPrice: herbsProductData.productPrice,
                              ))));
                    },
                    child: SingleProduct(
                      productUnit: herbsProductData,
                      productImage: herbsProductData.productImage,
                      productName: herbsProductData.productName,
                      productPrice: herbsProductData.productPrice,
                      productId: herbsProductData.productId,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          _buildFreshProduct(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: productProvider.getFreshProductDataList.map(
                (freshProductData) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => ProductOverview(
                               ProductUnit: freshProductData.productUnit,
                                productImage: freshProductData.productImage,
                                productName: freshProductData.productName,
                                productPrice: freshProductData.productPrice,
                                productId: freshProductData.productId,
                              ))));
                    },
                    child: SingleProduct(
                      productUnit:freshProductData,
                      productImage: freshProductData.productImage,
                      productName: freshProductData.productName,
                      productPrice: freshProductData.productPrice,
                      productId: freshProductData.productId,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          _buildRootProduct(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: productProvider.getRootProductDataList.map(
                (rootProductData) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => ProductOverview(
                            ProductUnit: rootProductData.productUnit,
                                productId: rootProductData.productId,
                                productImage: rootProductData.productImage,
                                productName: rootProductData.productName,
                                productPrice: rootProductData.productPrice,
                              ))));
                    },
                    child: SingleProduct(
                      productUnit:rootProductData,
                      productImage: rootProductData.productImage,
                      productName: rootProductData.productName,
                      productPrice: rootProductData.productPrice,
                      productId: rootProductData.productId,
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
}
