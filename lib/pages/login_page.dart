import 'package:client_side/controller/login_controller.dart';
import 'package:client_side/pages/home_page.dart';
import 'package:client_side/pages/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome Back',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.number,
                controller: ctrl.loginCtrl,
                decoration: InputDecoration(
                  hintText: 'Enter registered Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){ ctrl.LoginWithPhone(); ctrl.update();}, child: Text('Login Page')),
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                Get.to(()=>RegistrationPage());
              }, child: Text('New User ?'))
            ],
          ),
        ),
      );
    });
  }
}
