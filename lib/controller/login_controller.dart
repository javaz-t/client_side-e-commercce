import 'dart:math';
import 'package:get_storage/get_storage.dart';
import 'package:client_side/model/user_model.dart';
import 'package:client_side/pages/home_page.dart';
import 'package:client_side/pages/registration_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;
TextEditingController nameCtrl = TextEditingController();
TextEditingController numberCtrl = TextEditingController();
TextEditingController loginCtrl = TextEditingController();
bool otpVisible =false;
String? enteredOtp;
String? orgOtp;
GetStorage box = GetStorage();

@override
  void onReady() {
    // TODO: implement onReady
  Map<String,dynamic>? user = box.read('loginUser');
  if(user !=null){
    Get.to(const HomePage());
  }
    super.onReady();
  }
  @override
  void onInit() {
    Get.put(RegistrationPage());

    userCollection = firebaseFirestore.collection('user');

    super.onInit();
  }


    addProduct() {
    print('Entered otp "$enteredOtp');
    print('Real otp :$orgOtp');
      try {
        if (numberCtrl.text.isEmpty || nameCtrl.text.isEmpty) {
          Get.snackbar(
              'Error', 'name or number is empty', colorText: Colors.red);
          return;
        }
       if(orgOtp==enteredOtp){
         DocumentReference doc = userCollection
             .doc(); //doc() is a method that generates a new, auto-generated ID in this collection. DocumentReference doc = productCollection.doc(); creates a new document reference with an auto-generated ID in the productCollection collection, and assigns this reference to doc
         User user = User(
           name: nameCtrl.text, number: numberCtrl.text, id: doc.id,);
         // Get.back();
         final userJson = user.toJson();
         doc.set(
             userJson); //set is a method that writes or replaces data on a specific document referenced by DocumentReference.
         Get.snackbar('Sucess', 'everything perfect');
         Get.to(()=>HomePage());
       }else{
         Get.snackbar('Error', 'Entered OTP is wrong');
       }
      } catch (e) {
        Get.snackbar('Error', e.toString());
        print(e);
      } finally {
        update();
        //   fetchProducts();}
      }
    }

    setOtp(){
   try{
     if (numberCtrl.text.isEmpty || nameCtrl.text.isEmpty) {
       Get.snackbar(
           'Error', 'name or number is empty', colorText: Colors.red);
       return;
     }
     final random = Random();
     int otp = 1000 + random.nextInt(9000);
     orgOtp=otp.toString();
     print(otp);
     update();
     if(otp!=null){
       Get.snackbar('Sucess', 'Otp sent sucessfully ');
       otpVisible=true;
     }else{
       Get.snackbar('Error', 'Otp not send ');
     }
   }catch(e){
     print(e);
   }finally{
     update();
   }
    }

  LoginWithPhone() async {
    String phoneNumber = loginCtrl.text;
    if (phoneNumber.isNotEmpty) {
      var querySnapshot = await userCollection.where(
          'number', isEqualTo: phoneNumber).limit(1).get();
      if (querySnapshot.docs.isNotEmpty) {
        var userDoc = querySnapshot.docs.first;
        var userData = userDoc.data() as Map<String, dynamic>;
        Get.snackbar('Sucess', 'Login Sucessfully');
        Get.to(()=>HomePage());
        box.write('loginUser', userData);
      } else {
        Get.snackbar('Error', 'User not fount , please register');
      }
    }
  }

/* fetchProducts() async {
      try {
        QuerySnapshot productSnapshot = await userCollection.get();
        final List<user> retrievedProducts = productSnapshot.docs
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
    }*/


}
