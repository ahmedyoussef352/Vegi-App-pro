
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:uuyuyuy/sreens/reviewcart/reviewcart.dart';

import '../../providers/product_providers.dart';
import '../../providers/user_providers.dart';
import '../Widget/app_scaffold.dart';
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => 
                  AppScaffold(child: Search(
                    search: productProvider.getFreshProductDataList,
                  ),),
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => 
                  AppScaffold(child: Search(
                    search: productProvider.getfashionProductDataList,
                  ),),
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => 
                  AppScaffold(child: Search(
                    search: productProvider.getPhonesProductDataList,
                  ),),
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => 
                  AppScaffold(child: Search(
                    search: productProvider.getTabletsProductDataList,
                  ),),
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => 
                  AppScaffold(child: Search(
                    search: productProvider.getCosmeticsProductDataList,
                  ),),
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
                    builder: ((context) => AppScaffold(child: Search(
                          search: productProvider.getAllProductSearch,
                        )
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
                    builder: ((context) => 
                    AppScaffold(child:ReviewCart()) )));
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
          _superMarket(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: productProvider.getFreshProductDataList.map(
                (freshProductData) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => 
                              AppScaffold(child: ProductOverview(
                              //  ProductUnit: freshProductData.productUnit,
                                productImage: freshProductData.productImage,
                                productName: freshProductData.productName,
                                productPrice: freshProductData.productPrice,
                                productId: freshProductData.productId,
                              )))));
                    },
                    child: SingleProduct(
                      productUnit:freshProductData,
                      productImage: freshProductData.productImage,
                      productName: freshProductData.productName,
                      productPrice: freshProductData.productPrice,
                      productId: freshProductData.productId,
                      unit: true,
                      admin: false,
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
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => 
                              AppScaffold(child: ProductOverview(
                              //  ProductUnit: fashionProductData.productUnit,
                                productImage: fashionProductData.productImage,
                                productName: fashionProductData.productName,
                                productPrice: fashionProductData.productPrice,
                                productId: fashionProductData.productId,
                              )))));
                    },
                    child: SingleProduct(
                      productUnit:fashionProductData,
                      productImage: fashionProductData.productImage,
                      productName: fashionProductData.productName,
                      productPrice: fashionProductData.productPrice,
                      productId: fashionProductData.productId,
                      admin: false,
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
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => 
                              AppScaffold(child: ProductOverview(
                              //  ProductUnit: phonesProductData.productUnit,
                                productImage: phonesProductData.productImage,
                                productName: phonesProductData.productName,
                                productPrice: phonesProductData.productPrice,
                                productId: phonesProductData.productId,
                              )))));
                    },
                    child: SingleProduct(
                      productUnit:phonesProductData,
                      productImage: phonesProductData.productImage,
                      productName: phonesProductData.productName,
                      productPrice: phonesProductData.productPrice,
                      productId: phonesProductData.productId,
                      admin: false,
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
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => 
                              AppScaffold(child: ProductOverview(
                              //  ProductUnit: tabletsProduct.productUnit,
                                productImage: tabletsProduct.productImage,
                                productName: tabletsProduct.productName,
                                productPrice: tabletsProduct.productPrice,
                                productId: tabletsProduct.productId,
                              )))));
                    },
                    child: SingleProduct(
                      productUnit:tabletsProduct,
                      productImage: tabletsProduct.productImage,
                      productName: tabletsProduct.productName,
                      productPrice: tabletsProduct.productPrice,
                      productId: tabletsProduct.productId,
                      admin: false,
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
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) =>
                              AppScaffold(child:  ProductOverview(
                            // ProductUnit: cosmeticsProductData.productUnit,
                                productId: cosmeticsProductData.productId,
                                productImage: cosmeticsProductData.productImage,
                                productName: cosmeticsProductData.productName,
                                productPrice: cosmeticsProductData.productPrice,
                                
                              )))));
                    },
                    child: SingleProduct(
                      productUnit:cosmeticsProductData,
                      productImage: cosmeticsProductData.productImage,
                      productName: cosmeticsProductData.productName,
                      productPrice: cosmeticsProductData.productPrice,
                      productId: cosmeticsProductData.productId,
                      admin: false,
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
