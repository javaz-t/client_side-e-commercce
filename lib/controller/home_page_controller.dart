import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/category/category_model.dart';
import '../model/product/product_model.dart';

class HomePageController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  List<Product> products = [];
  List<Product> productsShowInUI = [];
  late CollectionReference categoryCollection;
  List<CategoryModel> categoryList =[];


  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    productCollection = firestore.collection('products');
    categoryCollection= firestore.collection('category');
   await fetchCategory();
    await fetchProducts();
    super.onInit();
  }


  fetchCategory() async {
    try {
      QuerySnapshot categorySnapshot = await categoryCollection.get();
      final List<CategoryModel> retrievedCategory = categorySnapshot.docs
          .map((doc) => CategoryModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      categoryList.clear();
      categoryList.assignAll(retrievedCategory);

      Get.snackbar('Success', 'Category fetch successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('CAtergory Error', e.toString(), colorText: Colors.red);
      print(e);
    }finally{  update();
    }
  }



  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      products.clear();
      products.assignAll(retrievedProducts);
      productsShowInUI.assignAll(products);

      Get.snackbar('Success', 'Product fetch successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }finally{  update();
    }
  }



filterByCategory(String categorySelected){
    productsShowInUI = products.where((product) => product.category==categorySelected).toList();
    update();
}

filterByBrand(List<String>brands){
    if(brands.isEmpty){
      productsShowInUI=products;

    }else{
      List<String>lowerCaseBrand = brands.map((e) => e.toLowerCase()).toList();
      productsShowInUI= products.where((product) => lowerCaseBrand.contains(product.brand.toLowerCase())).toList();
    }
    update();
}

sortByPrice(bool accending){
    List<Product>sortedProduct= List<Product>.from(productsShowInUI);
    sortedProduct.sort((a,b)=>accending? a.price!.compareTo(b.price!):b.price!.compareTo(a.price));
    productsShowInUI=sortedProduct;
    update();
  }


}