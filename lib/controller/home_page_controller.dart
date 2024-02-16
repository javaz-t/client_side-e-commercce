import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product/product_model.dart';

class HomePageController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Product> products = [];
  late CollectionReference productCollection;



  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    productCollection = firestore.collection('products');
    await fetchProducts();
    super.onInit();
  }


  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      products.clear();
      products.assignAll(retrievedProducts);

      Get.snackbar('Success', 'Product fetch successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }finally{  update();
    }
  }
}