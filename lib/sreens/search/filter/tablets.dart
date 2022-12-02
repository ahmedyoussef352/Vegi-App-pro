// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:uuyuyuy/sreens/Widget/singleitem.dart';

// import '../../../providers/product_providers.dart';

// class TabletsFilter extends StatefulWidget {
//   const TabletsFilter({super.key});

//   @override
//   State<TabletsFilter> createState() => _TabletsFilterState();
// }

// class _TabletsFilterState extends State<TabletsFilter> {
//   late ProductProvider productProvider;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//                 height: 600,
//                 // padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
//                 child: ListView(physics: BouncingScrollPhysics(), children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Expanded(
//                     child: Row(
//                 children: productProvider.getCosmeticsProductDataList.map(
//                   (cosmeticsProductData) {
//                     return SingleItem(
//                       productUnit:cosmeticsProductData,
//                       productImage: cosmeticsProductData.productImage,
//                       productName: cosmeticsProductData.productName,
//                       productPrice: cosmeticsProductData.productPrice,
//                       productId: cosmeticsProductData.productId,
//                       productQuantity: cosmeticsProductData.productQuantity,
//                     );
//                   },
//                 ).toList(),
//               ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ])),
//     );;
//   }
// }