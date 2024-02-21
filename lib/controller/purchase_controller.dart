// key rzp_test_66HmRzsKtPyJR v
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../model/user_model.dart';
import 'login_controller.dart';

class PurchaseController extends GetxController{
 FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference orderCollection;
  late CollectionReference submitOrderCollection;
  
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    orderCollection = firestore.collection('order');
    submitOrderCollection =firestore.collection('submitOrder');

    super.onInit();
  }


  TextEditingController addressController = TextEditingController();
  double orderPrice=0;
  String iteamName='';
  String orderAddress='';
  submitOrder({required double price,required String iteam ,required String description}) {
    DocumentReference doc = submitOrderCollection.doc();
    SubmitUser submitUser=SubmitUser(name: iteam, number: price.toString());
    final submitJson = submitUser.toJson();
    doc.set(submitJson);
      orderPrice = price;
    iteamName = iteam;
    orderAddress = addressController.text;
    print('$iteamName  Rs : $price $description $orderAddress');
    Razorpay razorpay = Razorpay();
    razorpay.clear();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
 var options = {
      'key': 'rzp_test_66HmRzsKtPyJRv',
      'amount': orderPrice * 100,
      'name': iteamName,
      'description': description,
    };
    razorpay.open(options);
  }

  _handlePaymentSuccess(PaymentSuccessResponse response)  async {
    print('=================  transactionId ====================');
    print(response.paymentId);
    // Do something when payment succeeds
     await orderSuccess(transactionId: response.paymentId);
    Get.snackbar('Payment Sucess', 'All good ');

    print('Payment Sucess');
    print(response.orderId);
  }


  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Get.snackbar('Payment Failed', '${response.message}');
  }

  Future<void> orderSuccess({required String? transactionId}) async {

    User? dataUser = Get.find<LoginController>().loginUser;
    print('=============DataUserNaem==============');
    print(dataUser?.number);

   // String userNumber = Get.find<LoginController>().number;
    print('=======================================');
   // print(userNumber);
  //  print(userName);
    try {
      if (transactionId != null) {
        DocumentReference docRef = await orderCollection.add({
         'customer':dataUser?.name??'Dennis',
        'phone':dataUser?.number??'895435',
          'item':iteamName,
          'price': orderPrice,
          'address':orderAddress,
          'dateTime':DateTime.now().toString(),
          'transationId': transactionId,
        });

        print('order sucess: ${docRef.id}');
      }else{
        print('Failed');

      }
    } catch (e) {
      // Handle exception
    }
  }
}

