import 'package:client_side/pages/buy_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductDetails extends StatelessWidget {
  final String name;
  final String price;
  final String url;
  final String offer;
   const ProductDetails({super.key, required this.name, required this.price, required this.url, required this.offer,});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Image.network(url,height: 120,fit: BoxFit.fitHeight,),
            Text(name,style: TextStyle(fontSize: 15,overflow: TextOverflow.ellipsis),),
            Text('Rs : $price',style: TextStyle(fontSize: 15,overflow: TextOverflow.ellipsis),),
            Container(
              height: 25,
              color: Colors.orange,
              child: Text(offer),

            )
          ],
        ),
      ),
    );
  }
}
