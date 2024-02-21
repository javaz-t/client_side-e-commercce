import 'package:client_side/model/product/product_model.dart';
import 'package:client_side/controller/purchase_controller.dart';
import 'package:client_side/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyPage extends StatelessWidget {

  BuyPage({super.key,});

  @override
  Widget build(BuildContext context) {
   Product productData = Get.arguments['data'];

    return GetBuilder<PurchaseController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(title: Text('Order Page'),),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(child: Image.network(productData.imageUrl, height: 400,
                  width: 400,
                  fit: BoxFit.fitHeight,)),
                SizedBox(height: 10,),
                Text(productData.name, style: const TextStyle(fontSize: 40,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(productData.description, style: const TextStyle(
                  fontSize: 25, overflow: TextOverflow.ellipsis,),),
                SizedBox(height: 10,),
                Text(
                  'Rs :${productData.price}',
                  style: const TextStyle(fontSize: 25,

                      overflow: TextOverflow.ellipsis,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  controller: ctrl.addressController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Shipping Address : ',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    ElevatedButton(onPressed: () {
                      ctrl.submitOrder(price: productData.price, iteam: productData.name, description: productData.description);
                    }, child: Text('Submit')),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
