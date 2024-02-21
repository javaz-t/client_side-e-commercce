
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product/product_model.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {

    String product = Get.arguments['data'] ;
    print('=======================$product');
    return  Scaffold(
      body: Center(
       child: Text('ghf')),
      );

  }
}
