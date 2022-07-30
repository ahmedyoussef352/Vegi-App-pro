import 'package:flutter/material.dart';

import '../Widget/singleitem.dart';
import '../models/productmodel.dart';
class Search extends StatefulWidget {
  final List<ProductModel>search;
  const Search ({ required this.search});
  @override
  State<Search> createState() => _SearchState();
}
class _SearchState extends State<Search> {
  String query ="";
  
  searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    // SinginCharacter _character = SinginCharacter;
        List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      backgroundColor:Colors.white,
      // drawer: DrawerSide(userProvider: userProvider,),
      appBar: AppBar(
        leading: IconButton(onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
      color: Colors.black,),
        title: Text(
          'Search',
          style: TextStyle(
                color: Colors.black,
              ),
        ),
        backgroundColor: Color.fromARGB(255, 237, 204, 71),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:20,left: 10,right: 10),
        child: ListView (
           physics: BouncingScrollPhysics(),
            children: [
              Text(
              'Items',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
            
            /////search
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5,top: 8),
                  child: TextFormField(
                    onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
                      style: TextStyle(color: Colors.black),
                      cursorHeight: 20,
                      cursorWidth: 1,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                        hintText: 'Search for items in the store',
                        hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                        suffix: Icon(
                          Icons.search_outlined,
                          color: Colors.grey,
                        ),
                      )),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Column(
            children: _searchItem.map((data) {
              return SingleItem(
                // isBool: false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                 productUnit: data.productUnit,
                 productId: data.productId,
                 productQuantity: data.productQuantity,
                 
              );
            }).toList(),
          )
            
            ],),
      )
        );
      
        
  }

}
